extends Node

func load_file(path: String) -> FileAccess:
	if FileAccess.file_exists(path):
		var file = FileAccess.open(path, FileAccess.READ);
		
		return file;
	else:
		push_error("filepath does not exist");
		return null;
