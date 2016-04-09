module deepmagic.dom.elements.section.bodyelement;

import deepmagic.dom;

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

