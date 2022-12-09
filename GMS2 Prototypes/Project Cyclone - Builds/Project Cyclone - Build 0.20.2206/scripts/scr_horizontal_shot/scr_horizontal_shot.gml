///scr_horizontal_shot();
///@param bullet_type

#region //---------------------------------- Standard -------------------------------------------------------

switch(argument0) {
	case "standard":
	
		if (o_stats.shot_upgrade == 1) {instance_create_layer(x+4, y+2, "Playfield", o_bullet);
		}
		if (o_stats.shot_upgrade == 2) {instance_create_layer(x+4, y+4, "Playfield", o_bullet);	
										instance_create_layer(x+4, y-2, "Playfield", o_bullet);					
		}
		if (o_stats.shot_upgrade == 3) {var a, b, c;
										a = instance_create_layer(x+4, y+4, "Playfield", o_bullet);
										b = instance_create_layer(x+4, y,   "Playfield", o_bullet);
										c = instance_create_layer(x+4, y-4, "Playfield", o_bullet);
										a.direction = -2;
										b.direction = 0;
										c.direction = 2;
		}
		if (o_stats.shot_upgrade == 4) {var a, b, c, d;
										a = instance_create_layer(x+4, y+8, "Playfield", o_bullet);
										b = instance_create_layer(x+4, y+4, "Playfield", o_bullet);	
										c = instance_create_layer(x+4, y-2, "Playfield", o_bullet);	
										d = instance_create_layer(x+4, y-6, "Playfield", o_bullet);	
										a.direction = -2;
										b.direction = 0;
										c.direction = 0;
										d.direction = 2;
		}

	break;
}

#endregion

#region //---------------------------------- Homing ---------------------------------------------------------

switch(argument0) {
	case "homing":
	
		if (o_stats.shot_upgrade == 1) {instance_create_layer(x+4, y+2, "Playfield", o_homing_bullet);
		}
		if (o_stats.shot_upgrade == 2) {var a, b;
										a = instance_create_layer(x+4, y+4, "Playfield", o_homing_bullet);	
										b = instance_create_layer(x+4, y-2, "Playfield", o_homing_bullet);
										a.direction = -5;
										b.direction = 5;
		}
		if (o_stats.shot_upgrade == 3) {var a, b, c;
										a = instance_create_layer(x+4, y+4, "Playfield", o_homing_bullet);
										b = instance_create_layer(x+4, y,   "Playfield", o_homing_bullet);
										c = instance_create_layer(x+4, y-4, "Playfield", o_homing_bullet);
										a.direction = -5;
										b.direction = 0;
										c.direction = 5;
		}
		if (o_stats.shot_upgrade == 4) {var a, b, c, d;
										a = instance_create_layer(x+4, y+8, "Playfield", o_homing_bullet);
										b = instance_create_layer(x+4, y+4, "Playfield", o_homing_bullet);	
										c = instance_create_layer(x+4, y-2, "Playfield", o_homing_bullet);	
										d = instance_create_layer(x+4, y-6, "Playfield", o_homing_bullet);	
										a.direction = -10;
										b.direction = -5;
										c.direction = 5;
										d.direction = 10;
		}

	break;
}

#endregion