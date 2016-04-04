module deepmagic.layout.code_black.header_block.header_block;

import deepmagic.layout.code_black;

class AppLayoutHeaderBlock : HeaderElement{
	AppLayoutTopMenu top_menu = null;

	string title = "";

	this(){
		super();
		this.title = "Super Admin";
		this.tag.attr["id"] = "header";
		this.tag.attr["class"] = "media";

		this.top_menu = new AppLayoutTopMenu();

		this.init();
	}

	override void init(){
		AElement menu_toggle = new AElement();
		menu_toggle.tag.attr["id"] = "menu-toggle";
		menu_toggle.tag.attr["href"] = "#";
		menu_toggle ~= new Text("");

		AElement logo = new AElement();
		logo.tag.attr["class"] = "logo pull-left";
		logo.tag.attr["href"] = "/";
		logo ~= new Text(this.title);

		DivElement media_body = new DivElement();
		media_body.tag.attr["class"] = "media-body";
		media_body ~= this.top_menu;

		this ~= menu_toggle;
		this ~= logo;
		this ~= media_body;
	}
}
