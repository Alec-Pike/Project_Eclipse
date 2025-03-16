// Inherit the parent event
event_inherited();
if(instance_exists(player_Object) && distance_to_object(player_Object)<400) {
    audio_play_sound(LaserShoot2_Sound,2,false, 5);
}