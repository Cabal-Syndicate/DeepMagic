module deepmagic.dom.complex.row;

import deepmagic.dom;

class RowElement : DivElement{
	this(){
		super();
		this ~= new Sass("row");
	}
}
