module deepmagic.dom.elements.edit.del_element;

import deepmagic.dom;

class DelElement : Html5Element!("del"){
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "Cite", "cite"));
	mixin(AttributeTemplate!(typeof(this), "DateTime", "datetime"));
}

