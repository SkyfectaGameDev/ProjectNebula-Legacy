
#region //---------------------------------- Variable Declaration -------------------------------------------

var up, down, left, right, shoot;

up		= keyboard_check(vk_up)		|| gamepad_button_check(0, gp_padu)		|| gamepad_button_check(4, gp_padu);
down	= keyboard_check(vk_down)	|| gamepad_button_check(0, gp_padd)		|| gamepad_button_check(4, gp_padu);
left	= keyboard_check(vk_left)	|| gamepad_button_check(0, gp_padl)		|| gamepad_button_check(4, gp_padu);
right	= keyboard_check(vk_right)	|| gamepad_button_check(0, gp_padr)		|| gamepad_button_check(4, gp_padu);
shoot	= keyboard_check(ord("D"))	|| gamepad_button_check(0, gp_face3)	|| gamepad_button_check(4, gp_face3);

#endregion

#region //---------------------------------- Digital Movement Control ---------------------------------------

if (up)		{y -= player_speed * difficulty;}
if (down)	{y += player_speed * difficulty;}
if (left)	{x -= player_speed * difficulty;}
if (right)	{x += player_speed * difficulty;}

#endregion

#region //---------------------------------- Analogue Movement Control --------------------------------------

if (analogue == true) {
	
	if gamepad_axis_value(0,gp_axislv) >= -deadzone_limit && gamepad_axis_value(0,gp_axislv) <= deadzone_limit 
	&& gamepad_axis_value(0,gp_axislh) >= -deadzone_limit && gamepad_axis_value(0,gp_axislh) <= deadzone_limit
	{speed = 0;}

	else {
		var hlaxis = gamepad_axis_value(0, gp_axislh);
		var vlaxis = gamepad_axis_value(0, gp_axislv);
		direction = point_direction(0, 0, hlaxis, vlaxis);
		speed = point_distance(0, 0, hlaxis, vlaxis) * player_speed * difficulty;
	}
}

#endregion

#region //---------------------------------- Clamping -------------------------------------------------------

x = clamp(x, camera_get_view_x(0) + 8, camera_get_view_x(0) + 504);
y = clamp(y, camera_get_view_y(0) + 2, camera_get_view_y(0) + 286);

#endregion

#region //---------------------------------- Firing - Standard ----------------------------------------------

if (shot_ready == true) {
	
	if (shoot) {
		if (shot_upgrade == 1) {instance_create_layer(x+10, y+2, "Playfield", o_bullet);}
		if (shot_upgrade == 2) {instance_create_layer(x+10, y+4, "Playfield", o_bullet);
								instance_create_layer(x+10, y-2, "Playfield", o_bullet);}
	shot_ready = false;
	alarm[0] = (10 / firerate_upgrade);
	}
}

#endregion






#region //---------------------------------- Debug ----------------------------------------------------------

if keyboard_check_pressed(ord("1")) {shot_upgrade = 1;}
if keyboard_check_pressed(ord("2")) {shot_upgrade = 2;}

#endregion