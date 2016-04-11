module deepmagic.dom.elements.text_level.time_element;

import deepmagic.dom;

class TimeElement : Html5Element!("time"){
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "DateTime", "datetime"));
}

