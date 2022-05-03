// Collisions
if place_meeting(x,y,OBJ_Player)
{	
	OBJ_Player.shoot_timing = 5
	OBJ_Player.alarm[1] = 600
	instance_destroy()
	audio_play_sound(powerUp,1,false)
}

// Animation
if move_up == true
{
	y+= 0.5
	if y == ystart+5
	{
		move_up = false
	}
}
if move_up == false
{
	y-= 0.5
	if y == ystart-5 
	{
		move_up = true
	}
}
