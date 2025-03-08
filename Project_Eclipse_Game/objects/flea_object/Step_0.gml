// Inherit the parent event
event_inherited();

// self-destruct
if (instance_exists(goal)) && (distance_to_object(goal) < 2.5) {
    instance_destroy(self);
}