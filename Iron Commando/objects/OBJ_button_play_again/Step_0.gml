// Play Again Button
if mouse_button = mb_left
{
	if position_meeting(mouse_x,mouse_y,OBJ_button_play_again)
	{
		score = 0;
		room_goto(Menu)
		audio_play_sound(click_sound,1,false);
	}
}
