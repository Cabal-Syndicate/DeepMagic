module deepmagic.dom.elements.form.fieldset_element;

import deepmagic.dom;

class FieldsetElement : Html5Element!("fieldset"){
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "Disabled", "disabled"));
	mixin(AttributeTemplate!(typeof(this), "Form", "form"));
	mixin(AttributeTemplate!(typeof(this), "Name", "name"));
}

