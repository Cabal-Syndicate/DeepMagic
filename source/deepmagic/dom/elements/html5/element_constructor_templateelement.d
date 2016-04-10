module deepmagic.dom.elements.html5.element_constructor_templateelement;

import deepmagic.dom;

template ElementConstructorTemplate(){
	static const char[] ElementConstructorTemplate = "
	this(string value = \"\"){ super(value); }

	this(Element p){
		super(p);
	}

	this(Element[] p){
		super(p);
	}
	
	this(Attributes attributes, Element[] p = null){
		super(p);
		
		this.Id = attributes.id;
		this.add_sass(attributes.sasses);
		foreach(string s, string attribute; attributes.attributes){
			this.tag.attr[s] = attribute;
		}
	}

	this(Attributes attributes, string value = \"\"){
		super(value);
		
		this.Id = attributes.id;
		this.add_sass(attributes.sasses);
		foreach(string s, string attribute; attributes.attributes){
			this.tag.attr[s] = attribute;
		}
	}
	";
}
