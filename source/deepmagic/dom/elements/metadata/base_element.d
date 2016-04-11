module deepmagic.dom.elements.metadata.base_element;

import deepmagic.dom;

class BaseElement : Html5Element!("base"){
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "Href", "href"));
	mixin(AttributeTemplate!(typeof(this), "Target", "target"));
}
