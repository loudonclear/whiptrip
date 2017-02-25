o1 = argument0
o2 = argument1;
numSegments = argument2;

stepx = (o2.x - o1.x) / numSegments;
stepy = (o2.y - o1.y) / numSegments;

var r1 = o1;
var r2;

for(var i = 0; i < numSegments; i++) {
    r2 = instance_create(x + stepx, y + stepy, objRope);
    link = physics_joint_distance_create(r1, r2, r1.x, r1.y, r2.x, r2.y, false);
    physics_joint_set_value(link, phy_joint_damping_ratio, 1);
    physics_joint_set_value(link, phy_joint_frequency, 10);
    r1 = r2;
}

link = physics_joint_distance_create(r1, o2, r1.x, r1.y, o2.x, o2.y, false);
physics_joint_set_value(link, phy_joint_damping_ratio, 1);
physics_joint_set_value(link, phy_joint_frequency, 10);
