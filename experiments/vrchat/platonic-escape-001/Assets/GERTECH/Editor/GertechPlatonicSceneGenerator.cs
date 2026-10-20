#if UNITY_EDITOR
using System;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using UnityEditor.SceneManagement;
using UnityEngine.SceneManagement;
using UdonSharpEditor;

/// <summary>
/// EDITOR ONLY: Generates five real Platonic-solid rooms and links VRChat UdonSharp teleporters.
/// No meshes or C# run-time generation happens in VRChat; scene geometry is baked by this tool.
/// </summary>
public static class GertechPlatonicSceneGenerator
{
    private const float Radius = 10.0f;
    private static readonly string[] Names = { "TETRAHEDRON", "CUBE", "OCTAHEDRON", "DODECAHEDRON", "ICOSAHEDRON" };
    private static readonly int[] DoorCounts = { 2, 4, 6, 8, 10 };
    private static readonly Color[] RoomColors = {
        new Color(0.27f,0.53f,0.83f), new Color(0.36f,0.31f,0.77f),
        new Color(0.24f,0.68f,0.68f), new Color(0.50f,0.37f,0.72f),
        new Color(0.55f,0.55f,0.87f)
    };
    private struct Face { public int[] ids; public Vector3 normal; public Vector3 center; }
    private class DoorSpec { public GertechPortal door; public int room; public int number; }

