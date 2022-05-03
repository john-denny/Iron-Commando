// Bullet Spawning
if shoot_timer = 90
{
	instance_create_layer(x-25,y+12,"Bullets",OBJ_EBullet).speed = -10
	instance_create_layer(x-25,y-12,"Bullets",OBJ_EBullet).speed = -10
	shoot_timer = 0;
}
else shoot_timer += 1;

// Bullet Collision
if place_meeting(x,y,OBJ_Bullet)
{
	score += 100
	var collision_inst = instance_place(x, y, OBJ_Bullet);
	with(collision_inst)
	{
		instance_destroy();
	}
	instance_destroy()
	// Fixes random spawning Bug
	if place_meeting(x,y,OBJ_E1)
	{
		instance_destroy(other)
	}
	audio_play_sound(choose(explosion_1,explosion_2,explosion_3,explosion_4,explosion_5),1,false)
}


// If the ship reaches the end of the screen
if x < 0
{
	
	global.damage++
	instance_destroy();
}
