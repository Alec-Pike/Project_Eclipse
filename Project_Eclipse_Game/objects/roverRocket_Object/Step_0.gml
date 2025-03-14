//move 
image_angle = dir-90;

    xspd = lengthdir_x(spd, dir);
    yspd = lengthdir_y(spd, dir);


    x += xspd;
    y += yspd;

//cleanup
    //destroy
    if (destroy == true)
    {
        //vfx
        //add a vfx here before it's destroyed
        instance_destroy(); //bullet destroyed
    }

//bullet out of range
if (point_distance(xstart,ystart,x,y) > maxDist) 
{
    destroy = true;
}