    [MenuItem("Tools/GERTECH/Generate Platonic Escape Prototype 001")]
    public static void Generate()
    {
        if (!EditorSceneManager.SaveCurrentModifiedScenesIfUserWantsTo()) return;
        EditorSceneManager.NewScene(NewSceneSetup.EmptyScene, NewSceneMode.Single);
        const string rootPath = "Assets/GERTECH/Generated";
        if (!AssetDatabase.IsValidFolder(rootPath)) AssetDatabase.CreateFolder("Assets/GERTECH", "Generated");

        Material[] shells = new Material[5];
        for (int i=0;i<5;i++) shells[i] = MakeMaterial(rootPath, "Solid_"+i, RoomColors[i] * 0.55f);
        Material rim = MakeMaterial(rootPath,"GoldEdges",new Color(0.92f,0.77f,0.35f));
        Material portalMat = MakeMaterial(rootPath,"PortalBlue",new Color(0.13f,0.68f,0.94f));
        Material floatMat = MakeMaterial(rootPath,"FloatTeal",new Color(0.23f,0.88f,0.76f));
        Material homeMat = MakeMaterial(rootPath,"HomeGold",new Color(0.92f,0.72f,0.25f));
        Material sculptureMat = MakeMaterial(rootPath,"SculptureViolet",new Color(0.53f,0.31f,0.91f));

        GameObject world = new GameObject("GERTECH_Platonic_Escape_001");
        GameObject controllerGO = new GameObject("Local_Float_Controller");
        controllerGO.transform.SetParent(world.transform);
        GertechFloatMode pilot = controllerGO.AddUdonSharpComponent<GertechFloatMode>();
        pilot.ApplyProxyModifications();

        Transform[] arrivals = new Transform[5];
        var portalSpecs = new List<DoorSpec>();

        for (int roomIndex=0;roomIndex<5;roomIndex++)
        {
            GameObject roomGO = new GameObject(roomIndex.ToString()+"_"+Names[roomIndex]);
            roomGO.transform.SetParent(world.transform);
            roomGO.transform.position = new Vector3(roomIndex * 36f, 0f, 0f);
            // Geometry tilts; player HMD orientation and VRChat gravity axis never roll.
            roomGO.transform.rotation = roomIndex == 1 ? Quaternion.identity :
                Quaternion.Euler((roomIndex*13)%37,roomIndex*38,(roomIndex*17)%42);

            List<Vector3> vertices = CreateVertices(roomIndex);
            List<Face> faces = MakeHullFaces(vertices);
            int expectedFaces = new int[]{4,6,8,12,20}[roomIndex];
            if (faces.Count != expectedFaces) throw new Exception(Names[roomIndex]+" expected "+expectedFaces+" faces, got "+faces.Count);
            float maxLen = 0f;
            foreach(Vector3 v in vertices) maxLen = Mathf.Max(maxLen, v.magnitude);
            float scale = Radius/maxLen;

            for (int faceIndex=0;faceIndex<faces.Count;faceIndex++)
            {
                Face face = faces[faceIndex];
                Mesh faceMesh = new Mesh();
                faceMesh.name = Names[roomIndex]+"_Face"+faceIndex;
                Vector3[] vv = new Vector3[face.ids.Length];
                for (int j=0;j<face.ids.Length;j++) vv[j] = vertices[face.ids[j]] * scale;
                int[] triangles = new int[(vv.Length-2)*3];
                for (int t=0;t<vv.Length-2;t++)
                {
                    // Inward-facing winding: visitors stand inside the shell.
                    triangles[t*3] = 0;
                    triangles[t*3+1] = t+2;
                    triangles[t*3+2] = t+1;
                }
                faceMesh.vertices = vv;
                faceMesh.triangles = triangles;
                faceMesh.RecalculateNormals();
                faceMesh.RecalculateBounds();
                string file = rootPath+"/"+Names[roomIndex]+"_face_"+faceIndex+".asset";
                ReplaceAsset(faceMesh,file);
                GameObject wall = new GameObject("Face_"+faceIndex);
                wall.transform.SetParent(roomGO.transform,false);
                wall.AddComponent<MeshFilter>().sharedMesh = faceMesh;
                wall.AddComponent<MeshRenderer>().sharedMaterial = shells[roomIndex];
                wall.AddComponent<MeshCollider>().sharedMesh = faceMesh;
            }

            // Small horizontal landing pad guarantees a safe resting position on arrival.
            GameObject pad = Primitive("LandingPad",PrimitiveType.Cylinder,roomGO.transform,
                new Vector3(0f,-2.0f,0f),new Vector3(2.8f,0.24f,2.8f),homeMat);
            // Landing pad must align to the WORLD spawn, not the tilted room axes.
            pad.transform.position = roomGO.transform.position + Vector3.up * -2f;
            pad.transform.rotation = Quaternion.identity;
            GameObject arrivalGO = new GameObject("Arrival_Safe");
            arrivalGO.transform.SetParent(world.transform);
            arrivalGO.transform.position = roomGO.transform.position+Vector3.up*(-1.58f);
            arrivalGO.transform.rotation = Quaternion.Euler(0,roomIndex*67,0);
            arrivals[roomIndex] = arrivalGO.transform;

            // Decorative spinning small solid to give explorers something to observe.
            GameObject gem = Primitive("SpinningArtifact",PrimitiveType.Cube,roomGO.transform,
                new Vector3(0f,3.4f,0f),Vector3.one*0.9f,sculptureMat);
            UnityEngine.Object.DestroyImmediate(gem.GetComponent<Collider>());
            GertechSpin spin = gem.AddUdonSharpComponent<GertechSpin>();
            spin.ApplyProxyModifications();

            // Portal count is intentionally not announced to players.
            List<int> order = new List<int>();
            for (int j=0;j<faces.Count;j++) order.Add(j);
            System.Random rng = new System.Random(1701+roomIndex*47);
            for (int j=order.Count-1;j>0;j--) { int k=rng.Next(j+1); int temp=order[j]; order[j]=order[k]; order[k]=temp; }
            for (int p=0;p<DoorCounts[roomIndex];p++)
            {
                Face face = faces[order[p]];
                Vector3 pos = face.center*scale - face.normal*0.7f;
                GameObject doorGO = new GameObject("Unknown_Portal_"+p);
                doorGO.transform.SetParent(roomGO.transform,false);
                doorGO.transform.localPosition = pos;
                doorGO.transform.localRotation = Quaternion.FromToRotation(Vector3.up,-face.normal);
                SphereCollider trigger = doorGO.AddComponent<SphereCollider>();
                trigger.radius = 1.45f;
                trigger.isTrigger = true;
                GertechPortal portal = doorGO.AddUdonSharpComponent<GertechPortal>();
                portalSpecs.Add(new DoorSpec { door=portal, room=roomIndex, number=p });
                // Flat, opaque colored portal marker; no costly cameras or render textures.
                GameObject disk = Primitive("Portal_Face",PrimitiveType.Cylinder,doorGO.transform,
                    Vector3.zero,new Vector3(1.0f,0.025f,1.0f),portalMat);
                UnityEngine.Object.DestroyImmediate(disk.GetComponent<Collider>());
                GameObject pupil = Primitive("Glyph",PrimitiveType.Cube,doorGO.transform,
                    new Vector3(0,0.055f,0),new Vector3(0.25f,0.06f,0.64f),homeMat);
                UnityEngine.Object.DestroyImmediate(pupil.GetComponent<Collider>());
            }

            // Two control beacons are always reachable on the pad in every room.
            CreateControl(roomGO.transform,"FLOAT / NORMAL",new Vector3(-1.3f,-1.0f,0f),
                floatMat,pilot,arrivals[0],false);
            // home arrival array element 0 exists after room 0 is constructed.
            CreateControl(roomGO.transform,"HOME / RESET",new Vector3(1.3f,-1.0f,0f),
                homeMat,pilot,arrivals[0],true);
            CreateText(roomGO.transform,Names[roomIndex],new Vector3(0f,0.5f,2.5f));
            CreateText(roomGO.transform,"FLOAT: Jump UP / Drop DOWN",new Vector3(0f,-0.1f,2.5f));
            CreateText(roomGO.transform,"GOLD = HOME    BLUE = PORTAL",new Vector3(0f,-0.6f,2.5f));
        }

        foreach (DoorSpec spec in portalSpecs)
        {
            int count = 1 + spec.number % 3; // Number of destinations is not visibly advertised.
            spec.door.possibleArrivals = new Transform[count];
            for (int k=0;k<count;k++)
            {
                int nextRoom = (spec.room + 1 + (spec.number + k*2)%4)%5;
                spec.door.possibleArrivals[k] = arrivals[nextRoom];
            }
            spec.door.ApplyProxyModifications();
        }

        // The VRChat SDK must supply a scene descriptor; see included README.
        // Keeping that step explicit avoids instantiating incompatible prefab versions.
        Selection.activeGameObject = world;
        EditorSceneManager.MarkSceneDirty(SceneManager.GetActiveScene());
        string savePath = rootPath+"/Platonic_Escape_001.unity";
        EditorSceneManager.SaveScene(SceneManager.GetActiveScene(),savePath);
        AssetDatabase.SaveAssets();
        AssetDatabase.Refresh();
        EditorUtility.DisplayDialog("GERTECH Rooms Generated",
            "Five Platonic rooms and their UdonSharp portals were created. " +
            "NEXT: VRChat SDK > Show Control Panel > Builder > Add a VRCSceneDescriptor, " +
            "then set spawn to the CUBE arrival in the Hierarchy. " +
            "Read README before Build & Test.","OK");
    }

