module deepmagic.dom.elements.form.optgroup_element;

import deepmagic.dom;

class OptgroupElement : Html5Element!("optgroup"){
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "Disabled", "disabled"));
	mixin(AttributeTemplate!(typeof(this), "Label", "label"));
}

