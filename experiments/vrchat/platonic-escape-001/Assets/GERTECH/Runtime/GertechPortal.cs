using UdonSharp;
using UnityEngine;
using VRC.SDKBase;

/// <summary>
/// A locally routed, walk-up/interactable VRChat teleporter.
/// Multiple targets mean the same entrance may land in different rooms.
/// Teleport targets are positioned at safe, empty room centers.
/// </summary>
[UdonBehaviourSyncMode(BehaviourSyncMode.None)]
public class GertechPortal : UdonSharpBehaviour
{
    public Transform[] possibleArrivals;
    public bool traverseOnTouch = true;
    public float minimumSecondsBetweenUses = 1.5f;

    private float _lastUsed = -99f;

    public override void Interact()
    {
        Traverse();
    }

    public override void OnPlayerTriggerEnter(VRCPlayerApi player)
    {
        if (!traverseOnTouch || player == null || !player.isLocal) return;
        Traverse();
    }

    public void Traverse()
    {
        VRCPlayerApi player = Networking.LocalPlayer;
        if (player == null || !player.IsValid()) return;
        if (Time.time - _lastUsed < minimumSecondsBetweenUses) return;
        if (possibleArrivals == null || possibleArrivals.Length == 0) return;

        int index = Random.Range(0, possibleArrivals.Length);
        Transform arrival = possibleArrivals[index];
        if (arrival == null) return;
        _lastUsed = Time.time;
        player.SetVelocity(Vector3.zero);
        // World remains upright to the headset. Tilted room geometry creates the illusion.
        player.TeleportTo(arrival.position, arrival.rotation);
    }
}
