module deepmagic.sass.sass;

import deepmagic.sass;

class Sass{
	string name = "";
	this(string name = ""){
		this.name = name;
	}
}

///Add Sass to Element
unittest{
	import deepmagic.dom;
	DivElement div = new DivElement();
	div.add_sass(new Sass("asdf"));
	div.add_sass(new Sass("qwerty"));
	assert(div._sasses[0].name == "asdf", div._sasses[0].name);
	assert(div._sasses[1].name == "qwerty", div._sasses[1].name);
	assert(div.toString() == "<div class=\"asdf qwerty \"></div>", div.toString());
}

unittest{
	Sass sass = new Sass();
}