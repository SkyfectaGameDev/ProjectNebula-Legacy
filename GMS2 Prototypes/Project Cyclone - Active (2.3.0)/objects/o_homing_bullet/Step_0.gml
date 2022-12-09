
image_angle = direction;

if (p_enemies.x < room_width	&& p_enemies.x > (room_width - room_width))
&& (p_enemies.y < room_height	&& p_enemies.y > (room_height - room_height)){
	bullet_track = instance_nearest(x, y, p_enemies);

	if (homing == true) {
		var target_direction = point_direction(x, y, bullet_track.x, bullet_track.y);
		image_angle += sin(degtorad(target_direction - image_angle)) * 8;
		direction = image_angle;
	}
}