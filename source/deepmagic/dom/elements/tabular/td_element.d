module deepmagic.dom.elements.tabular.td_element;

import deepmagic.dom;

class TdElement : Html5Element!("td"){
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "ColSpan", "colspan"));
	mixin(AttributeTemplate!(typeof(this), "RowSpan", "rowspan"));
	mixin(AttributeTemplate!(typeof(this), "Headers", "headers"));
}

