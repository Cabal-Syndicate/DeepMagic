module deepmagic.dom.elements.grouping.dt;

import deepmagic.dom;

class DtElement : Html5Element!("dt"){
	mixin(ElementConstructorTemplate!());
}

unittest{
	DtElement dt = new DtElement();
	assert(dt.toString == "<dt />");
}