    private static void CreateControl(Transform parent,string name,Vector3 at,Material mat,
                                      GertechFloatMode pilot,Transform home,bool goHome)
    {
        GameObject button=Primitive(name,PrimitiveType.Sphere,parent,at,Vector3.one*0.7f,mat);
        // Keep collider: required for Interact.
        GertechRoomControl ctrl=button.AddUdonSharpComponent<GertechRoomControl>();
        ctrl.floatMode=pilot;
        ctrl.homeArrival=home;
        ctrl.isHomeButton=goHome;
        ctrl.ApplyProxyModifications();
    }

    private static void CreateText(Transform parent,string text,Vector3 at)
    {
        GameObject go=new GameObject("LABEL_"+text);
        go.transform.SetParent(parent,false);
        go.transform.localPosition=at;
        go.transform.localRotation=Quaternion.identity;
        TextMesh tm=go.AddComponent<TextMesh>();
        tm.text=text;
        tm.fontSize=45;
        tm.characterSize=0.06f;
        tm.anchor=TextAnchor.MiddleCenter;
        tm.alignment=TextAlignment.Center;
        tm.color=Color.white;
    }

    private static GameObject Primitive(string name,PrimitiveType type,Transform parent,
                                         Vector3 localPosition,Vector3 localScale,Material material)
    {
        GameObject go=GameObject.CreatePrimitive(type);
        go.name=name;
        go.transform.SetParent(parent,false);
        go.transform.localPosition=localPosition;
        go.transform.localScale=localScale;
        go.GetComponent<MeshRenderer>().sharedMaterial=material;
        return go;
    }

