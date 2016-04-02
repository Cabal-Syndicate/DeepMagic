module deepmagic.dom.complex.clear_fix;

import deepmagic.dom;

class ClearFixElement : DivElement{
	this(){
		super();
		this ~= new Sass("clear_fix");
	}
}