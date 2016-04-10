module deepmagic.dom.elements.embedded.video_element;

import deepmagic.dom;

class VideoElement : Html5Element!("video"){
	mixin(ElementConstructorTemplate!());
}
