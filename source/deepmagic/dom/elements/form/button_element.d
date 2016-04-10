module deepmagic.dom.elements.form.button_element;

import deepmagic.dom;

class ButtonElement : Html5Element!("button"){
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "AutoFocus", "audofocus"));
	mixin(AttributeTemplate!(typeof(this), "Disabled", "disabled"));
	mixin(AttributeTemplate!(typeof(this), "Form", "form"));
	mixin(AttributeTemplate!(typeof(this), "FormAction", "formaction"));
	mixin(AttributeTemplate!(typeof(this), "FormEncType", "formenctype"));
	mixin(AttributeTemplate!(typeof(this), "FormMethod", "formmethod"));
	mixin(AttributeTemplate!(typeof(this), "FormNoValidate", "formnovalidate"));
	mixin(AttributeTemplate!(typeof(this), "FormTarget", "formtarget"));
	mixin(AttributeTemplate!(typeof(this), "Menu", "menu"));
	mixin(AttributeTemplate!(typeof(this), "Name", "name"));
	mixin(AttributeTemplate!(typeof(this), "Type", "type"));
	mixin(AttributeTemplate!(typeof(this), "Value", "value"));
}

