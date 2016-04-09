module deepmagic.dom.elements.grouping.olelement;

import deepmagic.dom;

class OlElement : Html5Element!("ol"){
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "Reversed", "reversed"));
	mixin(AttributeTemplate!(typeof(this), "Start", "start"));
	mixin(AttributeTemplate!(typeof(this), "Type", "type"));
}

unittest{
	OlElement ol = new OlElement();
	assert(ol.toString == "<ol />");
}
