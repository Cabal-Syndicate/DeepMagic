module deepmagic.dom.elements.grouping.divelement;

import deepmagic.dom;

class DivElement : Html5Element!("div", true){
	mixin(ElementConstructorTemplate!());
}

///Default Initialization.
unittest{
	DivElement div = new DivElement();
	assert(div.toString == "<div></div>", div.toString);
}
