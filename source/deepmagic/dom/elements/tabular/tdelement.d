module deepmagic.dom.elements.tabular.tdelement;

import deepmagic.dom;

class TdElement : Html5Element!("td"){
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "ColSpan", "colspan"));
	mixin(AttributeTemplate!(typeof(this), "RowSpan", "rowspan"));
	mixin(AttributeTemplate!(typeof(this), "Headers", "headers"));
}

