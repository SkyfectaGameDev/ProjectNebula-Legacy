#region //---------------------------------- Every Tick -----------------------------------------------------

firerate_upgrade	= o_stats.firerate_upgrade;
shot_upgrade		= o_stats.shot_upgrade;

#endregion

#region //---------------------------------- Variable Declaration -------------------------------------------

var up, down, left, right, diag, h_move, v_move, shoot;

up		= keyboard_check(vk_up)		|| gamepad_button_check(0, gp_padu)		|| gamepad_button_check(4, gp_padu);
down	= keyboard_check(vk_down)	|| gamepad_button_check(0, gp_padd)		|| gamepad_button_check(4, gp_padu);
left	= keyboard_check(vk_left)	|| gamepad_button_check(0, gp_padl)		|| gamepad_button_check(4, gp_padu);
right	= keyboard_check(vk_right)	|| gamepad_button_check(0, gp_padr)		|| gamepad_button_check(4, gp_padu);
shoot	= keyboard_check(ord("D"))	|| gamepad_button_check(0, gp_face3)	|| gamepad_button_check(4, gp_face3);

h_move	= right - left;
v_move	= down - up;
diag	= (up or down) and (left or right);

#endregion

#region //---------------------------------- Digital Movement Control ---------------------------------------

// Horizontal Movement
if (h_move != 0) {
	hspeed_ += h_move * o_stats.accel_;
	hspeed_ = clamp(hspeed_, -o_stats.max_speed, o_stats.max_speed);
}
else {hspeed_ = lerp(hspeed_, 0, o_stats.friction_);}

// Vertical Movement
if (v_move != 0) {
	vspeed_ += v_move * o_stats.accel_;
	vspeed_ = clamp(vspeed_, -o_stats.max_speed, o_stats.max_speed);
}
else {vspeed_ = lerp(vspeed_, 0, o_stats.friction_);}

// Diagonal Movement
diagspeed_ = sqrt(o_stats.max_speed)/2;
if (diag) {
	hspeed_ *= diagspeed_ ;
	vspeed_ *= diagspeed_ ;
}
else {o_stats.max_speed = o_stats.original_speed;}

x += hspeed_ * global.difficulty;
y += vspeed_ * global.difficulty;

#endregion

#region //---------------------------------- Analogue Movement Control --------------------------------------

if gamepad_axis_value(0,gp_axislv) >= -deadzone_limit && gamepad_axis_value(0,gp_axislv) <= deadzone_limit 
&& gamepad_axis_value(0,gp_axislh) >= -deadzone_limit && gamepad_axis_value(0,gp_axislh) <= deadzone_limit
{speed = 0;}

else {
	var hlaxis = gamepad_axis_value(0, gp_axislh);
	var vlaxis = gamepad_axis_value(0, gp_axislv);
	direction = point_direction(0, 0, hlaxis, vlaxis);
	speed = point_distance(0, 0, hlaxis, vlaxis) * o_stats.max_speed * global.difficulty;
}

#endregion

#region //---------------------------------- Clamping -------------------------------------------------------

x = clamp(x, camera_get_view_x(0) + 8, camera_get_view_x(0) + 504);
y = clamp(y, camera_get_view_y(0) + 2, camera_get_view_y(0) + 286);

#endregion

#region //---------------------------------- Firing - Side --------------------------------------------------

if (shot_ready == true) {
	
	if (shoot) {
		audio_play_sound(au_player_shot, 1, false);
		scr_horizontal_shot(bullet_type);
		
	shot_ready = false;
	alarm[0] = (10 / o_stats.firerate_upgrade);
	}
}

#endregion






#region //---------------------------------- Debug ----------------------------------------------------------

if keyboard_check_pressed(ord("1")) {bullet_type = "standard";}
if keyboard_check_pressed(ord("2")) {bullet_type = "homing";}

#endregion