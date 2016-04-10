module deepmagic.dom.elements.tabular.colelement;

import deepmagic.dom;

class ColElement : Html5Element!("col"){
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "Span", "span"));
}

