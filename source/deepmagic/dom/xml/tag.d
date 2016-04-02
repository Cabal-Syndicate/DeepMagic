module deepmagic.dom.xml.tag;

import deepmagic.dom;

enum TagType { START, END, EMPTY }

class Tag{
	TagType type = TagType.START;   /// Type of tag
	string name;					/// Tag name
	string[string] attr;			/// Associative array of attributes
	string tagString;

	invariant(){
		string s;
		string t;

		assert(type == TagType.START
			|| type == TagType.END
			|| type == TagType.EMPTY);

		s = name;
		try { checkName(s,t); }
		catch(Err e) { assert(false,"Invalid tag name:" ~ e.toString()); }

		foreach(k,v;attr){
			s = k;
			try { checkName(s,t); }
			catch(Err e){ assert(false,"Invalid atrribute name:" ~ e.toString()); }
		}
	}

	this(string name, TagType type=TagType.START){
		this.name = name;
		this.type = type;
	}

	this(ref string s, bool dummy){
		tagString = s;
		try{
			reqc(s,'<');
			if (optc(s,'/')) type = TagType.END;
			name = munch(s,"^/>"~whitespace);
			munch(s,whitespace);
			while(s.length > 0 && s[0] != '>' && s[0] != '/'){
				string key = munch(s,"^="~whitespace);
				munch(s,whitespace);
				reqc(s,'=');
				munch(s,whitespace);
				reqc(s,'"');
				string val = decode(munch(s,"^\""), DecodeMode.LOOSE);
				reqc(s,'"');
				munch(s,whitespace);
				attr[key] = val;
			}
			if (optc(s,'/')){
				if (type == TagType.END) throw new TagException("");
				type = TagType.EMPTY;
			}
			reqc(s,'>');
			tagString.length = (s.ptr - tagString.ptr);
		}
		catch(XMLException e){
			tagString.length = (s.ptr - tagString.ptr);
			throw new TagException(tagString);
		}
	}

	const{
		override bool opEquals(Object o){
			const tag = toType!(const Tag)(o);
			return
				(name != tag.name) ? false : (
				(attr != tag.attr) ? false : (
				(type != tag.type) ? false : (
			true )));
		}

		override int opCmp(Object o){
			const tag = toType!(const Tag)(o);
			// Note that attr is an AA, so the comparison is nonsensical (bug 10381)
			return
				((name != tag.name) ? ( name < tag.name ? -1 : 1 ) :
				((attr != tag.attr) ? ( cast(void *)attr < cast(void*)tag.attr ? -1 : 1 ) :
				((type != tag.type) ? ( type < tag.type ? -1 : 1 ) :
			0 )));
		}

		override size_t toHash(){
			return typeid(name).getHash(&name);
		}

		override string toString(){
			if (isEmpty) return toEmptyString();
			return (isEnd) ? toEndString() : toStartString();
		}

		public{
			string toNonEndString(){
				string s = "<" ~ name;
				foreach(key,val;attr)
					s ~= format(" %s=\"%s\"",key,encode(val));
				return s;
			}

			string toStartString() { return toNonEndString() ~ ">"; }
			string toEndString() { return "</" ~ name ~ ">"; }
			string toEmptyString() { return toNonEndString() ~ " />"; }
		}

		@property bool isStart() { return type == TagType.START; }
		@property bool isEnd()   { return type == TagType.END;   }
		@property bool isEmpty() { return type == TagType.EMPTY; }
	}
}
