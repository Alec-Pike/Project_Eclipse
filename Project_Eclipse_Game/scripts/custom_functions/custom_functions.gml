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
	function get_damaged_create(_hp = 10, _iframes = false)
	{
		hp = _hp
        
        // get the i-frames
        if _iframes == true {
            iframeTimer = 0;
            iframeNumber = 60;
        }
        
		//create the damage list
        if _iframes == false { 
            damageList = ds_list_create()
        }
	}
	
	//damage clean up event
    /// @desc DO NOT USE if your object has i-frames!!!
	function get_damaged_cleanup()
	{
		//delete our damage list data structure to free memory
		ds_list_destroy(damageList);
	}


	//damage step event
	function get_damaged(_damageObj, _iframes=false)
	{
        
        //special exit for iframe timer
        if _iframes && iframeTimer > 0 {
            iframeTimer--;
            
            // flicker visual
            if iframeTimer mod 5 == 0 {
                if image_alpha == 1 {
                    image_alpha = 0;
                } else {
                    image_alpha = 1;
                }
            }
            
            exit;
        }
        
        // make sure iframe blinking stops
        if _iframes {
            image_alpha = 1;
        }
        
		//receive damage for enemies

		if place_meeting(x,y,_damageObj)
		{	
		//getting a list of the damage instances
			var _instList = ds_list_create();
		
			//create ds list and copy instances to it
			instance_place_list(x,y,_damageObj, _instList, false);
		
			//get size of list
			var _listSize = ds_list_size(_instList);
		
			//loop through the list
            var _hitConfirm = false;
            
			for (var i = 0; i < _listSize; i++) {
		
				//get a damage object instance from the list
				var _inst = ds_list_find_value(_instList,i);
			
				//check if this instance is already in damageList
				if _iframes == true || ds_list_find_index(damageList, _inst) == -1 {
				
					//add new dmg instance
                    if _iframes == false { 
                        ds_list_add(damageList, _inst);
                    }
				
					//take damage from specific instance
					hp -= _inst.damage;
                    
                    _hitConfirm = true;
			
					//tell damage instance to it has impacted
			
					_inst.hitConfirm = true;
				}
			}
            
            //set iframes if we were hit
            if _iframes == true && _hitConfirm == true {
                iframeTimer = iframeNumber;
            }
            
			//free memory by destroying the ds list
			ds_list_destroy(_instList);
		}

	
        if _iframes == false {
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
		
		
		
	}

#region manage waves

///@desc used for processing the end of each wave of enemies
function end_wave() {
    
    //TODO: sound effect here?
    
    //TODO: change bgm
    
    //graphics display helpers
    var camerax = camera_get_view_x(view_camera[0]);
    var cameray = camera_get_view_y(view_camera[0]);
    
    //display victory message
    Menu(camerax+250, cameray+125, [["Next", upgrade_menu]], "WAVE CLEAR!");
    
}

///@desc spawn the upgrade menu
function upgrade_menu() {
    // get rid of the wave clear menu
    while instance_exists(menu_Object) {
        instance_destroy(menu_Object);
    }
     
    // spawn upgrade menu
    var _options = [
        ["Max player HP ($5)", maxPlayerHP],
        ["Bullets per shot ($10)", -1],
        ["Weapon cooldown ($5)", -1],
        ["Max ship HP ($10)", -1],
        ["Ship turret ($10)", -1],
        ["Ship shield ($10)", -1],
        ["Recover player HP ($3)", -1],
        ["Recover ship HP ($5)", -1],
        ["Next wave", start_wave]
    ];
    var camerax = camera_get_view_x(view_camera[0]);
    var cameray = camera_get_view_y(view_camera[0]);
    Menu(camerax+250, cameray+35, _options, "Buy upgrades");
    
}

///@desc used for starting the next wave
function start_wave() {
    //TODO: fade screen
        
    // reset player position
    if instance_exists(player_Object) {
        player_Object.x = 1152;
        player_Object.y = 768;
    }
    
    // get rid of the upgrade menu
    while instance_exists(menu_Object) {
        instance_destroy(menu_Object);
    }
    
    //reset global vars
    global.currentWave++;
    global.enemiesToSpawn = 10 + global.currentWave*5;
    global.enemiesToKill = 10 + global.currentWave*5;
    
    //start spawning enemies again
    enemySpawner_Object.alarm[0] = enemySpawner_Object.spawnInterval;
    
    global.betweenRounds = false;
}

#endregion

#region upgrades
//TODO: implement upgrades

//refilling the player's HP
function maxPlayerHP() {

	player_Object.hp = 100; //player hp back to 100
}
#endregion