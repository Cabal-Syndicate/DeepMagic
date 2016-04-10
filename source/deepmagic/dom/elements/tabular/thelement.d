module deepmagic.dom.elements.tabular.thelement;

import deepmagic.dom;

class ThElement : Html5Element!("th"){
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "ColSpan", "colspan"));
	mixin(AttributeTemplate!(typeof(this), "RowSpan", "rowspan"));
	mixin(AttributeTemplate!(typeof(this), "Headers", "headers"));
	mixin(AttributeTemplate!(typeof(this), "Scope", "scope"));
	mixin(AttributeTemplate!(typeof(this), "Abbr", "abbr"));
	mixin(AttributeTemplate!(typeof(this), "Sorted", "sorted"));
}

