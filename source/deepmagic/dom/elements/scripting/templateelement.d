module deepmagic.dom.elements.scripting.templateelement;

import deepmagic.dom;

class TemplateElement : Html5Element!("template"){
	mixin(ElementConstructorTemplate!());
}

