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

	draw_sprite_ext(weapon.sprite, 0, centerX + _xOffset, centerY + _yOffset, 1, _weaponYscl, aimDir, c_white,1);

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
    
    //change bgm
    audio_stop_all();
    audio_play_sound(UpgradeMenuTheme_Sound,1,true);
    
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
        ["Bullets per shot ($20)", increaseBullets],
        ["Weapon cooldown ($5)", weaponCooldown],
        ["Max ship HP ($10)", maxShipHP],
        ["Ship turret ($20)", shipTurret],
        //["Ship shield ($10)", shipShield],
        ["Recover player HP ($3)", recoverPlayerHP],
        ["Recover ship HP ($5)", recoverShipHP],
        ["Next wave", start_wave]
    ];
    var camerax = camera_get_view_x(view_camera[0]);
    var cameray = camera_get_view_y(view_camera[0]);
    Menu(camerax+250, cameray+35, _options, "Buy upgrades");
    
}

///@desc used for starting the next wave
function start_wave() {
        
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
    global.enemiesToSpawn = 10 + floor(power(global.currentWave, 3));
    global.enemiesToKill = 10 + floor(power(global.currentWave, 3));
    if global.currentWave == 5 {
        // account for boss
        enemySpawner_Object.alarm[3] = 3500; 
        
    }
    
    //start spawning enemies again
    enemySpawner_Object.spawnInterval = enemySpawner_Object.defaultInterval;
    enemySpawner_Object.spedUp = false;
    enemySpawner_Object.alarm[0] = enemySpawner_Object.spawnInterval;
    
    global.betweenRounds = false;
    
    // change bgm
    audio_stop_all();
    audio_play_sound(LevelTheme_Sound,1,true);
}

#endregion

#region upgrades

//refilling the player's HP
function maxPlayerHP() {
    
    if (global.scrapCount >= 5) {
        //decrease scrap
        global.scrapCount -= 5;
        //play sfx
        audio_play_sound(SelectQuit_Sound, 2, false);
        //increase max hp
	    player_Object.maxHP += 20;
        player_Object.hp += 20;
    } else { 
        // play "you can't select this" sfx
        audio_play_sound(SelectStart_Sound,2,false);
    }
}

function increaseBullets() {
	
    if (global.scrapCount >= 20) && (player_Object.bulletCount < 5) {
        //decrease scrap
        global.scrapCount -= 20;
        //play sfx 
        audio_play_sound(SelectQuit_Sound, 2, false);
	    //increase the number of bullets I believe
	    player_Object.bulletCount = min(player_Object.bulletCount + 1, 5); // Limit max bullets (adjust as needed)
    } else { 
        // play "you can't select this" sfx
        audio_play_sound(SelectStart_Sound,2,false);
    }
}

function weaponCooldown() {

    if (global.scrapCount >= 5) && (player_Object.wCooldown > 3) {
        // decrease scrap
        global.scrapCount -= 5;
        //play sfx 
        audio_play_sound(SelectQuit_Sound, 2, false);
       	//Decrease the weapon Cooldown so that the player can shoot faster
       	draw_text(player_Object.x, player_Object.y, string(player_Object.wCooldown));
       	player_Object.wCooldown -= 4; //this does not seem to be working
       	player_Object.weapon.cooldown = player_Object.wCooldown;
    } else {
        // play "you can't select this" sfx
        audio_play_sound(SelectStart_Sound,2,false);
    }
}

function maxShipHP() {

    if (global.scrapCount >= 10) {
        //decrease scrap
        global.scrapCount -= 10;
        //play sfx
        audio_play_sound(SelectQuit_Sound, 2, false);
        //upgrade ship
        ship_Object.maxHP += 100;
        ship_Object.hp += 100;
    } else {
        // play "you can't select this" sfx
        audio_play_sound(SelectStart_Sound,2,false);
    }
}

function shipTurret() {

    if (global.scrapCount >= 20) && (ship_Object.wCooldown > 5) {
        //decrease scrap
        global.scrapCount -= 20;
        //play sfx
        audio_play_sound(SelectQuit_Sound, 2, false);
        // add ship turret
        if !ship_Object.turretUnlocked {
            ship_Object.turretUnlocked = true;
        } else {
            ship_Object.wCooldown -= 15;
        }
    } else {
        // play "you can't select this" sfx
        audio_play_sound(SelectStart_Sound,2,false);
    }
}
/*
function shipShield() {
	
    if (global.scrapCount >= 10) {
        //decrease scrap
        global.scrapCount -= 10;
        //TODO add sfx
        //TODO add ship shield
    } else {
        //TODO play "you can't select this" sfx
    }
}
*/
function recoverPlayerHP() {
    if (global.scrapCount >= 3) {
        //decrease scrap
        global.scrapCount -= 3;
        //play sfx
        audio_play_sound(SelectQuit_Sound, 2, false);
        //heal player
        player_Object.hp += 20;
        //make sure their hp doesn't exceed the max
        if (player_Object.hp > player_Object.maxHP) {
            player_Object.hp = player_Object.maxHP;
        }
    } else {
        // play "you can't select this" sfx
        audio_play_sound(SelectStart_Sound,2,false);
    }
}

function recoverShipHP() {
    if (global.scrapCount >= 5) {
            //decrease scrap
            global.scrapCount -= 5;
            //play sfx
            audio_play_sound(SelectQuit_Sound, 2, false);
            //heal player
            ship_Object.hp += 100;
            //make sure their hp doesn't exceed the max
            if (ship_Object.hp > ship_Object.maxHP) {
                ship_Object.hp = ship_Object.maxHP;
            }
    } else {
            // play "you can't select this" sfx
            audio_play_sound(SelectStart_Sound,2,false);
    }
}

#endregion
/*
///@desc display the controls in the main menu
function viewControls() {
    // get rid of the other menu
    while instance_exists(menu_Object) {
        instance_destroy(menu_Object);
    }
    var _info = "Controls\n- Move: WASD keys\n- Aim: mouse\n- Shoot: left mouse button\n- Dash: spacebar";
    Menu(400, 250, [["Start", room_goto_next]], _info);
    with menu_Object {
        heightLine *= 6.2;
        heightFull *= 2.8;
    }
}
*/

