module deepmagic.dom.elements.metadata.meta_element;

import deepmagic.dom;

class MetaElement : Html5Element!("meta"){
	bool can_be_empty = true;
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "Name", "name"));
	mixin(AttributeTemplate!(typeof(this), "HttpEquiv", "http-equiv"));
	mixin(AttributeTemplate!(typeof(this), "Content", "content"));
	mixin(AttributeTemplate!(typeof(this), "CharSet", "charset"));
}

