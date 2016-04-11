module deepmagic.dom.elements.form.keygen_element;

import deepmagic.dom;

class KeygenElement : Html5Element!("keygen"){
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "AutoFocus", "autofocus"));
	mixin(AttributeTemplate!(typeof(this), "Challenge", "challenge"));
	mixin(AttributeTemplate!(typeof(this), "Disabled", "disabled"));
	mixin(AttributeTemplate!(typeof(this), "Form", "form"));
	mixin(AttributeTemplate!(typeof(this), "KeyType", "keytype"));
	mixin(AttributeTemplate!(typeof(this), "Name", "name"));
}


