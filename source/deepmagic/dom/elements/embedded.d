module deepmagic.dom.elements.embedded;

import deepmagic.dom;

class ImgElement : Html5Element!("img"){
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "Alt", "alt"));
	mixin(AttributeTemplate!(typeof(this), "Src", "src"));
	mixin(AttributeTemplate!(typeof(this), "CrossOrigin", "crossorigin"));
	mixin(AttributeTemplate!(typeof(this), "UseMap", "usemap"));
	mixin(AttributeTemplate!(typeof(this), "IsMap", "ismap"));
	mixin(AttributeTemplate!(typeof(this), "Width", "width"));
	mixin(AttributeTemplate!(typeof(this), "Height", "height"));
}

class IframeElement : Html5Element!("iframe"){
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "Src", "src"));
	mixin(AttributeTemplate!(typeof(this), "SrcDoc", "srcdoc"));
	mixin(AttributeTemplate!(typeof(this), "Name", "name"));
	mixin(AttributeTemplate!(typeof(this), "SandBox", "sandbox"));
	mixin(AttributeTemplate!(typeof(this), "Width", "width"));
	mixin(AttributeTemplate!(typeof(this), "Height", "height"));
}

class EmbedElement : Html5Element!("embed"){
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "Src", "src"));
	mixin(AttributeTemplate!(typeof(this), "Type", "type"));
	mixin(AttributeTemplate!(typeof(this), "Width", "width"));
	mixin(AttributeTemplate!(typeof(this), "Height", "height"));
}

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

class ParamElement : Html5Element!("param"){
	mixin(ElementConstructorTemplate!());
}

class VideoElement : Html5Element!("video"){
	mixin(ElementConstructorTemplate!());
}

class AudioElement : Html5Element!("audio"){
	mixin(ElementConstructorTemplate!());
}

class SourceElement : Html5Element!("source"){
	mixin(ElementConstructorTemplate!());
}

class TrackElement : Html5Element!("track"){
	mixin(ElementConstructorTemplate!());
}

class MapElement : Html5Element!("map"){
	mixin(ElementConstructorTemplate!());
}

class AreaElement : Html5Element!("area"){
	mixin(ElementConstructorTemplate!());
}
