module deepmagic.dom.elements.tabular.tableelement;

import deepmagic.dom;

class TableElement : Html5Element!("table"){
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "Border", "border"));
	mixin(AttributeTemplate!(typeof(this), "Sortable", "sortable"));
}

