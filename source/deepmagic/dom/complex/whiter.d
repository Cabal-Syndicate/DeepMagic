module deepmagic.dom.complex.whiter;

import deepmagic.dom;

class WhiterElement : HrElement{
	this(){
		super();
		this ~= new Sass("whiter");
	}
}
