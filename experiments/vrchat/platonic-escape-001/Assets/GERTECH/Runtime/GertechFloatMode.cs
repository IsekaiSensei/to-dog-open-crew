using UdonSharp;
using UnityEngine;
using VRC.SDKBase;
using VRC.Udon.Common;

/// <summary>
/// Opt-in zero-G sightseeing. Hold Jump to rise, Drop to descend.
/// Standard locomotion handles horizontal travel. No headset roll, no forced movement.
/// Keep exactly one instance of this controller in the scene.
/// </summary>
[UdonBehaviourSyncMode(BehaviourSyncMode.None)]
public class GertechFloatMode : UdonSharpBehaviour
{
    public float verticalSpeed = 3f;
    public float verticalAcceleration = 7f;
    public float standardGravity = 1f;
    public float standardJumpImpulse = 3f;

    private bool _floating;
    private bool _rising;
    private bool _descending;
    private float _verticalVelocity;

    public void ToggleFloat()
    {
        VRCPlayerApi player = Networking.LocalPlayer;
        if (player == null || !player.IsValid()) return;
        _floating = !_floating;
        _verticalVelocity = 0f;
        _rising = false;
        _descending = false;
        player.SetVelocity(Vector3.zero);
        player.SetGravityStrength(_floating ? 0f : standardGravity);
        player.SetJumpImpulse(_floating ? 0f : standardJumpImpulse);
    }

    public void StopFloat()
    {
        VRCPlayerApi player = Networking.LocalPlayer;
        if (player == null || !player.IsValid()) return;
        _floating = false;
        _verticalVelocity = 0f;
        _rising = false;
        _descending = false;
        player.SetVelocity(Vector3.zero);
        player.SetGravityStrength(standardGravity);
        player.SetJumpImpulse(standardJumpImpulse);
    }

    public override void InputJump(bool pressed, UdonInputEventArgs args)
    {
        _rising = pressed;
    }

    public override void InputDrop(bool pressed, UdonInputEventArgs args)
    {
        _descending = pressed;
    }

    private void Update()
    {
        if (!_floating) return;
        VRCPlayerApi player = Networking.LocalPlayer;
        if (player == null || !player.IsValid()) return;
        float target = 0f;
        if (_rising && !_descending) target = verticalSpeed;
        if (_descending && !_rising) target = -verticalSpeed;
        _verticalVelocity = Mathf.MoveTowards(_verticalVelocity, target, verticalAcceleration * Time.deltaTime);
        Vector3 velocity = player.GetVelocity();
        velocity.y = _verticalVelocity;
        player.SetVelocity(velocity);
    }
}
