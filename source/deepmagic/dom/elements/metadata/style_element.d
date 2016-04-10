module deepmagic.dom.elements.metadata.style_element;

import deepmagic.dom;

class StyleElement : Html5Element!("style"){
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "Media", "media"));
	mixin(AttributeTemplate!(typeof(this), "Type", "type"));
}
