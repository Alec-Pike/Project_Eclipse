// Inherit the parent event
event_inherited();

// self-destruct
if (instance_exists(goal)) && (distance_to_object(goal) < 2.5) {
    // only do a harmful explosion if it contacted the goal
    explosion_effect = HarmfulExplosion_Object;
    instance_destroy(self);
}