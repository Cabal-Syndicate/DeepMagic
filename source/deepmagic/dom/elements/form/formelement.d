module deepmagic.dom.elements.form.formelement;

import deepmagic.dom;

class FormElement : Html5Element!("form"){
	mixin(ElementConstructorTemplate!());
	//TODO: Fix accept-charset
	mixin(AttributeTemplate!(typeof(this), "AcceptCharset", "accept-charset"));
	mixin(AttributeTemplate!(typeof(this), "Action", "action"));
	mixin(AttributeTemplate!(typeof(this), "AutoComplete", "autocomplete"));
	mixin(AttributeTemplate!(typeof(this), "EncType", "enctype"));
	mixin(AttributeTemplate!(typeof(this), "Method", "method"));
	mixin(AttributeTemplate!(typeof(this), "Name", "name"));
	mixin(AttributeTemplate!(typeof(this), "NoValidate", "novalidate"));
	mixin(AttributeTemplate!(typeof(this), "Target", "target"));
}

