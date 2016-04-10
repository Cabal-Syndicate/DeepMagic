module deepmagic.dom.elements.text_level.span_element;

import deepmagic.dom;

class SpanElement : Html5Element!("span", true){
	mixin(ElementConstructorTemplate!());
}
