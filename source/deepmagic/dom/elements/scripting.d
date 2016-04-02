module deepmagic.dom.elements.scripting;

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

class NoscriptElement : Html5Element!("noscript"){
	mixin(ElementConstructorTemplate!());
}

class TemplateElement : Html5Element!("template"){
	mixin(ElementConstructorTemplate!());
}

class CanvasElement : Html5Element!("canvas"){
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "Width", "width"));
	mixin(AttributeTemplate!(typeof(this), "Height", "height"));
}
