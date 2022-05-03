// Check ship damage
if global.damage >= 10
{
	instance_destroy(OBJ_Booster)
	instance_destroy(OBJ_Health_Holder)
	instance_destroy(OBJ_Health)
	instance_destroy(OBJ_Player)
	if game_over == false
	{
		alarm[1] = 120
		game_over = true	
	}	
}
