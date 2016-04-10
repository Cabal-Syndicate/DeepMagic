module deepmagic.dom.elements.form.optionelement;

import deepmagic.dom;

class OptionElement : Html5Element!("option"){
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "Disabled", "disabled"));
	mixin(AttributeTemplate!(typeof(this), "Label", "label"));
	mixin(AttributeTemplate!(typeof(this), "Selected", "selected"));
	mixin(AttributeTemplate!(typeof(this), "Value", "value"));

}

