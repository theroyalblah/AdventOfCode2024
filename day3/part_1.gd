extends Node2D

const PUZZLE_INPUT = "res://day3/puzzle_input.txt";

func _ready() -> void:
	var data = Global.load_file(PUZZLE_INPUT);
	
	var regex = RegEx.new();
	
	var line = data.get_line();
	
	var total := 0;
	
	while line != "":
		regex.compile(r'mul\(\d*,\d*\)');

		var results = [];
		for result in regex.search_all(line):
			results.push_back(result.get_string());
			
		for res in results:
			var nums = res.split(",");
			var num_1 = int(nums[0]);
			var num_2 = int(nums[1]);
			total += num_1 * num_2;
		
		line = data.get_line();
	
	print(total);
