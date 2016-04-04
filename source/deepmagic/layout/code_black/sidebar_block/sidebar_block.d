module deepmagic.layout.code_black.sidebar_block.sidebar_block;

import deepmagic.layout.code_black;

class AppLayoutSidebarBlock : AsideElement{
	AppLayoutSidebarMenuBlock	sidebar_menu_block		= null;
	AppLayoutSidebarWidgets		sidebar_widgets_block	= null;

	this(){
		super();
		this.tag.attr["id"] = "sidebar";

		this.sidebar_menu_block = new AppLayoutSidebarMenuBlock();
		this.sidebar_widgets_block = new AppLayoutSidebarWidgets();

		this.init();
	}

	override void init(){
		this ~= this.sidebar_menu_block;
		this ~= this.sidebar_widgets_block;
	}
}
