module deepmagic.dom.xml.element;

import deepmagic.dom;

class Element : Item{
	Tag tag; /// The start tag of the element
	Item[] items; /// The element's items
	Text[] texts; /// The element's text items
	CData[] cdatas; /// The element's CData items
	Comment[] comments; /// The element's comments
	ProcessingInstruction[] pis; /// The element's processing instructions
	Element[] elements; /// The element's child elements
	bool[string] _classes = null;
	Sass[] _sasses = null;

	this(string name, string interior=null){
		this(new Tag(name));
		if (interior.length != 0) opCatAssign(new Text(interior));
	}

	this(const(Tag) tag_){
		this.tag = new Tag(tag_.name);
		tag.type = TagType.EMPTY;
		foreach(k,v;tag_.attr) tag.attr[k] = v;
		tag.tagString = tag_.tagString;
	}

	void opCatAssign(Text item){
		texts ~= item;
		appendItem(item);
	}

	void opCatAssign(CData item){
		cdatas ~= item;
		appendItem(item);
	}

	void opCatAssign(Comment item){
		comments ~= item;
		appendItem(item);
	}

	void opCatAssign(ProcessingInstruction item){
		pis ~= item;
		appendItem(item);
	}

	void opCatAssign(Element item){
		elements ~= item;
		appendItem(item);
	}

	void opCatAssign(string item){
		this ~= new Text(item);
	}

	import deepmagic.sass;
	typeof(this) add_sass(Sass sass){
		this._sasses ~= sass;
		this.refresh_tag();
		return this;
	}
	
	typeof(this) add_class(string class_name, bool value = true){
		this._classes[class_name] = value;
		this.refresh_tag();
		return this;
	}

	typeof(this) add_class(string[] class_names){
		foreach(int key, string class_name; class_names){
			this.add_class(class_name);
		}
		return this;
	}

	typeof(this) remove_class(string class_name){
		if(class_name in this._classes){
			this._classes.remove(class_name);
		}
		this.refresh_tag();
		return this;
	}

	typeof(this) add_sass(Sass[] sasses){
		foreach(int key, Sass sass; sasses){
			this.add_sass(sass);
		}
		return this;
	}

	void opCatAssign(Sass sass){
		this.add_sass(sass);
	}

	protected void refresh_tag(){
		string c = "";
		foreach(int i, Sass sass; this._sasses){
			c ~= sass.name ~ " "; //TODO: This leaves a trailing " " at the end of the string, which is sloppy. Clean it up.
		}
		foreach(string s, bool v; this._classes){
			c ~= s ~ " "; //TODO: This leaves a trailing " " at the end of the string, which is sloppy. Clean it up.
		}
		this.tag.attr["class"] = c;
	}

	private void appendItem(Item item){
		items ~= item;
		if (tag.type == TagType.EMPTY && !item.isEmptyXML)
			tag.type = TagType.START;
	}

	void parse(ElementParser xml){
		xml.onText = (string s) { opCatAssign(new Text(s)); };
		xml.onCData = (string s) { opCatAssign(new CData(s)); };
		xml.onComment = (string s) { opCatAssign(new Comment(s)); };
		xml.onPI = (string s) { opCatAssign(new ProcessingInstruction(s)); };

		xml.onStartTag[null] = (ElementParser xml){
			auto e = new Element(xml.tag);
			e.parse(xml);
			opCatAssign(e);
		};

		xml.parse();
	}

	override bool opEquals(Object o){
		const element = toType!(const Element)(o);
		auto len = items.length;
		if (len != element.items.length) return false;
		foreach (i; 0 .. len){
			if (!items[i].opEquals(cast()element.items[i])) return false;
		}
		return true;
	}

	override int opCmp(Object o){
		const element = toType!(const Element)(o);
		for (uint i=0; ; ++i){
			if (i == items.length && i == element.items.length) return 0;
			if (i == items.length) return -1;
			if (i == element.items.length) return 1;
			if (items[i] != element.items[i])
				return items[i].opCmp(cast()element.items[i]);
		}
	}

	override size_t toHash() const{
		size_t hash = tag.toHash();
		foreach(item;items) hash += item.toHash();
		return hash;
	}

	const{
		string text(DecodeMode mode=DecodeMode.LOOSE){
			string buffer;
			foreach(item;items){
				Text t = cast(Text)item;
				if (t is null) throw new DecodeException(item.toString());
				buffer ~= decode(t.toString(),mode);
			}
			return buffer;
		}

		override string[] pretty(uint indent=2){

			if (isEmptyXML) return [ tag.toEmptyString() ];

			if (items.length == 1){
				Text t = cast(Text)(items[0]);
				if (t !is null)
				{
					return [tag.toStartString() ~ t.toString() ~ tag.toEndString()];
				}
			}

			string[] a = [ tag.toStartString() ];
			foreach(item;items){
				string[] b = item.pretty(indent);
				foreach(s;b)
				{
					a ~= rightJustify(s,count(s) + indent);
				}
			}
			a ~= tag.toEndString();
			return a;
		}

		override string toString(){
			if (isEmptyXML) return tag.toEmptyString();

			string buffer = tag.toStartString();
			foreach (item;items) { buffer ~= item.toString(); }
			buffer ~= tag.toEndString();
			return buffer;
		}

		override @property bool isEmptyXML() { return items.length == 0; }
	}
}
