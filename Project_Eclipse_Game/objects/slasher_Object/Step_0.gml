//receive damage

if place_meeting(x,y,DamageEnemy_Object)
{
	var _inst = instance_place(x,y,DamageEnemy_Object);
	
	//take damage from specific instance
	hp -= _inst.damage;
	
	//tell the damage instance to destroy itself
	
	_inst.destroy = true;	
}