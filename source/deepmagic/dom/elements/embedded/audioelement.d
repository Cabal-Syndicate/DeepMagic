module deepmagic.dom.elements.embedded.audioelement;

import deepmagic.dom;

class AudioElement : Html5Element!("audio"){
	mixin(ElementConstructorTemplate!());
}

