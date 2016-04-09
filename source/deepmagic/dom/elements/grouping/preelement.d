module deepmagic.dom.elements.grouping.preelement;

import deepmagic.dom;

class PreElement : Html5Element!("pre"){
	mixin(ElementConstructorTemplate!());
}

unittest{
	PreElement pre = new PreElement();
	assert(pre.toString == "<pre />");
}
