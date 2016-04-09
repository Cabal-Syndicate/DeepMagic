module deepmagic.dom.elements.embedded.objectelement;

import deepmagic.dom;

class ObjectElement : Html5Element!("object"){
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "Data", "data"));
	mixin(AttributeTemplate!(typeof(this), "Type", "type"));
	mixin(AttributeTemplate!(typeof(this), "TypeMustWatch", "typemustwatch"));
	mixin(AttributeTemplate!(typeof(this), "name", "name"));
	mixin(AttributeTemplate!(typeof(this), "UseMap", "usemap"));
	mixin(AttributeTemplate!(typeof(this), "Form", "form"));
	mixin(AttributeTemplate!(typeof(this), "Width", "width"));
	mixin(AttributeTemplate!(typeof(this), "Height", "height"));
}

