module deepmagic.dom.elements.embedded.imgelement;

import deepmagic.dom;

class ImgElement : Html5Element!("img"){
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "Alt", "alt"));
	mixin(AttributeTemplate!(typeof(this), "Src", "src"));
	mixin(AttributeTemplate!(typeof(this), "CrossOrigin", "crossorigin"));
	mixin(AttributeTemplate!(typeof(this), "UseMap", "usemap"));
	mixin(AttributeTemplate!(typeof(this), "IsMap", "ismap"));
	mixin(AttributeTemplate!(typeof(this), "Width", "width"));
	mixin(AttributeTemplate!(typeof(this), "Height", "height"));
}

