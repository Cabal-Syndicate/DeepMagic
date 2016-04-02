module deepmagic.dom.complex.column;

import deepmagic.dom;

class ColumnElement : DivElement{
	import std.conv;
	int grid = 12;

	this(int grid = 12){
		super();
		this.grid = grid;
		this ~= new Sass("col-md-" ~ to!(string)(this.grid));
	}
}