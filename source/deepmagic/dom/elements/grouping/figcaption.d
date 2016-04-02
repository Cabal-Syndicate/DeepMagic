module deepmagic.dom.elements.grouping.figcaption;

import deepmagic.dom;

class FigcaptionElement : Html5Element!("figcaption"){
	mixin(ElementConstructorTemplate!());
}

unittest{
	FigcaptionElement figcaption = new FigcaptionElement();
	assert(figcaption.toString == "<figcaption />");
}