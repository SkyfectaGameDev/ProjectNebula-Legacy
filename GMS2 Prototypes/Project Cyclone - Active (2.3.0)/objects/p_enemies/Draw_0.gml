
if (hit == false)	{draw_self();}

if (hit == true)	{
	gpu_set_fog(true, c_white, 0, 0);
	draw_self();
	gpu_set_fog(false, c_white, 0, 0);
}