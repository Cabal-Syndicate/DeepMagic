module deepmagic.dom.elements.grouping.p_element;

import deepmagic.dom;

class PElement : Html5Element!("p"){
	mixin(ElementConstructorTemplate!());
}

unittest{
	PElement p = new PElement();
	assert(p.toString == "<p />");
}
