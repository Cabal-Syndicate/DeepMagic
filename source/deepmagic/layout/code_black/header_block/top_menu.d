module deepmagic.layout.code_black.header_block.top_menu;

import deepmagic.layout.code_black;

class AppLayoutTopMenu : DivElement{
	string title = "";

	this(){
		super();
		this.tag.attr["class"] = "media";
		this.tag.attr["id"] = "top-menu";
		this.init();
	}

	AElement drawer_toggle(string data_drawer, string href, string class_name, int number, string value){
		IElement top_message = new IElement();
		top_message.tag.attr["class"] = class_name;
		top_message ~= new Text("");

		IElement n_count = new IElement();
		n_count.tag.attr["class"] = "n-count animated";
		import std.conv;
		n_count ~= new Text(to!(string)(number));

		SpanElement span = new SpanElement();
		span ~= new Text(value);

		AElement d = new AElement();
		d.tag.attr["class"] = "drawer-toggle";
		d.tag.attr["data-drawer"] = data_drawer;
		d.tag.attr["href"] = href;

		d ~= top_message;
		d ~= n_count;
		d ~= span;

		return d;
	}

	DivElement icon(){
		DivElement i = new DivElement();
		i.tag.attr["class"] = "pull-left tm-icon";

		i ~= drawer_toggle("messages", "#", "sa-top-message", 5, "Messages");
		i ~= drawer_toggle("notifications", "#", "sa-top-update", 9, "Updates");

		return i;
	}

	DivElement time(){
		SpanElement hours = new SpanElement();
		hours.tag.attr["id"] = "hours";
		hours ~= new Text(":");

		SpanElement min = new SpanElement();
		min.tag.attr["id"] = "min";
		min ~= new Text(":");

		SpanElement sec = new SpanElement();
		sec.tag.attr["id"] = "sec";
		sec ~= new Text("");

		DivElement t = new DivElement();
		t.tag.attr["id"] = "time";
		t.tag.attr["class"] = "pull-right";

		t ~= hours;
		t ~= min;
		t ~= sec;

		return t;
	}

	DivElement media_body(){
		InputElement input = new InputElement();
		input.tag.attr["class"] = "main-search";
		input.tag.attr["type"] = "text";

		DivElement mb = new DivElement();
		mb.tag.attr["class"] = "media-body";

		mb ~= input;

		return mb;
	}

	override void init(){
		this ~= this.icon();
		this ~= time();
		this ~= media_body();
	}
}
