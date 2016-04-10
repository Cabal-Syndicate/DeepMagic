module deepmagic.dom.elements.grouping.dlelement;

import deepmagic.dom;

class DlElement : Html5Element!("dl"){
	mixin(ElementConstructorTemplate!());
}

unittest{
	DlElement dl = new DlElement();
	assert(dl.toString == "<dl />");
}
