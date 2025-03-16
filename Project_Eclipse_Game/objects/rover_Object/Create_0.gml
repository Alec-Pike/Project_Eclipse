// Inherit the parent event
event_inherited();
attackInterval = 200;
attackTimer = attackInterval;
shootTimer = 0;
	
	//weapon is a struct
	defaultGun = {
		bulletObj : roverTarget_Object,
		cooldown : 200,
		
	}
	
	weapon = defaultGun;
	
attacking[0] = roverAttackSide_Sprite;
attacking[1] = roverAttackUp_Sprite;
attacking[2] = roverAttackSide_Sprite;
attacking[3] = roverAttackDown_Sprite;