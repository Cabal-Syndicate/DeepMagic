module deepmagic.dom.elements.form.select_element;

import deepmagic.dom;

class SelectElement : Html5Element!("select"){
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "AutoFocus", "autofocus"));
	mixin(AttributeTemplate!(typeof(this), "Disabled", "disabled"));
	mixin(AttributeTemplate!(typeof(this), "Form", "form"));
	mixin(AttributeTemplate!(typeof(this), "Multiple", "multiple"));
	mixin(AttributeTemplate!(typeof(this), "Name", "name"));
	mixin(AttributeTemplate!(typeof(this), "Required", "required"));
	mixin(AttributeTemplate!(typeof(this), "Size", "size"));
}

