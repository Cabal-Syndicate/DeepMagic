module deepmagic.dom.elements.scripting.noscriptelement;

import deepmagic.dom;

class NoscriptElement : Html5Element!("noscript"){
	mixin(ElementConstructorTemplate!());
}

