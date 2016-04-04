module deepmagic.layout.code_black.body_block.body_block;

import deepmagic.layout.code_black;

class AppLayoutBodyBlock : BodyElement{
	AppLayoutHeaderBlock	header_block	= null;
	AppLayoutMainBlock		main_block		= null;
	AppLayoutScriptBlock	script_block	= null;

	string id = "skin-cloth";

	this(){
		super();
		this.tag.attr["id"] = this.id;

		this.header_block	= new AppLayoutHeaderBlock();
		this.main_block		= new AppLayoutMainBlock();
		this.script_block	= new AppLayoutScriptBlock();

		this.init();
	}

	override void init(){
		this ~= header_block;
		this ~= new ClearFixElement();
		this ~= main_block;
		this ~= script_block;
	}
}
