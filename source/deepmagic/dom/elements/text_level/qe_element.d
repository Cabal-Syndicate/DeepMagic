module deepmagic.dom.elements.text_level.qe_element;

import deepmagic.dom;

class QElement : Html5Element!("q"){
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "Cite", "cite"));
}

