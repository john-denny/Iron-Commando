// Base Spawning Function
function spawn_column(spawn_array)
{
	object_array = []
	
	// Convert the array Into a list of objects
	for (var i = 0; i < array_length(spawn_array); i++)
	{
		var current_object = spawn_array[i]
		
		if current_object == 1
		{
			object_array[i] = OBJ_E1;
		}
		if current_object == 2
		{
			object_array[i] = OBJ_E2; 
		}
		if current_object == 3
		{
			object_array[i] = OBJ_E3;
		}
		if current_object == 4
		{
			object_array[i] = OBJ_E4;
		}
		if current_object == 0
		{
			object_array[i] = false;
		}
	}
	
	// Create the enemies
	for (var i = 0; i < array_length(object_array); i++)
	{
		if (object_array[i] != false)
		{
			instance_create_layer(1376,96*(i+1),"Enemies",object_array[i])
		}
	}
	
}

// Dualing Peaks
function dualing_peaks_handler(phase,enemy_type_1,enemy_type_2)
{
	// Spawn the front line of the enemies
	if phase == 1 
	{
		
		spawn_column([0,enemy_type_1,0,0,0,enemy_type_1,0])
		alarm[0] = 30;
	}
	
	// Spawn in the back line of the enemies
	if phase == 2 spawn_column([enemy_type_2,enemy_type_2,enemy_type_2,0,enemy_type_2,enemy_type_2,enemy_type_2])
}
function spawn_dualing_peaks(front_row,back_row)
{
	phase_1 = front_row;
	phase_2 = back_row;
	dualing_peaks_handler(1,phase_1,phase_2)
}

// Pyramid 
function create_pyramid_layer(current_layer, enemy_type)
{
	var pyramid_layer;
	var enemies_to_spawn = 1
	for (i = 0; i < current_layer; i++)
	{
		enemies_to_spawn += 2
	}
	
	// Calculate Padding
	var padding = (7 - enemies_to_spawn)/2
	
	
	var current_index = 0;
	for (var n = 0; n < padding; n++)
	{
		// Insert Padding in the current layer at the current index
		pyramid_layer[current_index] = 0
		current_index++;
	}
	for (var n = 0; n < enemies_to_spawn; n++)
	{
		pyramid_layer[current_index] = enemy_type
		current_index++;
	}
	for (var n = 0; n < padding; n++)
	{
		// Insert Padding in the current layer at the current index
		pyramid_layer[current_index] = 0
		current_index++;
	}
	spawn_column(pyramid_layer);
}
function pyramid_handler(layer_to_spawn, type)
{
	create_pyramid_layer(layer_to_spawn, type)
	alarm[1] = 60
	layers_spawned ++;
}
function spawn_pyramid(number_of_layers,type)
{
	number_of_pyramid_layers = number_of_layers
	type_of_enemy = type
	layers_spawned = 0;
	pyramid_handler(layers_spawned,type_of_enemy)
}

// Square Spawning function
function square_handler(array_to_spawn)
{
	// Spawn a row and wait 30 frames
	spawn_column(array_to_spawn)
	alarm[2] = 60
}
function spawn_square(root,type)
{
	square_array = []
	// create the array with the correct padding
	// Calculate Padding
	var padding = (7-root)/2
	
	var current_index = 0;
	// Insert Padding
	for (var i = 0; i < padding; i++)
	{
		square_array[current_index] = 0
		current_index++
	}
	// Insert Enemies
	for (var i = 0; i < root; i++)
	{
		square_array[current_index] = type
		current_index++
	}
	square_handler(square_array)
	layers_spawned = 1
	number_of_square_layers = root 
}

// Random Spawning function
function spawn_random(amount)
{
	// Pick three random positions
	var possible_positions = [0,1,2,3,4,5,6];
	
	var positions_picked = 0;
	for (var i = 0; i < amount; i++)
	{
		var position_position = irandom(6)
		positions_picked[i] = possible_positions[position_position]
		
	}
	// Ensure the list is unique
	array_sort(positions_picked,true);
	for (var i = 0; i < amount-1; i++)
	{
		if positions_picked[i] == positions_picked[i+1]
		{
			spawn_random(amount)
		}
	}
	
	
	// Create the spawning array
	var object_array = []
	var i = 0;
	while (i < amount)
	{
		object_array[positions_picked[i]] = 1
		i++;
	}
	
	spawn_column(object_array)
}
