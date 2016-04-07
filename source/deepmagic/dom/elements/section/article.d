module deepmagic.dom.elements.section.article;

import deepmagic.dom;

class ArticleElement : Html5Element!("article"){
	mixin(ElementConstructorTemplate!());
}

class BodyElement : Html5Element!("body"){
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "OnAfterPrint", "onafterprint"));
	mixin(AttributeTemplate!(typeof(this), "OnBeforePrint", "onbeforeprint"));
	mixin(AttributeTemplate!(typeof(this), "OnBeforeUnload", "onbeforeunload"));
	mixin(AttributeTemplate!(typeof(this), "OnHashChange", "onhashchange"));
	mixin(AttributeTemplate!(typeof(this), "OnMessage", "onmessage"));
	mixin(AttributeTemplate!(typeof(this), "OnOffline", "onoffline"));
	mixin(AttributeTemplate!(typeof(this), "OnOnline", "ononline"));
	mixin(AttributeTemplate!(typeof(this), "OnPageHide", "onpagehide"));
	mixin(AttributeTemplate!(typeof(this), "OnPageShow", "onpageshow"));
	mixin(AttributeTemplate!(typeof(this), "OnPopState", "onpopstate"));
	mixin(AttributeTemplate!(typeof(this), "OnStorage", "onstorage"));
	mixin(AttributeTemplate!(typeof(this), "OnUnload", "onunload"));
}

class NavElement : Html5Element!("nav"){
	mixin(ElementConstructorTemplate!());
}

class AsideElement : Html5Element!("aside"){
	mixin(ElementConstructorTemplate!());
}

class H1Element : Html5Element!("h1", true){
	mixin(ElementConstructorTemplate!());
}

class H2Element : Html5Element!("h2", true){
	mixin(ElementConstructorTemplate!());
}

class H3Element : Html5Element!("h3", true){
	mixin(ElementConstructorTemplate!());
}

class H4Element : Html5Element!("h4", true){
	mixin(ElementConstructorTemplate!());
}

class H5Element : Html5Element!("h5", true){
	mixin(ElementConstructorTemplate!());
}

class H6Element : Html5Element!("h6", true){
	mixin(ElementConstructorTemplate!());
}

class HeaderElement : Html5Element!("header"){
	mixin(ElementConstructorTemplate!());
}

class FooterElement : Html5Element!("footer"){
	mixin(ElementConstructorTemplate!());
}

class AddressElement : Html5Element!("address"){
	mixin(ElementConstructorTemplate!());
}
