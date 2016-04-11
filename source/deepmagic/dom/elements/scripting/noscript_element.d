module deepmagic.dom.elements.scripting.noscript_element;

import deepmagic.dom;

class NoscriptElement : Html5Element!("noscript"){
	mixin(ElementConstructorTemplate!());
}

