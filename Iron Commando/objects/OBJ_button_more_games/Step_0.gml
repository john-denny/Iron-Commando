// More Games Button
if mouse_button = mb_left
{
	if position_meeting(mouse_x,mouse_y,OBJ_button_more_games)
	{
		url_open("https://john-116.itch.io")
		audio_play_sound(click_sound,1,false);
	}
	
}
