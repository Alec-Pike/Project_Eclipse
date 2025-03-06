//receive damage for enemies

	if place_meeting(x,y,DamageEnemy_Object)
	{	
	//getting a list of the damage instances
		var _instList = ds_list_create();
		
		//create ds list and copy instances to it
		instance_place_list(x,y,DamageEnemy_Object, _instList, false);
		
		//get size of list
		var _listSize = ds_list_size(_instList);
		
		//loop through the list
		for (var i = 0; i < _listSize; i++) {
		
			//get a damage object instance from the list
			var _inst = ds_list_find_value(_instList,i);
			
			//check if this instance is already in damageList
			if ds_list_find_index(damageList, _inst) == -1 {
				
				//add new dmg instance
				ds_list_add(damageList, _inst);
				
				//take damage from specific instance
				hp -= _inst.damage;
			
				//tell damage instance to destroy itself
			
				_inst.destroy = true;
			}
		}
		//free memory by destroying the ds list
		ds_list_destroy(_instList);
	}

	
	//clear damage list of objs that do not exist anymore or arent touching anymore
	var _damageListSize = ds_list_size(damageList);
	for(var i = 0; i < _damageListSize; i++) {
	
		//if not touching the damage instance anymore, remove it from the list AND set the loop back 1 position
		var _inst = ds_list_find_value(damageList,i);
		if !instance_exists(_inst) || !place_meeting (x,y,_inst) {
		
			ds_list_delete(damageList, i);
			i--;
			_damageListSize--;
		}
		
	}


// check if dead
if (hp <= 0) {
    instance_destroy(self);
}

// move
// This line moves the enemy move_speed steps towards the goal
// while avoiding all obstacles.
// For the rammer (hovering enemy), just change the last param to solidWall_object
if (distance_to_object(goal) > stopDistance) {
    mp_potential_step_object(goal.x, goal.y, move_speed, wall_Object);
}

//sprite control
#region
    // make sure sprite is facing correct direction
    // this line will need to be altered for the ranger, probably the boss too
    face = round(direction/90); //direction has a degree like 90, 180 or 270 and so on based on mouse direction
    if face == 4 { face = 0; }; //since a degree from direction like 350 will round up to 360, so when it does 360/9 it gets an index of 4 which we don't have
    //face has to be either 0,1,2,3 to use the code from create that changes sprite/changes player direction
    
    //animate
    if (hspeed == 0 && vspeed == 0) { //we don't have animation yet lol
        image_index = 0; //if enemy no move, the current sprite stays in frame 1, which does not move because it's a still image
    }
    
    //set the enemy sprite
    mask_index = sprite[3];
    sprite_index = sprite[face];
#endregion
