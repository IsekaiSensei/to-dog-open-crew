# export_crew_backpack.py
# Usage: blender --background --python export_crew_backpack.py
# Or run from Blender's Text Editor.
# Prototype only. Export/import must be independently verified in Blender and Godot.

import bpy
import os

OUT_PATH = os.path.join(os.path.expanduser("~"), "crew_backpack.glb")

def clear_scene():
    bpy.ops.object.select_all(action="SELECT")
    bpy.ops.object.delete(use_global=False)

def add_box(name, size, location, scale=(1, 1, 1)):
    bpy.ops.mesh.primitive_cube_add(size=size, location=location)
    obj = bpy.context.object
    obj.name = name
    obj.scale = scale
    return obj

def build_backpack():
    add_box("Pack_Body", 1.0, (0, 0, 1.0), (0.8, 0.5, 1.0))
    add_box("Pack_Lid", 0.5, (0, 0, 1.95), (0.75, 0.45, 0.3))
    add_box("Pack_FrontPocket", 0.5, (0, 0.28, 0.9), (0.6, 0.2, 0.6))
    add_box("Strap_Left", 0.5, (0.22, -0.28, 1.1), (0.12, 0.1, 0.8))
    add_box("Strap_Right", 0.5, (-0.22, -0.28, 1.1), (0.12, 0.1, 0.8))

    mat = bpy.data.materials.new("PackMat")
    mat.diffuse_color = (0.85, 0.55, 0.15, 1.0)
    for obj in bpy.context.scene.objects:
        if obj.type == "MESH":
            obj.data.materials.append(mat)

def export_glb():
    bpy.ops.export_scene.gltf(filepath=OUT_PATH, export_format="GLB")
    if not os.path.isfile(OUT_PATH):
        raise RuntimeError("GLB was not created")
    print("EXPORTED:", OUT_PATH)
    print("SIZE:", os.path.getsize(OUT_PATH), "bytes")

if __name__ == "__main__":
    clear_scene()
    build_backpack()
    export_glb()
    print("RESULT: CREATED / AVAILABLE — exported GLB, pending Godot import test")
    print("NEXT: Muse imports into Godot and reports runtime evidence")
