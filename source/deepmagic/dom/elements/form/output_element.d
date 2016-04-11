module deepmagic.dom.elements.form.output_element;

import deepmagic.dom;

class OutputElement : Html5Element!("output"){
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "For", "for"));
	mixin(AttributeTemplate!(typeof(this), "Form", "form"));
	mixin(AttributeTemplate!(typeof(this), "Name", "name"));
}

