module deepmagic.layout.code_black.body_block.main_block.main_block;

import deepmagic.layout.code_black;

class AppLayoutMainBlock : SectionElement{
	AppLayoutContentBlock	content_block		= null;
	AppLayoutSidebarBlock	sidebar_block		= null;
	AppLayoutOlderIEMessage	older_ie_message	= null;

	this(){
		super();
		this.Id("main");
		this.tag.attr["role"] = "main";

		this ~= new Sass("p-relative");

		this.content_block		= new AppLayoutContentBlock();
		this.sidebar_block		= new AppLayoutSidebarBlock();
		this.older_ie_message	= new AppLayoutOlderIEMessage();

		this.init();
	}

	override void init(){
		this ~= this.sidebar_block;
		this ~= this.content_block;
		//this ~= this.older_ie_message;
	}
}
