module deepmagic.dom.elements.tabular;

import deepmagic.dom;

class TableElement : Html5Element!("table"){
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "Border", "border"));
	mixin(AttributeTemplate!(typeof(this), "Sortable", "sortable"));
}

class CaptionElement : Html5Element!("caption"){
	mixin(ElementConstructorTemplate!());
}

class ColgroupElement : Html5Element!("colgroup"){
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "Span", "span"));
}

class ColElement : Html5Element!("col"){
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "Span", "span"));
}

class TbodyElement : Html5Element!("tbody"){
	mixin(ElementConstructorTemplate!());
}

class TheadElement : Html5Element!("thead"){
	mixin(ElementConstructorTemplate!());
}

class TfootElement : Html5Element!("tfoot"){
	mixin(ElementConstructorTemplate!());
}

class TrElement : Html5Element!("tr"){
	mixin(ElementConstructorTemplate!());
}

class TdElement : Html5Element!("td"){
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "ColSpan", "colspan"));
	mixin(AttributeTemplate!(typeof(this), "RowSpan", "rowspan"));
	mixin(AttributeTemplate!(typeof(this), "Headers", "headers"));
}

class ThElement : Html5Element!("th"){
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "ColSpan", "colspan"));
	mixin(AttributeTemplate!(typeof(this), "RowSpan", "rowspan"));
	mixin(AttributeTemplate!(typeof(this), "Headers", "headers"));
	mixin(AttributeTemplate!(typeof(this), "Scope", "scope"));
	mixin(AttributeTemplate!(typeof(this), "Abbr", "abbr"));
	mixin(AttributeTemplate!(typeof(this), "Sorted", "sorted"));
}
