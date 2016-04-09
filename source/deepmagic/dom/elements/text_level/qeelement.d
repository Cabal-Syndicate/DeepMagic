module deepmagic.dom.elements.text_level.qeelement;

import deepmagic.dom;

class QElement : Html5Element!("q"){
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "Cite", "cite"));
}

