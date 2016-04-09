module deepmagic.dom.elements.section.h1element;

import deepmagic.dom;

class H1Element : Html5Element!("h1", true){
	mixin(ElementConstructorTemplate!());
}
