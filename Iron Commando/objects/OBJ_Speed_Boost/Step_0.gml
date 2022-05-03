// Collisions
if place_meeting(x,y,OBJ_Player)
{
	OBJ_Player.hori_speed = 7
	OBJ_Player.vert_speed  = 10
	instance_destroy()
	OBJ_Player.alarm[0] = 600
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
