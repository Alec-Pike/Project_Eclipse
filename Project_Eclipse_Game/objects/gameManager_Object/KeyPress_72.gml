// "H" is for "Health" or "Heal"
if (keyboard_check(vk_alt)) {
    if instance_exists(player_Object) {
        player_Object.hp = player_Object.maxHP;
    }
    if instance_exists(ship_Object) {
        ship_Object.hp = ship_Object.maxHP;
    }
}