module deepmagic.dom.elements.scripting.scriptelement;

import deepmagic.dom;

class ScriptElement : Html5Element!("script"){
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "Src", "src"));
	mixin(AttributeTemplate!(typeof(this), "Type", "type"));
	mixin(AttributeTemplate!(typeof(this), "CharSet", "charset"));
	mixin(AttributeTemplate!(typeof(this), "Async", "async"));
	mixin(AttributeTemplate!(typeof(this), "Defer", "defer"));
	mixin(AttributeTemplate!(typeof(this), "CrossOrigin", "crossorigin"));
}

