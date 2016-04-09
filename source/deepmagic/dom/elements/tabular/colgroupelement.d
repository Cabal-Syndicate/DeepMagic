module deepmagic.dom.elements.tabular.colgroupelement;

import deepmagic.dom;

class ColgroupElement : Html5Element!("colgroup"){
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "Span", "span"));
}

