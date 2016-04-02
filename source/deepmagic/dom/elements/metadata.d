module deepmagic.dom.elements.metadata;

import deepmagic.dom;

class BaseElement : Html5Element!("base"){
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "Href", "href"));
	mixin(AttributeTemplate!(typeof(this), "Target", "target"));
}

class HeadElement : Html5Element!("head"){
	mixin(ElementConstructorTemplate!());
}

class LinkElement : Html5Element!("link"){
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "Href", "href"));
	mixin(AttributeTemplate!(typeof(this), "CrossOrigin", "crossorigin"));
	mixin(AttributeTemplate!(typeof(this), "Rel", "rel"));
	mixin(AttributeTemplate!(typeof(this), "Media", "media"));
	mixin(AttributeTemplate!(typeof(this), "HrefLang", "hreflang"));
	mixin(AttributeTemplate!(typeof(this), "Type", "type"));
	mixin(AttributeTemplate!(typeof(this), "Sizes", "sizes"));
}

class MetaElement : Html5Element!("meta"){
	bool can_be_empty = true;
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "Name", "name"));
	mixin(AttributeTemplate!(typeof(this), "HttpEquiv", "http-equiv"));
	mixin(AttributeTemplate!(typeof(this), "Content", "content"));
	mixin(AttributeTemplate!(typeof(this), "CharSet", "charset"));
}

class TitleElement : Html5Element!("title"){
	mixin(ElementConstructorTemplate!());
}

class StyleElement : Html5Element!("style"){
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "Media", "media"));
	mixin(AttributeTemplate!(typeof(this), "Type", "type"));
}
