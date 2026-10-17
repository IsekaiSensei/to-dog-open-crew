#!/usr/bin/env python3
"""Local exact-file offline agent packet; no network, no dependencies, no auto-scan."""
from pathlib import Path, PurePosixPath
import csv, hashlib, io, sys, zipfile

ROOT=Path(__file__).resolve().parent
INPUT=ROOT/'inputs'
APPROVALS=ROOT/'APPROVED_INPUTS.tsv'
OUTPUT=ROOT/'TO_WORLD_AGENT_HANDOFF_LOCAL.zip'
SOURCE=('START_HERE.txt','ONE_PASTE_AGENT_PACKET.txt','RETURN_RECEIPT_TEMPLATE.txt')
EXPECTED=('relative_path','source_creator','rights_status','purpose')
RIGHTS=('PUBLIC-CLEARED','AUTHORIZED-PRIVATE')

def pack():
    files=[]
    for name in SOURCE:
        files.append((name,(ROOT/name).read_bytes(),'Bridge','PUBLIC-CLEARED','instructions'))
    if APPROVALS.exists():
        with APPROVALS.open(encoding='utf-8-sig',newline='') as f:
            reader=csv.DictReader(f,delimiter='\t')
            if tuple(reader.fieldnames or ()) != EXPECTED:
                raise ValueError('APPROVED_INPUTS.tsv must have four tab-separated headers: '+','.join(EXPECTED))
            seen=set()
            for n,item in enumerate(reader,2):
                path=(item.get('relative_path') or '').strip()
                if not path: continue
                p=PurePosixPath(path)
                if path.startswith('.') or p.is_absolute() or ':' in path or any(x in ('.','..') or x.startswith('.') for x in p.parts) or '\\' in path or path in seen:
                    raise ValueError('unsafe/duplicate input on row '+str(n))
                seen.add(path)
                creator=(item.get('source_creator') or '').strip()
                rights=(item.get('rights_status') or '').strip()
                purpose=(item.get('purpose') or '').strip()
                if not creator or rights not in RIGHTS or not purpose:
                    raise ValueError('missing creator, rights or purpose at row '+str(n))
                source=INPUT.joinpath(*p.parts)
                if any(d.is_symlink() for d in [source,*source.parents] if d!=ROOT.parent):
                    raise ValueError('symlink not allowed: '+path)
                if not source.is_file() or not source.resolve().is_relative_to(INPUT.resolve()):
                    raise ValueError('MISSING original input file: '+path)
                files.append(('inputs/'+path,source.read_bytes(),creator,rights,purpose))
    manifest=['relative_path\tbyte_size\tsha256\tsource_creator\trights_status\tpurpose']
    for name,data,creator,rights,purpose in files:
        cols=(name,str(len(data)),hashlib.sha256(data).hexdigest(),creator,rights,purpose)
        if any('\t' in x or '\n' in x or '\r' in x for x in cols):
            raise ValueError('unsafe manifest entry: '+name)
        manifest.append('\t'.join(cols))
    with zipfile.ZipFile(OUTPUT,'w',zipfile.ZIP_DEFLATED) as z:
        for name,data,_,_,_ in files: z.writestr(name,data)
        z.writestr('MANIFEST.tsv','\n'.join(manifest)+'\n')
    with zipfile.ZipFile(OUTPUT) as z:
        if z.testzip() is not None: raise ValueError('ZIP CRC failed')
    print('LOCAL-ONLY ZIP made. Approved source files:',len(files)-len(SOURCE))
    if len(files)==len(SOURCE): print('NO MEDIA INCLUDED: this is a text template, NOT a media handoff.')

if __name__=='__main__':
    try: pack()
    except (ValueError,OSError) as err:
        print('BLOCKED; DO NOT CLAIM DELIVERY:',err,file=sys.stderr)
        sys.exit(1)
