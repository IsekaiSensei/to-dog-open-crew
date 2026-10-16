// MIT. Workspace helper only; no game implementation.
using UnityEditor;
using UnityEditor.SceneManagement;
using UnityEngine;

public static class CreateWorkspace
{
    [MenuItem("Gertech/Create a fresh asset bench")]
    public static void CreateBench()
    {
        if (!EditorSceneManager.SaveCurrentModifiedScenesIfUserWantsTo()) return;
        EditorSceneManager.NewScene(NewSceneSetup.EmptyScene, NewSceneMode.Single);
        var cameraObject = new GameObject("Side-view Camera", typeof(Camera));
        var camera = cameraObject.GetComponent<Camera>();
        camera.orthographic = true;
        camera.orthographicSize = 2.75f;
        camera.clearFlags = CameraClearFlags.SolidColor;
        camera.backgroundColor = new Color(0.03f, 0.05f, 0.09f);
        cameraObject.transform.position = new Vector3(0, 2, -8);
        var lightObject = new GameObject("Bench Light", typeof(Light));
        lightObject.GetComponent<Light>().type = LightType.Directional;
        lightObject.transform.rotation = Quaternion.Euler(40, -25, 0);
        var floor = GameObject.CreatePrimitive(PrimitiveType.Cube);
        floor.name = "Bench floor";
        floor.transform.position = new Vector3(0, -0.1f, 0);
        floor.transform.localScale = new Vector3(8, 0.2f, 4);
        var source = AssetDatabase.LoadAssetAtPath<GameObject>("Assets/Gertech/Models/crystal_metal_tree_001.obj");
        if (source != null) PrefabUtility.InstantiatePrefab(source);
        else Debug.LogWarning("Tree OBJ not imported yet. Reimport Assets/Gertech/Models, then create a new bench.");
        Debug.Log("Asset bench created. Save it under Assets/Scenes. This scene contains no fairy or game logic.");
    }
}
