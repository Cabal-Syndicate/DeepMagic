module deepmagic.dom.elements.form.textareaelement;

import deepmagic.dom;

class TextareaElement : Html5Element!("textarea"){
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "AutoComplete", "autocomplete"));
	mixin(AttributeTemplate!(typeof(this), "AutoFocus", "autofocus"));
	mixin(AttributeTemplate!(typeof(this), "Cols", "cols"));
	mixin(AttributeTemplate!(typeof(this), "DirName", "dirname"));
	mixin(AttributeTemplate!(typeof(this), "Disabled", "disabled"));
	mixin(AttributeTemplate!(typeof(this), "Form", "form"));
	mixin(AttributeTemplate!(typeof(this), "InputMode", "inputmode"));
	mixin(AttributeTemplate!(typeof(this), "MaxLength", "maxlength"));
	mixin(AttributeTemplate!(typeof(this), "MinLength", "minlength"));
	mixin(AttributeTemplate!(typeof(this), "Name", "name"));
	mixin(AttributeTemplate!(typeof(this), "PlaceHolder", "placeholder"));
	mixin(AttributeTemplate!(typeof(this), "ReadOnly", "readonly"));
	mixin(AttributeTemplate!(typeof(this), "Required", "required"));
	mixin(AttributeTemplate!(typeof(this), "Rows", "rows"));
	mixin(AttributeTemplate!(typeof(this), "Wrap", "wrap"));

}

