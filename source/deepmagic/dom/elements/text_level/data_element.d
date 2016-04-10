module deepmagic.dom.elements.text_level.data_element;

import deepmagic.dom;

class DataElement : Html5Element!("data"){
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "Value", "value"));
}

