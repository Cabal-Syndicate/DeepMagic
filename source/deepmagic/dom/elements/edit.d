module deepmagic.dom.elements.edit;

import deepmagic.dom;

class InsElement : Html5Element!("ins"){
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "Cite", "cite"));
	mixin(AttributeTemplate!(typeof(this), "DateTime", "datetime"));
}

class DelElement : Html5Element!("del"){
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "Cite", "cite"));
	mixin(AttributeTemplate!(typeof(this), "DateTime", "datetime"));
}

