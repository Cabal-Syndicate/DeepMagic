module deepmagic.dom.elements.section.section_element;

import deepmagic.dom;

class SectionElement : Html5Element!("section"){
	mixin(ElementConstructorTemplate!());
}

unittest{
	import std.stdio;
	"section".writeln;
}
