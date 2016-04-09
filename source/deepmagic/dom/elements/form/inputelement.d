module deepmagic.dom.elements.form.inputelement;

import deepmagic.dom;

class InputElement : Html5Element!("input"){
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "Accept", "accept"));
	mixin(AttributeTemplate!(typeof(this), "Alt", "alt"));
	mixin(AttributeTemplate!(typeof(this), "AutoComplete", "autocomplete"));
	mixin(AttributeTemplate!(typeof(this), "AutoFocus", "autofocus"));
	mixin(AttributeTemplate!(typeof(this), "Checked", "checked"));
	mixin(AttributeTemplate!(typeof(this), "DirName", "dirname"));
	mixin(AttributeTemplate!(typeof(this), "Disabled", "disabled"));
	mixin(AttributeTemplate!(typeof(this), "Form", "form"));
	mixin(AttributeTemplate!(typeof(this), "FormAction", "formaction"));
	mixin(AttributeTemplate!(typeof(this), "FormEncType", "formenctype"));
	mixin(AttributeTemplate!(typeof(this), "FormMethod", "formmethod"));
	mixin(AttributeTemplate!(typeof(this), "FormNoValidate", "formnovalidate"));
	mixin(AttributeTemplate!(typeof(this), "FormTarget", "formtarget"));
	mixin(AttributeTemplate!(typeof(this), "Height", "height"));
	mixin(AttributeTemplate!(typeof(this), "InputMode", "inputmode"));
	mixin(AttributeTemplate!(typeof(this), "list", "list"));
	mixin(AttributeTemplate!(typeof(this), "Max", "max"));
	mixin(AttributeTemplate!(typeof(this), "MaxLength", "maxlength"));
	mixin(AttributeTemplate!(typeof(this), "Min", "min"));
	mixin(AttributeTemplate!(typeof(this), "MinLength", "minlength"));
	mixin(AttributeTemplate!(typeof(this), "Multiple", "multiple"));
	mixin(AttributeTemplate!(typeof(this), "Name", "name"));
	mixin(AttributeTemplate!(typeof(this), "Pattern", "pattern"));
	mixin(AttributeTemplate!(typeof(this), "PlaceHolder", "placeholder"));
	mixin(AttributeTemplate!(typeof(this), "ReadOnly", "readonly"));
	mixin(AttributeTemplate!(typeof(this), "Required", "required"));
	mixin(AttributeTemplate!(typeof(this), "Size", "size"));
	mixin(AttributeTemplate!(typeof(this), "Src", "src"));
	mixin(AttributeTemplate!(typeof(this), "Step", "step"));
	mixin(AttributeTemplate!(typeof(this), "Type", "type"));
	mixin(AttributeTemplate!(typeof(this), "Value", "value"));
	mixin(AttributeTemplate!(typeof(this), "Width", "width"));
}

