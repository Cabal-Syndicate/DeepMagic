module deepmagic.dom.elements.html5.attributeelement;

import deepmagic.dom;

struct Attributes{
	string id = "";
	//string[] classes = null;
	Sass[] sasses = null;
	string[string] attributes = null;
}

template AttributeTemplate(T, string var_name, string attribute_name){
	static const char[] AttributeTemplate = "
	@property{
		string _"~var_name~" = \"\";
		string "~var_name~"(){
			return this.tag.attr[\""~attribute_name~"\"];
		}
		typeof(this) "~var_name~"(string value){
			this.tag.attr[\""~attribute_name~"\"] = value;
			return this;
		}
	}
	";
}
