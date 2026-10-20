using UdonSharp;
using UnityEngine;

/// <summary>Slow ambient motion, strictly scenery: never moves or rotates a player.</summary>
[UdonBehaviourSyncMode(BehaviourSyncMode.None)]
public class GertechSpin : UdonSharpBehaviour
{
    public Vector3 degreesPerSecond = new Vector3(8f, 14f, 5f);
    private void Update()
    {
        transform.Rotate(degreesPerSecond * Time.deltaTime, Space.Self);
    }
}
