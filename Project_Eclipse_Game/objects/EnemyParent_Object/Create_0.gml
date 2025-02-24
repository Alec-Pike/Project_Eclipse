// movement settings
mp_potential_settings(30, 5, move_speed+4, true);

// randomly select target (player or ship)
//TODO: change the 2nd argument of choose() to the ship object
goal = choose(player_Object, player_Object);