if global.enemiesToSpawn > 0 {
    instance_create_layer(x, y, "Instances", flea_object);
    global.enemiesToSpawn--;
}