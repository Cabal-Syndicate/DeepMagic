module deepmagic.dom.elements.form.optgroupelement;

import deepmagic.dom;

class OptgroupElement : Html5Element!("optgroup"){
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "Disabled", "disabled"));
	mixin(AttributeTemplate!(typeof(this), "Label", "label"));
}

