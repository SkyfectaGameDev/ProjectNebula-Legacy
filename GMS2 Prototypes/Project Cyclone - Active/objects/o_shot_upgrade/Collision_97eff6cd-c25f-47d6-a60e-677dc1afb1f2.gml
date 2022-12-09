
if (o_stats.shot_upgrade < 4) {
	with(other)	{o_stats.shot_upgrade += 1;}
}
else {o_stats.score_ += 200;}

instance_destroy();