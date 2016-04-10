module deepmagic.dom.elements.metadata.baseelement;

import deepmagic.dom;

class BaseElement : Html5Element!("base"){
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "Href", "href"));
	mixin(AttributeTemplate!(typeof(this), "Target", "target"));
}
