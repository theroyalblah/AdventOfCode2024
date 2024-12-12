extends Node2D
const PUZZLE_INPUT = "res://day1/puzzle_input.txt";

func _ready() -> void:
	var data = Global.load_file(PUZZLE_INPUT);
	part_1(data);
	data = Global.load_file(PUZZLE_INPUT);
	part_2(data);

func part_1(data: FileAccess):
	var line = data.get_line();
	
	var arr_1 := [];
	var arr_2 := [];
	
	while line != "":
		var split_arr = line.split("   ");
		arr_1.append(int(split_arr[0]));
		arr_2.append(int(split_arr[1]));
		
		line = data.get_line();
		
	arr_1.sort();
	arr_2.sort();
	
	var total_dist := 0;
	
	for i in arr_1.size():
		var dist = arr_1[i] - arr_2[i];
		total_dist += abs(dist);
		
	print(total_dist);

func part_2(data: FileAccess):
	var line = data.get_line();
	
	var arr_1 := [];
	var arr_2 := [];
	
	while line != "":
		var split_arr = line.split("   ");
		arr_1.append(int(split_arr[0]));
		arr_2.append(int(split_arr[1]));
		
		line = data.get_line();
		
	arr_1.sort();
	arr_2.sort();
	
	var total_score := 0;
	
	for i in arr_1.size():
		var total_appearances = 0;

		for j in arr_2.size():
			if arr_1[i] == arr_2[j]:
				total_appearances += 1;
			elif arr_2[j] > arr_1[i]:
				break;
		
		total_score += arr_1[i] * total_appearances;
		
	print(total_score);
