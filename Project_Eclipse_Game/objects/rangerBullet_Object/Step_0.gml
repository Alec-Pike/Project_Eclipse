//move 

	xspd = lengthdir_x(spd, dir);
	yspd = lengthdir_y(spd, dir);


	x += xspd;
	y += yspd;
	
	
	
//cleanup

    //hit confirm destroy
    if hitConfirm == true && enemyDestroy == true { destroy = true; };
        // now ranger bullets will not phase through player
	
//cleanup
	//destroy
	if (destroy == true)
	{
		//vfx
		//add a vfx here before it's destroyed
		instance_destroy(); //bullet destroyed
	}

	// collision
	if place_meeting(x,y, solidWall_object) 
	{
		destroy = true;
	}
	
	//bullet out of range
	if (point_distance(xstart,ystart,x,y) > maxDist) 
	{
		destroy = true;
	}
	
	
	
	