module deepmagic.dom.elements.section.h2_element;

import deepmagic.dom;

class H2Element : Html5Element!("h2", true){
	mixin(ElementConstructorTemplate!());
}

