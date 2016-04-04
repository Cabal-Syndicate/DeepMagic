module deepmagic.layout.code_black.head_block.head_block;

import deepmagic.layout.code_black;

class AppLayoutHeadBlock : HeadElement{
	private string _charset				= "UTF-8";
	private string _description			= "Randora Server Template";
	private string _format_detection	= "telephone=no";
	private string _keywords			= "Bootstrap, Template";
	private string _viewport			= "width=device-width, initial-scale=1.0, maximum-scale=1.0";

	private string _title = "asdf";

	private string[] _stylesheets = null;

	this(){
		super();
		this._stylesheets ~= "/css/bootstrap.min.css";
		this._stylesheets ~= "/css/animate.min.css";
		this._stylesheets ~= "/css/font-awesome.min.css";
		this._stylesheets ~= "/css/form.css";
		this._stylesheets ~= "/css/calendar.css";
		this._stylesheets ~= "/css/style.css";
		this._stylesheets ~= "/css/icons.css";
		this._stylesheets ~= "/css/generics.css";

		this.init();
	}

	override void init(){
		MetaElement viewport = new MetaElement();
		viewport.tag.attr["name"] = "viewport";
		viewport.tag.attr["content"] = this._viewport;

		MetaElement format_detection = new MetaElement();
		format_detection.tag.attr["name"] = "format-detection";
		format_detection.tag.attr["content"] = this._format_detection;

		MetaElement charset = new MetaElement();
		charset.tag.attr["charset"] = this._charset;

		MetaElement description = new MetaElement();
		description.tag.attr["name"] = "description";
		description.tag.attr["content"] = this._description;

		MetaElement keywords = new MetaElement();
		keywords.tag.attr["name"] = "keywords";
		keywords.tag.attr["content"] = this._keywords;

		TitleElement title = new TitleElement();
		title ~= new Text(this._title);

		this ~= title;
		this ~= viewport;
		this ~= format_detection;
		this ~= charset;
		this ~= description;
		this ~= keywords;

		foreach(int i, string stylesheet; this._stylesheets){
			LinkElement link = new LinkElement();
			link.tag.attr["href"] = stylesheet;
			link.tag.attr["rel"] = "stylesheet";
			this ~= link;
		}
	}
}
