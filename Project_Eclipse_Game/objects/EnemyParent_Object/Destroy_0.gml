instance_create_layer(x, y-sprite_yoffset/2, "Instances", explosion_effect);

if (random(1) <= probAnyScrap) {
    if (random(1) <= probBigScrap) {
        instance_create_layer(x, y-sprite_yoffset/2, "Instances", scrapBig_Object);
    } else {
        instance_create_layer(x, y-sprite_yoffset/2, "Instances", scrapSmall_Object);
    }
}

global.enemiesToKill--;