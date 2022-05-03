// Bullet Spawning
if shoot_timer = 120
{
	
	for (var i = -1; i < 2; i++)
	{
		inst = instance_create_layer(x,y,"Bullets",OBJ_EBullet)
		inst.speed = -10
		inst.direction = 10 * i
		inst.image_angle = 10 * i 
	}
	shoot_timer = 0;
}
else shoot_timer += 1;

// Bullet Collision
if place_meeting(x,y,OBJ_Bullet)
{
	score += 300
	var collision_inst = instance_place(x, y, OBJ_Bullet);
	with(collision_inst)
	{
		instance_destroy();
	}
	instance_destroy()
	audio_play_sound(choose(explosion_1,explosion_2,explosion_3,explosion_4,explosion_5),1,false)

}

// If the ship reaches the end of the screen
if x < 0
{
	
	global.damage++
	instance_destroy();
}
