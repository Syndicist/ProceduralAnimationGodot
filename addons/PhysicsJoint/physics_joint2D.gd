extends Position2D

#var min_angle = -100;
#var max_angle = 100;
export(float) var length = 0;
var joints = [];
var sprites = [];

func _ready():
	get_joints_and_sprites();

func get_joints_and_sprites():
	if(get_child_count() == 0):
		return;
	for n in get_children():
		if "length" in n:
			joints.append(n);
		if "texture" in n:
			sprites.append(n);
	return;

func _physics_process(delta):
	if(joints.size()>0):
		for i in joints.size():
			sprites[i].look_at(joints[i].global_position);

"""
var start_offset = 0;
func _ready():
	start_offset = position;

func get_limb(var node):
	if "joints" in node:
		return node;
	else:
		return get_limb(node.get_parent());

func get_relative_position_to_limb():
	return get_relative_transform_to_parent(get_limb(get_parent())).get_origin()"""