module deepmagic.dom.elements.form.meter_element;

import deepmagic.dom;

class MeterElement : Html5Element!("meter"){
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "Value", "value"));
	mixin(AttributeTemplate!(typeof(this), "Min", "min"));
	mixin(AttributeTemplate!(typeof(this), "Max", "max"));
	mixin(AttributeTemplate!(typeof(this), "Low", "low"));
	mixin(AttributeTemplate!(typeof(this), "High", "high"));
	mixin(AttributeTemplate!(typeof(this), "Optimum", "optimum"));
}

