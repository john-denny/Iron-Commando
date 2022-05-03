// Keyboard Input Logic
var mvmtUp		= keyboard_check(vk_up);
var mvmtDown	= keyboard_check(vk_down);
var mvmtRight	= keyboard_check(vk_right);
var mvmtLeft	= keyboard_check(vk_left);
var mvmtShoot	= keyboard_check(vk_space);
var not_touching_edge_L = !(x < 66);
var not_touching_edge_R =!(x > 1300);

// Movement Logic
if mvmtUp or mvmtRight or mvmtDown
{
	if mvmtUp							
	{
		y -= vert_speed;

	}
	if mvmtDown							
	{
		y += vert_speed;
	
	}
	if mvmtRight && not_touching_edge_R
	{
		x += hori_speed 
	
	}
	
	if OBJ_Booster.image_alpha < 1
	{
		OBJ_Booster.image_alpha += 0.1
	}
}
if mvmtLeft	&& not_touching_edge_L	
{
	x -= hori_speed
}

move_wrap(false,true,45);

// Shooting/Bullet Logic
if mvmtShoot && shoot_timer < 1
{
	if bullet_counter % 2 == 0
	{
		instance_create_layer(x-10,y-sprite_height/2,"Bullets",OBJ_Bullet);
	}
	else
	{
		instance_create_layer(x-10,y+sprite_height/2,"Bullets",OBJ_Bullet);
	}
	bullet_counter += 1;
	shoot_timer = shoot_timing;
	audio_play_sound(choose(Shoot_1,Shoot_2,Shoot_3,Shoot_4,Shoot_5),1,false)
	
}
else shoot_timer -= 1;


