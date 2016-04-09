module deepmagic.dom.elements.text_level.smallelement;

import deepmagic.dom;

class SmallElement : Html5Element!("small", true){
	mixin(ElementConstructorTemplate!());
}