    private static Material MakeMaterial(string folder,string name,Color color)
    {
        string path=folder+"/"+name+".mat";
        Material material=AssetDatabase.LoadAssetAtPath<Material>(path);
        if (material==null)
        {
            Shader shader=Shader.Find("Unlit/Color");
            if (shader==null) shader=Shader.Find("Standard");
            material=new Material(shader);
            AssetDatabase.CreateAsset(material,path);
        }
        material.color=color;
        material.enableInstancing=true;
        EditorUtility.SetDirty(material);
        return material;
    }

    private static void ReplaceAsset(Mesh mesh,string path)
    {
        AssetDatabase.DeleteAsset(path);
        AssetDatabase.CreateAsset(mesh,path);
    }

    private static List<Vector3> CreateVertices(int type)
    {
        var v=new List<Vector3>();
        float p=(1f+Mathf.Sqrt(5f))/2f;
        if (type==0)
        {
            v.Add(new Vector3(1,1,1));v.Add(new Vector3(-1,-1,1));
            v.Add(new Vector3(-1,1,-1));v.Add(new Vector3(1,-1,-1));
        }
        else if (type==1 || type==3)
        {
            for (int x=-1;x<=1;x+=2)
                for (int y=-1;y<=1;y+=2)
                    for (int z=-1;z<=1;z+=2) v.Add(new Vector3(x,y,z));
            if (type==3)
            {
                for (int a=-1;a<=1;a+=2) for (int b=-1;b<=1;b+=2)
                {
                    v.Add(new Vector3(0,a/p,b*p));
                    v.Add(new Vector3(a/p,b*p,0));
                    v.Add(new Vector3(b*p,0,a/p));
                }
            }
        }
        else if (type==2)
        {
            for (int sign=-1;sign<=1;sign+=2)
            {
                v.Add(new Vector3(sign,0,0));v.Add(new Vector3(0,sign,0));v.Add(new Vector3(0,0,sign));
            }
        }
        else if (type==4)
        {
            for (int a=-1;a<=1;a+=2) for (int b=-1;b<=1;b+=2)
            {
                v.Add(new Vector3(0,a,b*p));
                v.Add(new Vector3(a,b*p,0));
                v.Add(new Vector3(b*p,0,a));
            }
        }
        return v;
    }

    private static List<Face> MakeHullFaces(List<Vector3> v)
    {
        var answer=new List<Face>();
        var known=new HashSet<string>();
        const float epsilon=0.001f;
        for (int a=0;a<v.Count;a++) for (int b=a+1;b<v.Count;b++) for (int c=b+1;c<v.Count;c++)
        {
            Vector3 n=Vector3.Cross(v[b]-v[a],v[c]-v[a]);
            if (n.sqrMagnitude<epsilon*epsilon) continue;
            n.Normalize();
            bool above=false,below=false;
            for (int d=0;d<v.Count;d++)
            {
                float dist=Vector3.Dot(n,v[d]-v[a]);
                if (dist>epsilon) above=true;
                if (dist < -epsilon) below=true;
            }
            if (above && below) continue;
            var faceIDs=new List<int>();
            for (int d=0;d<v.Count;d++)
                if (Mathf.Abs(Vector3.Dot(n,v[d]-v[a]))<=epsilon) faceIDs.Add(d);
            if (faceIDs.Count<3) continue;
            faceIDs.Sort();
            string key=string.Join("_",faceIDs.ConvertAll(i=>i.ToString()).ToArray());
            if (!known.Add(key)) continue;
            Vector3 center=Vector3.zero;
            foreach (int id in faceIDs) center+=v[id];
            center/=faceIDs.Count;
            if (Vector3.Dot(n,center)<0f) n=-n;
            Vector3 tangent=Vector3.Cross(n,Vector3.up);
            if (tangent.sqrMagnitude<0.01f) tangent=Vector3.Cross(n,Vector3.right);
            tangent.Normalize();
            Vector3 bitangent=Vector3.Cross(n,tangent);
            faceIDs.Sort((i,j) => {
                Vector3 vi=v[i]-center;Vector3 vj=v[j]-center;
                float ai=Mathf.Atan2(Vector3.Dot(vi,bitangent),Vector3.Dot(vi,tangent));
                float aj=Mathf.Atan2(Vector3.Dot(vj,bitangent),Vector3.Dot(vj,tangent));
                return ai.CompareTo(aj);
            });
            answer.Add(new Face { ids=faceIDs.ToArray(),normal=n,center=center });
        }
        return answer;
    }
}
#endif
