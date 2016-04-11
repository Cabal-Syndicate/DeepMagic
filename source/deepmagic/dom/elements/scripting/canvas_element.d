module deepmagic.dom.elements.scripting.canvas_element;

import deepmagic.dom;

class CanvasElement : Html5Element!("canvas"){
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "Width", "width"));
	mixin(AttributeTemplate!(typeof(this), "Height", "height"));
}

