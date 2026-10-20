using UdonSharp;
using UnityEngine;
using VRC.SDKBase;

/// <summary>At-a-glance controls: Float/Normal, Return Home, or Emergency Reset.</summary>
[UdonBehaviourSyncMode(BehaviourSyncMode.None)]
public class GertechRoomControl : UdonSharpBehaviour
{
    public GertechFloatMode floatMode;
    public Transform homeArrival;
    public bool isHomeButton;

    public override void Interact()
    {
        if (isHomeButton)
        {
            VRCPlayerApi player = Networking.LocalPlayer;
            if (player == null || !player.IsValid() || homeArrival == null) return;
            if (floatMode != null) floatMode.StopFloat();
            player.TeleportTo(homeArrival.position, homeArrival.rotation);
        }
        else if (floatMode != null)
        {
            floatMode.ToggleFloat();
        }
    }
}
