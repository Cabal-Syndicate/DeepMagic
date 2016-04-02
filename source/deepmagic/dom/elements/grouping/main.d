module deepmagic.dom.elements.grouping.main;

import deepmagic.dom;

class MainElement : Html5Element!("main"){
	mixin(ElementConstructorTemplate!());
}

unittest{
	MainElement main = new MainElement();
	assert(main.toString == "<main />");
}