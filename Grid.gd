extends Node2D

export var grid_color : Color = Color.gray
export (int) var h_cells := 32
export (int) var v_cells := 32
export var cell_size := Vector2.ONE * 16

var grid = []

func _ready():
	position = -(cell_size * Vector2(h_cells, v_cells)) / 2.0
	_init_grid()

func _init_grid():
	var grid = []
	grid.resize(v_cells)
	for y in v_cells:
		grid[y] = []
		grid[y].resize(h_cells)
		for x in h_cells:
			grid[y][x] = preload("res://GridPoint.tscn").instance()
			grid[y][x].position = cell_size * Vector2(x, y)
			add_child(grid[y][x])
			if x != 0:
				grid[y][x].x_neighbor = grid[y][x-1]
			if y != 0:
				grid[y][x].y_neighbor = grid[y-1][x]