module deepmagic.dom.elements.root.html_element;

import deepmagic.dom;

class HtmlElement : Html5Element!("html"){
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "Manifest", "manifest"));
}

