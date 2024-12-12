extends Node2D

const PUZZLE_INPUT = "res://day2/puzzle_input.txt";

func _ready() -> void:
	var data = Global.load_file(PUZZLE_INPUT);
	part_1(data);
	data = Global.load_file(PUZZLE_INPUT);
	part_2(data);

func part_1(data: FileAccess):
	var line = data.get_line();
	
	var safe_reports := 0;
	
	while line != "":
		var split_arr = line.split(" ");
		
		var is_increasing := false;

		if int(split_arr[1]) > int(split_arr[0]):
			is_increasing = true;
		
		var previous_level = null;
		var is_unsafe := false;
		for l in split_arr:
			var level = int(l);
			if previous_level == null:
				previous_level = level;
				continue;

			var diff = level - previous_level if is_increasing else previous_level - level;
			previous_level = level;

			if diff < 1 || diff > 3:
				is_unsafe = true;
				break;

		if !is_unsafe:
			safe_reports += 1;
			
		line = data.get_line();
			
	print(safe_reports);
	
func part_2(data: FileAccess):
	var line = data.get_line();
	
	var safe_reports := 0;

	while line != "":
		var split_arr = Array(line.split(" "));

		var is_safe := false;
		if check_safety(split_arr):
			is_safe = true;
		else:
			for i in split_arr.size():
				var arr_without_i = split_arr.duplicate();
				arr_without_i.pop_at(i);

				if check_safety(arr_without_i):
					is_safe = true;
					break;
		
		if is_safe:
			safe_reports += 1;

		line = data.get_line();
			
	print(safe_reports);

# returns bad index if unsafe, -1 otherwise
func check_safety(arr: Array) -> bool:
	var is_increasing := false;
	var increasing_count = 0;

	for j in 3:
		if arr[j] < arr[j + 1]:
			increasing_count += 1;
	
	if increasing_count > 1:
		is_increasing = true;
			
	for i in arr.size() - 1:
		var num = int(arr[i]);
		var next_num = int(arr[i + 1]);
		
		var diff = next_num - num if is_increasing else num - next_num;
		
		if diff < 1 || diff > 3:
			return false;
			
	return true;
