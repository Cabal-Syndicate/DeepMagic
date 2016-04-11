module deepmagic.dom.elements.metadata.link_element;

import deepmagic.dom;

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

