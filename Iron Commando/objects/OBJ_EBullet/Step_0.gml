// Player Collision
if place_meeting(x,y,OBJ_Player)
{
	instance_destroy();
	instance_create_layer(x,y,"Player",OBJ_Part)
	global.damage++
	audio_play_sound(hitHurt,1,false);
}

// Destroy On the edge of the screen
if x <= 0
{
	instance_destroy()
}
