/// @description Spawn in a wave of enemies
with(OBJ_Spawner)
{
	if score < 1000 
	{
		var spawn_chooser = irandom_range(0,3)
		switch(spawn_chooser)
		{
			case 0:
				spawn_random(irandom_range(1,3))
			break;
			case 1:
				spawn_pyramid(3,1)
			break;
			case 2:
				spawn_dualing_peaks(1,2)
			break;
			case 3:
				spawn_square(2,2)
			break;
		}
	}
	if score >= 1000 and score <= 10000
	{
		var spawn_chooser = irandom(4)
		switch(spawn_chooser)
		{
			case 0:
				spawn_random(irandom_range(1,4))
			break;
			case 1:
				spawn_pyramid(3,3)
			break;
			case 2:
				spawn_dualing_peaks(2,3)
			break;
			case 3:
				spawn_square(3,1)
			break;
		}
	}
	if score > 10000
	{var spawn_chooser = irandom(4)
		switch(spawn_chooser)
		{
			case 0:
				spawn_random(irandom_range(3,6))
			break;
			case 1:
				spawn_pyramid(3,2)
			break;
			case 2:
				spawn_dualing_peaks(4,1)
			break;
			case 3:
				spawn_square(5,1)
			break;
			case 4:
				spawn_square(2,4)
			break;
		}
		
	}
}

// Create PowerUps
var spawn_power_up = choose(true,false)
if spawn_power_up
{
	instance_create_layer(irandom_range(50,700),irandom_range(700,50),"Player",choose(OBJ_Health_Boost,OBJ_Gun_Boost,OBJ_Speed_Boost))	
}
alarm[0] = 400
