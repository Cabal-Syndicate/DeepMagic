module deepmagic.dom.elements.grouping.ddelement;

import deepmagic.dom;

class DdElement : Html5Element!("dd"){
	mixin(ElementConstructorTemplate!());
}

unittest{
	DdElement dd = new DdElement();
	assert(dd.toString == "<dd />");
}
