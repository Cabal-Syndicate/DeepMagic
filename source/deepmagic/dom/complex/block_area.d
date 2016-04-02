module deepmagic.dom.complex.block_area;

import deepmagic.dom;

class BlockAreaElement : DivElement{
	this(){
		super();
		this ~= new Sass("block-area");
	}
}

