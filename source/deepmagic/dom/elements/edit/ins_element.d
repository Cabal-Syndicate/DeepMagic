module deepmagic.dom.elements.edit.ins_element;

import deepmagic.dom;

class InsElement : Html5Element!("ins"){
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "Cite", "cite"));
	mixin(AttributeTemplate!(typeof(this), "DateTime", "datetime"));
}
