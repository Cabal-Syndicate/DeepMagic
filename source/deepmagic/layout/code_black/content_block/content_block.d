module deepmagic.layout.code_black.content_block.content_block;

import deepmagic.layout.code_black;

class AppLayoutContentBlock : SectionElement{
	LayoutElement contents = null;

	//import user;
	//LoginWidget login = null;

	/+
	import widget;
	WidgetMessageDrawer message_drawer = null;
	WidgetNotificationDrawer notification_drawer = null;
	WidgetBreadCrumb breadcrumb = null;
	WidgetChat chat = null;
	+/
	this(){
		super();
		this.tag.attr["class"] = "container";
		this.tag.attr["id"] = "content";

		//this.breadcrumb				= new WidgetBreadCrumb();
		//this.chat					= new WidgetChat();
		this.contents				= new LayoutElement();
		//this.login					= new LoginWidget();
		//this.message_drawer			= new WidgetMessageDrawer();
		//this.notification_drawer	= new WidgetNotificationDrawer();
	}

	override void init(){
		//this ~= this.message_drawer;
		//this ~= this.notification_drawer;
		//this ~= this.breadcrumb;
		//this ~= this.login;
		this ~= this.contents;
		//this ~= this.chat;
	}
}
