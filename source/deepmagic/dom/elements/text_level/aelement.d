module deepmagic.dom.elements.text_level.aelement;

import deepmagic.dom;

class AElement : Html5Element!("a"){
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "Href", "href"));
	mixin(AttributeTemplate!(typeof(this), "Target", "target"));
	mixin(AttributeTemplate!(typeof(this), "Download", "download"));
	mixin(AttributeTemplate!(typeof(this), "Rel", "rel"));
	mixin(AttributeTemplate!(typeof(this), "HrefLang", "hreflang"));
	mixin(AttributeTemplate!(typeof(this), "Type", "type"));
}
