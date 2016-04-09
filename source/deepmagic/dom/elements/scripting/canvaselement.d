module deepmagic.dom.elements.scripting.canvaselement;

import deepmagic.dom;

class CanvasElement : Html5Element!("canvas"){
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "Width", "width"));
	mixin(AttributeTemplate!(typeof(this), "Height", "height"));
}

