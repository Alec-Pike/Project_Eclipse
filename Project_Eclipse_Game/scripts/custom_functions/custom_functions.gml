//drawing the player's weapon
function draw_my_weapon() 
{

	//draw the weapon
		//get the weapon off the player's body
		var _xOffset = lengthdir_x(weaponOffsetDist, aimDir);
		var _yOffset = lengthdir_y(weaponOffsetDist, aimDir);

	//flip the weapon right
	var _weaponYscl = 1;

	if (aimDir > 90 && aimDir < 270) 
	{
		_weaponYscl = -1;
	}

	draw_sprite_ext(weapon.sprite, 0, x + _xOffset, centerY + _yOffset, 1, _weaponYscl, aimDir, c_white,1);

}

//damage calculation
	//damage create event
	function get_damaged_create(_hp)
	{
		hp = _hp
		//create the damage list
		damageList = ds_list_create()
	}
	
	//damage clean up event
	function get_damaged_cleanup()
	{
		//delete our damage list data structure to free memory
		ds_list_destroy(damageList);
	}


	//damage step event
	function get_damaged(_damageObj)
	{
		//receive damage for enemies

		if place_meeting(x,y,_damageObj)
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
			
					//tell damage instance to it has impacted
			
					_inst.hitConfirm = true;
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
		
		
		
	}

