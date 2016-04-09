module deepmagic.dom.elements.text_level.timeelement;

import deepmagic.dom;

class TimeElement : Html5Element!("time"){
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "DateTime", "datetime"));
}

