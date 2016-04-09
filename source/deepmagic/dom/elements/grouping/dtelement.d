module deepmagic.dom.elements.grouping.dtelement;

import deepmagic.dom;

class DtElement : Html5Element!("dt"){
	mixin(ElementConstructorTemplate!());
}

unittest{
	DtElement dt = new DtElement();
	assert(dt.toString == "<dt />");
}
