module deepmagic.dom.elements.grouping.blockquoteelement;

import deepmagic.dom;

class BlockquoteElement : Html5Element!("blockquote"){
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "Cite", "cite"));
}

///Check Default Initialization.
unittest{
	BlockquoteElement blockquote = new BlockquoteElement();
	assert(blockquote.toString == "<blockquote />", blockquote.toString);
}

///Check Citation Attribute
unittest{
	BlockquoteElement blockquote = new BlockquoteElement();
	blockquote.Cite = "citation";
	assert(blockquote.toString == "<blockquote cite=\"citation\" />", blockquote.toString);
}
