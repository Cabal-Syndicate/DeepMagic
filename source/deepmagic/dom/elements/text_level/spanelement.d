module deepmagic.dom.elements.text_level.spanelement;

import deepmagic.dom;

class SpanElement : Html5Element!("span", true){
	mixin(ElementConstructorTemplate!());
}
