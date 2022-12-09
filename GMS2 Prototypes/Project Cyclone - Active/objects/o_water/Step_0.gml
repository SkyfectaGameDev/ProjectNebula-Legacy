
if ((o_player.y > y - 16) && can_spawn == true) {
	
	instance_create_layer(o_player.x - 8, y, "Detail_1", o_waterspray);
	can_spawn = false;
	alarm[0] = 10;
}