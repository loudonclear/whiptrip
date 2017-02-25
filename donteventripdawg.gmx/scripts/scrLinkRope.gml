o1 = argument0
o2 = argument1;
numSegments = argument2;

stepx = (o2.x - o1.x) / numSegments;
stepy = (o2.y - o1.y) / numSegments;

r1 = o1;

xoff = o1.x;
yoff = o1.y;

for(var i = 0; i < numSegments; i++) {
    r2 = instance_create(xoff + stepx, yoff + stepy, objRope);
    r2.parent = r1;
    link = physics_joint_distance_create(r1, r2, r1.x, r1.y, r2.x, r2.y, false);
    physics_joint_set_value(link, phy_joint_damping_ratio, 1);
    physics_joint_set_value(link, phy_joint_frequency, 15);
    physics_joint_set_value(link, phy_joint_max_length, 32);
    r1 = r2;
}

link = physics_joint_distance_create(r1, o2, r1.x, r1.y, o2.x, o2.y, false);
physics_joint_set_value(link, phy_joint_damping_ratio, 1);
physics_joint_set_value(link, phy_joint_frequency, 15);

