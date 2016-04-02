module deepmagic.dom.elements.grouping.figure;

import deepmagic.dom;

class FigureElement : Html5Element!("figure"){
	mixin(ElementConstructorTemplate!());
}

unittest{
	FigureElement figure = new FigureElement();
	assert(figure.toString == "<figure />");
}