//move 

	xspd = lengthdir_x(spd, dir);
	yspd = lengthdir_y(spd, dir);


	x += xspd;
	y += yspd;
	
	
	
	
//cleanup

	//hit confirm destroy
	if hitConfirm == true && enemyDestroy == true { destroy = true; };



	//destroy
	if (destroy == true)
	{
		//vfx
		//add a vfx here before it's destroyed
		instance_destroy(); //bullet destroyed
	}

	// collision
	if place_meeting(x,y, wallParent_object) 
	{
		destroy = true;
	}
	
	//bullet out of range
	if (point_distance(xstart,ystart,x,y) > maxDist) 
	{
		destroy = true;
	}
	
	
	
	