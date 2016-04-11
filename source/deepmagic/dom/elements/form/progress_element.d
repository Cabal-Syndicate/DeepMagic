module deepmagic.dom.elements.form.progress_element;

import deepmagic.dom;

class ProgressElement : Html5Element!("progress"){
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "Value", "value"));
	mixin(AttributeTemplate!(typeof(this), "Max", "max"));
}


