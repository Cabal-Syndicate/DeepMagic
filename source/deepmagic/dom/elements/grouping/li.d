module deepmagic.dom.elements.grouping.li;

import deepmagic.dom;

class LiElement : Html5Element!("li"){
	mixin(ElementConstructorTemplate!());
}

unittest{
	LiElement li = new LiElement();
	assert(li.toString == "<li />");
}