
if (o_stats.firerate_upgrade < 1.3) {
	with(other)	{o_stats.firerate_upgrade += 0.1;}
}
else {o_stats.score_ += 150;}

instance_destroy();