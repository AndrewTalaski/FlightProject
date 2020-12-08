// // Script assets have changed for v2.3.0 see
// // https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function push(dx)
{
	hspeed = dx
	vspeed = -5
}

function shoot(x, y, dir, numSpray, spread) {
	push(dir * -5)
	pushed = true
	if(dir == 1)
		dir = 0
	else if(dir == -1)
		dir = 180
	var bullet = instance_create_layer(x, y, "Projectiles", obj_bullet)
	bullet.direction = dir
	bullet.image_angle = dir 
	for(i = 1; i <= numSpray; i++) {
		bullet = instance_create_layer(x, y, "Projectiles", obj_bullet)
		bullet.direction = dir + spread * i
		bullet = instance_create_layer(x, y, "Projectiles",obj_bullet)
		bullet.direction = dir - spread * i
	}

}

function shootDetectors(x, y, dir, numSpray, spread) {
	if(dir == 1)
		dir = 0
	else if(dir == -1)
		dir = 180
	var bullet = instance_create_layer(x, y, "Projectiles", obj_detectorbullet)
	bullet.direction = dir
	bullet.shooter = self
	for(i = 1; i <= numSpray; i++) {
		bullet = instance_create_layer(x, y, "Projectiles", obj_detectorbullet)
		bullet.direction = dir + spread * i
		bullet.shooter = self
		bullet = instance_create_layer(x, y, "Projectiles", obj_detectorbullet)
		bullet.direction = dir - spread * i
		bullet.shooter = self
	}
	

}