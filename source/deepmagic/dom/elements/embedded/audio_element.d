module deepmagic.dom.elements.embedded.audio_element;

import deepmagic.dom;

class AudioElement : Html5Element!("audio"){
	mixin(ElementConstructorTemplate!());
}

