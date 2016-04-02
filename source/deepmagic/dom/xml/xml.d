module deepmagic.dom.xml.xml;

import deepmagic.dom;
/+
import std.algorithm : count, startsWith;
import std.array;
import std.ascii;
import std.string;
import std.encoding;
+/
enum cdata = "<![CDATA[";

bool isChar(dchar c)
{
	if (c <= 0xD7FF)
	{
		if (c >= 0x20)
			return true;
		switch(c)
		{
		case 0xA:
		case 0x9:
		case 0xD:
			return true;
		default:
			return false;
		}
	}
	else if (0xE000 <= c && c <= 0x10FFFF)
	{
		if ((c & 0x1FFFFE) != 0xFFFE) // U+FFFE and U+FFFF
			return true;
	}
	return false;
}

bool isSpace(dchar c)
{
	return c == '\u0020' || c == '\u0009' || c == '\u000A' || c == '\u000D';
}

bool isDigit(dchar c)
{
	if (c <= 0x0039 && c >= 0x0030)
		return true;
	else
		return lookup(DigitTable,c);
}

bool isLetter(dchar c) // rule 84
{
	return isIdeographic(c) || isBaseChar(c);
}

bool isIdeographic(dchar c)
{
	if (c == 0x3007)
		return true;
	if (c <= 0x3029 && c >= 0x3021 )
		return true;
	if (c <= 0x9FA5 && c >= 0x4E00)
		return true;
	return false;
}

bool isBaseChar(dchar c)
{
	return lookup(BaseCharTable,c);
}

bool isCombiningChar(dchar c)
{
	return lookup(CombiningCharTable,c);
}

bool isExtender(dchar c)
{
	return lookup(ExtenderTable,c);
}

S encode(S)(S s)
{
	string r;
	size_t lastI;
	auto result = appender!S();

	foreach (i, c; s)
	{
		switch (c)
		{
		case '&':  r = "&amp;"; break;
		case '"':  r = "&quot;"; break;
		case '\'': r = "&apos;"; break;
		case '<':  r = "&lt;"; break;
		case '>':  r = "&gt;"; break;
		default: continue;
		}
		// Replace with r
		result.put(s[lastI .. i]);
		result.put(r);
		lastI = i + 1;
	}

	if (!result.data.ptr) return s;
	result.put(s[lastI .. $]);
	return result.data;
}

enum DecodeMode
{
	NONE, LOOSE, STRICT
}

/**
 * Decodes a string by unescaping all predefined XML entities.
 *
 * encode() escapes certain characters (ampersand, quote, apostrophe, less-than
 * and greater-than), and similarly, decode() unescapes them. These functions
 * are provided for convenience only. You do not need to use them when using
 * the std.xml classes, because then all the encoding and decoding will be done
 * for you automatically.
 *
 * This function decodes the entities &amp;amp;, &amp;quot;, &amp;apos;,
 * &amp;lt; and &amp;gt,
 * as well as decimal and hexadecimal entities such as &amp;#x20AC;
 *
 * If the string does not contain an ampersand, the original will be returned.
 *
 * Note that the "mode" parameter can be one of DecodeMode.NONE (do not
 * decode), DecodeMode.LOOSE (decode, but ignore errors), or DecodeMode.STRICT
 * (decode, and throw a DecodeException in the event of an error).
 *
 * Standards: $(LINK2 http://www.w3.org/TR/1998/REC-xml-19980210, XML 1.0)
 *
 * Params:
 *	  s = The string to be decoded
 *	  mode = (optional) Mode to use for decoding. (Defaults to LOOSE).
 *
 * Throws: DecodeException if mode == DecodeMode.STRICT and decode fails
 *
 * Returns: The decoded string
 *
 * Examples:
 * --------------
 * writefln(decode("a &gt; b")); // writes "a > b"
 * --------------
 */
string decode(string s, DecodeMode mode=DecodeMode.LOOSE)
{
	import std.utf : encode;

	if (mode == DecodeMode.NONE) return s;

	char[] buffer;
	foreach (ref i; 0 .. s.length)
	{
		char c = s[i];
		if (c != '&')
		{
			if (buffer.length != 0) buffer ~= c;
		}
		else
		{
			if (buffer.length == 0)
			{
				buffer = s[0 .. i].dup;
			}
			if (startsWith(s[i..$],"&#"))
			{
				try
				{
					dchar d;
					string t = s[i..$];
					checkCharRef(t, d);
					char[4] temp;
					buffer ~= temp[0 .. std.utf.encode(temp, d)];
					i = s.length - t.length - 1;
				}
				catch(Err e)
				{
					if (mode == DecodeMode.STRICT)
						throw new DecodeException("Unescaped &");
					buffer ~= '&';
				}
			}
			else if (startsWith(s[i..$],"&amp;" )) { buffer ~= '&';  i += 4; }
			else if (startsWith(s[i..$],"&quot;")) { buffer ~= '"';  i += 5; }
			else if (startsWith(s[i..$],"&apos;")) { buffer ~= '\''; i += 5; }
			else if (startsWith(s[i..$],"&lt;"  )) { buffer ~= '<';  i += 3; }
			else if (startsWith(s[i..$],"&gt;"  )) { buffer ~= '>';  i += 3; }
			else
			{
				if (mode == DecodeMode.STRICT)
					throw new DecodeException("Unescaped &");
				buffer ~= '&';
			}
		}
	}
	return (buffer.length == 0) ? s : cast(string)buffer;
}

unittest
{
	void assertNot(string s)
	{
		bool b = false;
		try { decode(s,DecodeMode.STRICT); }
		catch (DecodeException e) { b = true; }
		assert(b,s);
	}

	// Assert that things that should work, do
	auto s = "hello";
	assert(decode(s,				DecodeMode.STRICT) is s);
	assert(decode("a &gt; b",	   DecodeMode.STRICT) == "a > b");
	assert(decode("a &lt; b",	   DecodeMode.STRICT) == "a < b");
	assert(decode("don&apos;t",	 DecodeMode.STRICT) == "don't");
	assert(decode("&quot;hi&quot;", DecodeMode.STRICT) == "\"hi\"");
	assert(decode("cat &amp; dog",  DecodeMode.STRICT) == "cat & dog");
	assert(decode("&#42;",		  DecodeMode.STRICT) == "*");
	assert(decode("&#x2A;",		 DecodeMode.STRICT) == "*");
	assert(decode("cat & dog",	  DecodeMode.LOOSE) == "cat & dog");
	assert(decode("a &gt b",		DecodeMode.LOOSE) == "a &gt b");
	assert(decode("&#;",			DecodeMode.LOOSE) == "&#;");
	assert(decode("&#x;",		   DecodeMode.LOOSE) == "&#x;");
	assert(decode("&#2G;",		  DecodeMode.LOOSE) == "&#2G;");
	assert(decode("&#x2G;",		 DecodeMode.LOOSE) == "&#x2G;");

	// Assert that things that shouldn't work, don't
	assertNot("cat & dog");
	assertNot("a &gt b");
	assertNot("&#;");
	assertNot("&#x;");
	assertNot("&#2G;");
	assertNot("&#x2G;");
}














public
{
	template Check(string msg)
	{
		string old = s;

		void fail()
		{
			s = old;
			throw new Err(s,msg);
		}

		void fail(Err e)
		{
			s = old;
			throw new Err(s,msg,e);
		}

		void fail(string msg2)
		{
			fail(new Err(s,msg2));
		}
	}

	void checkMisc(ref string s) // rule 27
	{
		mixin Check!("Misc");

		try
		{
				 if (s.startsWith("<!--")) { checkComment(s); }
			else if (s.startsWith("<?"))   { checkPI(s); }
			else						   { checkSpace(s); }
		}
		catch(Err e) { fail(e); }
	}

	void checkDocument(ref string s) // rule 1
	{
		mixin Check!("Document");
		try
		{
			checkProlog(s);
			checkElement(s);
			star!(checkMisc)(s);
		}
		catch(Err e) { fail(e); }
	}

	void checkChars(ref string s) // rule 2
	{
		// TO DO - Fix std.utf stride and decode functions, then use those
		// instead

		mixin Check!("Chars");

		dchar c;
		int n = -1;
		foreach(int i,dchar d; s)
		{
			if (!isChar(d))
			{
				c = d;
				n = i;
				break;
			}
		}
		if (n != -1)
		{
			s = s[n..$];
			fail(format("invalid character: U+%04X",c));
		}
	}

	void checkSpace(ref string s) // rule 3
	{
		mixin Check!("Whitespace");
		munch(s,"\u0020\u0009\u000A\u000D");
		if (s is old) fail();
	}

	void checkName(ref string s, out string name) // rule 5
	{
		mixin Check!("Name");

		if (s.length == 0) fail();
		int n;
		foreach(int i,dchar c;s)
		{
			if (c == '_' || c == ':' || isLetter(c)) continue;
			if (i == 0) fail();
			if (c == '-' || c == '.' || isDigit(c)
				|| isCombiningChar(c) || isExtender(c)) continue;
			n = i;
			break;
		}
		name = s[0..n];
		s = s[n..$];
	}

	void checkAttValue(ref string s) // rule 10
	{
		mixin Check!("AttValue");

		if (s.length == 0) fail();
		char c = s[0];
		if (c != '\u0022' && c != '\u0027')
			fail("attribute value requires quotes");
		s = s[1..$];
		for(;;)
		{
			munch(s,"^<&"~c);
			if (s.length == 0) fail("unterminated attribute value");
			if (s[0] == '<') fail("< found in attribute value");
			if (s[0] == c) break;
			try { checkReference(s); } catch(Err e) { fail(e); }
		}
		s = s[1..$];
	}

	void checkCharData(ref string s) // rule 14
	{
		mixin Check!("CharData");

		while (s.length != 0)
		{
			if (s.startsWith("&")) break;
			if (s.startsWith("<")) break;
			if (s.startsWith("]]>")) fail("]]> found within char data");
			s = s[1..$];
		}
	}

	void checkComment(ref string s) // rule 15
	{
		mixin Check!("Comment");

		try { checkLiteral("<!--",s); } catch(Err e) { fail(e); }
		ptrdiff_t n = s.indexOf("--");
		if (n == -1) fail("unterminated comment");
		s = s[n..$];
		try { checkLiteral("-->",s); } catch(Err e) { fail(e); }
	}

	void checkPI(ref string s) // rule 16
	{
		mixin Check!("PI");

		try
		{
			checkLiteral("<?",s);
			checkEnd("?>",s);
		}
		catch(Err e) { fail(e); }
	}

	void checkCDSect(ref string s) // rule 18
	{
		mixin Check!("CDSect");

		try
		{
			checkLiteral(cdata,s);
			checkEnd("]]>",s);
		}
		catch(Err e) { fail(e); }
	}

	void checkProlog(ref string s) // rule 22
	{
		mixin Check!("Prolog");

		try
		{
			/* The XML declaration is optional
			 * http://www.w3.org/TR/2008/REC-xml-20081126/#NT-prolog
			 */
			opt!(checkXMLDecl)(s);

			star!(checkMisc)(s);
			opt!(seq!(checkDocTypeDecl,star!(checkMisc)))(s);
		}
		catch(Err e) { fail(e); }
	}

	void checkXMLDecl(ref string s) // rule 23
	{
		mixin Check!("XMLDecl");

		try
		{
			checkLiteral("<?xml",s);
			checkVersionInfo(s);
			opt!(checkEncodingDecl)(s);
			opt!(checkSDDecl)(s);
			opt!(checkSpace)(s);
			checkLiteral("?>",s);
		}
		catch(Err e) { fail(e); }
	}

	void checkVersionInfo(ref string s) // rule 24
	{
		mixin Check!("VersionInfo");

		try
		{
			checkSpace(s);
			checkLiteral("version",s);
			checkEq(s);
			quoted!(checkVersionNum)(s);
		}
		catch(Err e) { fail(e); }
	}

	void checkEq(ref string s) // rule 25
	{
		mixin Check!("Eq");

		try
		{
			opt!(checkSpace)(s);
			checkLiteral("=",s);
			opt!(checkSpace)(s);
		}
		catch(Err e) { fail(e); }
	}

	void checkVersionNum(ref string s) // rule 26
	{
		mixin Check!("VersionNum");

		munch(s,"a-zA-Z0-9_.:-");
		if (s is old) fail();
	}

	void checkDocTypeDecl(ref string s) // rule 28
	{
		mixin Check!("DocTypeDecl");

		try
		{
			checkLiteral("<!DOCTYPE",s);
			//
			// TO DO -- ensure DOCTYPE is well formed
			// (But not yet. That's one of our "future directions")
			//
			checkEnd(">",s);
		}
		catch(Err e) { fail(e); }
	}

	void checkSDDecl(ref string s) // rule 32
	{
		mixin Check!("SDDecl");

		try
		{
			checkSpace(s);
			checkLiteral("standalone",s);
			checkEq(s);
		}
		catch(Err e) { fail(e); }

		int n = 0;
			 if (s.startsWith("'yes'") || s.startsWith("\"yes\"")) n = 5;
		else if (s.startsWith("'no'" ) || s.startsWith("\"no\"" )) n = 4;
		else fail("standalone attribute value must be 'yes', \"yes\","~
			" 'no' or \"no\"");
		s = s[n..$];
	}

	void checkElement(ref string s) // rule 39
	{
		mixin Check!("Element");

		string sname,ename,t;
		try { checkTag(s,t,sname); } catch(Err e) { fail(e); }

		if (t == "STag")
		{
			try
			{
				checkContent(s);
				t = s;
				checkETag(s,ename);
			}
			catch(Err e) { fail(e); }

			if (sname != ename)
			{
				s = t;
				fail("end tag name \"" ~ ename
					~ "\" differs from start tag name \""~sname~"\"");
			}
		}
	}

	// rules 40 and 44
	void checkTag(ref string s, out string type, out string name)
	{
		mixin Check!("Tag");

		try
		{
			type = "STag";
			checkLiteral("<",s);
			checkName(s,name);
			star!(seq!(checkSpace,checkAttribute))(s);
			opt!(checkSpace)(s);
			if (s.length != 0 && s[0] == '/')
			{
				s = s[1..$];
				type = "ETag";
			}
			checkLiteral(">",s);
		}
		catch(Err e) { fail(e); }
	}

	void checkAttribute(ref string s) // rule 41
	{
		mixin Check!("Attribute");

		try
		{
			string name;
			checkName(s,name);
			checkEq(s);
			checkAttValue(s);
		}
		catch(Err e) { fail(e); }
	}

	void checkETag(ref string s, out string name) // rule 42
	{
		mixin Check!("ETag");

		try
		{
			checkLiteral("</",s);
			checkName(s,name);
			opt!(checkSpace)(s);
			checkLiteral(">",s);
		}
		catch(Err e) { fail(e); }
	}

	void checkContent(ref string s) // rule 43
	{
		mixin Check!("Content");

		try
		{
			while (s.length != 0)
			{
				old = s;
					 if (s.startsWith("&"))		{ checkReference(s); }
				else if (s.startsWith("<!--"))	 { checkComment(s); }
				else if (s.startsWith("<?"))	   { checkPI(s); }
				else if (s.startsWith(cdata)) { checkCDSect(s); }
				else if (s.startsWith("</"))	   { break; }
				else if (s.startsWith("<"))		{ checkElement(s); }
				else							   { checkCharData(s); }
			}
		}
		catch(Err e) { fail(e); }
	}

	void checkCharRef(ref string s, out dchar c) // rule 66
	{
		mixin Check!("CharRef");

		c = 0;
		try { checkLiteral("&#",s); } catch(Err e) { fail(e); }
		int radix = 10;
		if (s.length != 0 && s[0] == 'x')
		{
			s = s[1..$];
			radix = 16;
		}
		if (s.length == 0) fail("unterminated character reference");
		if (s[0] == ';')
			fail("character reference must have at least one digit");
		while (s.length != 0)
		{
			char d = s[0];
			int n = 0;
			switch(d)
			{
				case 'F','f': ++n;	  goto case;
				case 'E','e': ++n;	  goto case;
				case 'D','d': ++n;	  goto case;
				case 'C','c': ++n;	  goto case;
				case 'B','b': ++n;	  goto case;
				case 'A','a': ++n;	  goto case;
				case '9':	 ++n;	  goto case;
				case '8':	 ++n;	  goto case;
				case '7':	 ++n;	  goto case;
				case '6':	 ++n;	  goto case;
				case '5':	 ++n;	  goto case;
				case '4':	 ++n;	  goto case;
				case '3':	 ++n;	  goto case;
				case '2':	 ++n;	  goto case;
				case '1':	 ++n;	  goto case;
				case '0':	 break;
				default: n = 100; break;
			}
			if (n >= radix) break;
			c *= radix;
			c += n;
			s = s[1..$];
		}
		if (!isChar(c)) fail(format("U+%04X is not a legal character",c));
		if (s.length == 0 || s[0] != ';') fail("expected ;");
		else s = s[1..$];
	}

	void checkReference(ref string s) // rule 67
	{
		mixin Check!("Reference");

		try
		{
			dchar c;
			if (s.startsWith("&#")) checkCharRef(s,c);
			else checkEntityRef(s);
		}
		catch(Err e) { fail(e); }
	}

	void checkEntityRef(ref string s) // rule 68
	{
		mixin Check!("EntityRef");

		try
		{
			string name;
			checkLiteral("&",s);
			checkName(s,name);
			checkLiteral(";",s);
		}
		catch(Err e) { fail(e); }
	}

	void checkEncName(ref string s) // rule 81
	{
		mixin Check!("EncName");

		munch(s,"a-zA-Z");
		if (s is old) fail();
		munch(s,"a-zA-Z0-9_.-");
	}

	void checkEncodingDecl(ref string s) // rule 80
	{
		mixin Check!("EncodingDecl");

		try
		{
			checkSpace(s);
			checkLiteral("encoding",s);
			checkEq(s);
			quoted!(checkEncName)(s);
		}
		catch(Err e) { fail(e); }
	}

	// Helper functions

	void checkLiteral(string literal,ref string s)
	{
		mixin Check!("Literal");

		if (!s.startsWith(literal)) fail("Expected literal \""~literal~"\"");
		s = s[literal.length..$];
	}

	void checkEnd(string end,ref string s)
	{
		// Deliberately no mixin Check here.

		auto n = s.indexOf(end);
		if (n == -1) throw new Err(s,"Unable to find terminating \""~end~"\"");
		s = s[n..$];
		checkLiteral(end,s);
	}

	// Metafunctions -- none of these use mixin Check

	void opt(alias f)(ref string s)
	{
		try { f(s); } catch(Err e) {}
	}

	void plus(alias f)(ref string s)
	{
		f(s);
		star!(f)(s);
	}

	void star(alias f)(ref string s)
	{
		while (s.length != 0)
		{
			try { f(s); }
			catch(Err e) { return; }
		}
	}

	void quoted(alias f)(ref string s)
	{
		if (s.startsWith("'"))
		{
			checkLiteral("'",s);
			f(s);
			checkLiteral("'",s);
		}
		else
		{
			checkLiteral("\"",s);
			f(s);
			checkLiteral("\"",s);
		}
	}

	void seq(alias f,alias g)(ref string s)
	{
		f(s);
		g(s);
	}
}

/**
 * Check an entire XML document for well-formedness
 *
 * Params:
 *	  s = the document to be checked, passed as a string
 *
 * Throws: CheckException if the document is not well formed
 *
 * CheckException's toString() method will yield the complete hierarchy of
 * parse failure (the XML equivalent of a stack trace), giving the line and
 * column number of every failure at every level.
 */
void check(string s)
{
	try
	{
		checkChars(s);
		checkDocument(s);
		if (s.length != 0) throw new Err(s,"Junk found after document");
	}
	catch(Err e)
	{
		e.complete(s);
		throw e;
	}
}

class CheckException : XMLException
{
	CheckException err; /// Parent in hierarchy
	private string tail;
	/**
	 * Name of production rule which failed to parse,
	 * or specific error message
	 */
	string msg;
	size_t line = 0; /// Line number at which parse failure occurred
	size_t column = 0; /// Column number at which parse failure occurred

	public this(string tail,string msg,Err err=null)
	{
		super(null);
		this.tail = tail;
		this.msg = msg;
		this.err = err;
	}

	private void complete(string entire)
	{
		string head = entire[0..$-tail.length];
		ptrdiff_t n = head.lastIndexOf('\n') + 1;
		line = head.count("\n") + 1;
		dstring t;
		transcode(head[n..$],t);
		column = t.length + 1;
		if (err !is null) err.complete(entire);
	}

	override string toString() const
	{
		string s;
		if (line != 0) s = format("Line %d, column %d: ",line,column);
		s ~= msg;
		s ~= '\n';
		if (err !is null) s = err.toString() ~ s;
		return s;
	}
}

public alias Err = CheckException;

// Private helper functions
public
{
	T toType(T)(Object o)
	{
		T t = cast(T)(o);
		if (t is null)
		{
			throw new InvalidTypeException("Attempt to compare a "
				~ T.stringof ~ " with an instance of another type");
		}
		return t;
	}

	string chop(ref string s, size_t n)
	{
		if (n == -1) n = s.length;
		string t = s[0..n];
		s = s[n..$];
		return t;
	}

	bool optc(ref string s, char c)
	{
		bool b = s.length != 0 && s[0] == c;
		if (b) s = s[1..$];
		return b;
	}

	void reqc(ref string s, char c)
	{
		if (s.length == 0 || s[0] != c) throw new TagException("");
		s = s[1..$];
	}

	size_t hash(string s,size_t h=0) @trusted nothrow
	{
		return typeid(s).getHash(&s) + h;
	}

	// Definitions from the XML specification
	immutable CharTable=[0x9,0x9,0xA,0xA,0xD,0xD,0x20,0xD7FF,0xE000,0xFFFD,
		0x10000,0x10FFFF];
	immutable BaseCharTable=[0x0041,0x005A,0x0061,0x007A,0x00C0,0x00D6,0x00D8,
		0x00F6,0x00F8,0x00FF,0x0100,0x0131,0x0134,0x013E,0x0141,0x0148,0x014A,
		0x017E,0x0180,0x01C3,0x01CD,0x01F0,0x01F4,0x01F5,0x01FA,0x0217,0x0250,
		0x02A8,0x02BB,0x02C1,0x0386,0x0386,0x0388,0x038A,0x038C,0x038C,0x038E,
		0x03A1,0x03A3,0x03CE,0x03D0,0x03D6,0x03DA,0x03DA,0x03DC,0x03DC,0x03DE,
		0x03DE,0x03E0,0x03E0,0x03E2,0x03F3,0x0401,0x040C,0x040E,0x044F,0x0451,
		0x045C,0x045E,0x0481,0x0490,0x04C4,0x04C7,0x04C8,0x04CB,0x04CC,0x04D0,
		0x04EB,0x04EE,0x04F5,0x04F8,0x04F9,0x0531,0x0556,0x0559,0x0559,0x0561,
		0x0586,0x05D0,0x05EA,0x05F0,0x05F2,0x0621,0x063A,0x0641,0x064A,0x0671,
		0x06B7,0x06BA,0x06BE,0x06C0,0x06CE,0x06D0,0x06D3,0x06D5,0x06D5,0x06E5,
		0x06E6,0x0905,0x0939,0x093D,0x093D,0x0958,0x0961,0x0985,0x098C,0x098F,
		0x0990,0x0993,0x09A8,0x09AA,0x09B0,0x09B2,0x09B2,0x09B6,0x09B9,0x09DC,
		0x09DD,0x09DF,0x09E1,0x09F0,0x09F1,0x0A05,0x0A0A,0x0A0F,0x0A10,0x0A13,
		0x0A28,0x0A2A,0x0A30,0x0A32,0x0A33,0x0A35,0x0A36,0x0A38,0x0A39,0x0A59,
		0x0A5C,0x0A5E,0x0A5E,0x0A72,0x0A74,0x0A85,0x0A8B,0x0A8D,0x0A8D,0x0A8F,
		0x0A91,0x0A93,0x0AA8,0x0AAA,0x0AB0,0x0AB2,0x0AB3,0x0AB5,0x0AB9,0x0ABD,
		0x0ABD,0x0AE0,0x0AE0,0x0B05,0x0B0C,0x0B0F,0x0B10,0x0B13,0x0B28,0x0B2A,
		0x0B30,0x0B32,0x0B33,0x0B36,0x0B39,0x0B3D,0x0B3D,0x0B5C,0x0B5D,0x0B5F,
		0x0B61,0x0B85,0x0B8A,0x0B8E,0x0B90,0x0B92,0x0B95,0x0B99,0x0B9A,0x0B9C,
		0x0B9C,0x0B9E,0x0B9F,0x0BA3,0x0BA4,0x0BA8,0x0BAA,0x0BAE,0x0BB5,0x0BB7,
		0x0BB9,0x0C05,0x0C0C,0x0C0E,0x0C10,0x0C12,0x0C28,0x0C2A,0x0C33,0x0C35,
		0x0C39,0x0C60,0x0C61,0x0C85,0x0C8C,0x0C8E,0x0C90,0x0C92,0x0CA8,0x0CAA,
		0x0CB3,0x0CB5,0x0CB9,0x0CDE,0x0CDE,0x0CE0,0x0CE1,0x0D05,0x0D0C,0x0D0E,
		0x0D10,0x0D12,0x0D28,0x0D2A,0x0D39,0x0D60,0x0D61,0x0E01,0x0E2E,0x0E30,
		0x0E30,0x0E32,0x0E33,0x0E40,0x0E45,0x0E81,0x0E82,0x0E84,0x0E84,0x0E87,
		0x0E88,0x0E8A,0x0E8A,0x0E8D,0x0E8D,0x0E94,0x0E97,0x0E99,0x0E9F,0x0EA1,
		0x0EA3,0x0EA5,0x0EA5,0x0EA7,0x0EA7,0x0EAA,0x0EAB,0x0EAD,0x0EAE,0x0EB0,
		0x0EB0,0x0EB2,0x0EB3,0x0EBD,0x0EBD,0x0EC0,0x0EC4,0x0F40,0x0F47,0x0F49,
		0x0F69,0x10A0,0x10C5,0x10D0,0x10F6,0x1100,0x1100,0x1102,0x1103,0x1105,
		0x1107,0x1109,0x1109,0x110B,0x110C,0x110E,0x1112,0x113C,0x113C,0x113E,
		0x113E,0x1140,0x1140,0x114C,0x114C,0x114E,0x114E,0x1150,0x1150,0x1154,
		0x1155,0x1159,0x1159,0x115F,0x1161,0x1163,0x1163,0x1165,0x1165,0x1167,
		0x1167,0x1169,0x1169,0x116D,0x116E,0x1172,0x1173,0x1175,0x1175,0x119E,
		0x119E,0x11A8,0x11A8,0x11AB,0x11AB,0x11AE,0x11AF,0x11B7,0x11B8,0x11BA,
		0x11BA,0x11BC,0x11C2,0x11EB,0x11EB,0x11F0,0x11F0,0x11F9,0x11F9,0x1E00,
		0x1E9B,0x1EA0,0x1EF9,0x1F00,0x1F15,0x1F18,0x1F1D,0x1F20,0x1F45,0x1F48,
		0x1F4D,0x1F50,0x1F57,0x1F59,0x1F59,0x1F5B,0x1F5B,0x1F5D,0x1F5D,0x1F5F,
		0x1F7D,0x1F80,0x1FB4,0x1FB6,0x1FBC,0x1FBE,0x1FBE,0x1FC2,0x1FC4,0x1FC6,
		0x1FCC,0x1FD0,0x1FD3,0x1FD6,0x1FDB,0x1FE0,0x1FEC,0x1FF2,0x1FF4,0x1FF6,
		0x1FFC,0x2126,0x2126,0x212A,0x212B,0x212E,0x212E,0x2180,0x2182,0x3041,
		0x3094,0x30A1,0x30FA,0x3105,0x312C,0xAC00,0xD7A3];
	immutable IdeographicTable=[0x3007,0x3007,0x3021,0x3029,0x4E00,0x9FA5];
	immutable CombiningCharTable=[0x0300,0x0345,0x0360,0x0361,0x0483,0x0486,
		0x0591,0x05A1,0x05A3,0x05B9,0x05BB,0x05BD,0x05BF,0x05BF,0x05C1,0x05C2,
		0x05C4,0x05C4,0x064B,0x0652,0x0670,0x0670,0x06D6,0x06DC,0x06DD,0x06DF,
		0x06E0,0x06E4,0x06E7,0x06E8,0x06EA,0x06ED,0x0901,0x0903,0x093C,0x093C,
		0x093E,0x094C,0x094D,0x094D,0x0951,0x0954,0x0962,0x0963,0x0981,0x0983,
		0x09BC,0x09BC,0x09BE,0x09BE,0x09BF,0x09BF,0x09C0,0x09C4,0x09C7,0x09C8,
		0x09CB,0x09CD,0x09D7,0x09D7,0x09E2,0x09E3,0x0A02,0x0A02,0x0A3C,0x0A3C,
		0x0A3E,0x0A3E,0x0A3F,0x0A3F,0x0A40,0x0A42,0x0A47,0x0A48,0x0A4B,0x0A4D,
		0x0A70,0x0A71,0x0A81,0x0A83,0x0ABC,0x0ABC,0x0ABE,0x0AC5,0x0AC7,0x0AC9,
		0x0ACB,0x0ACD,0x0B01,0x0B03,0x0B3C,0x0B3C,0x0B3E,0x0B43,0x0B47,0x0B48,
		0x0B4B,0x0B4D,0x0B56,0x0B57,0x0B82,0x0B83,0x0BBE,0x0BC2,0x0BC6,0x0BC8,
		0x0BCA,0x0BCD,0x0BD7,0x0BD7,0x0C01,0x0C03,0x0C3E,0x0C44,0x0C46,0x0C48,
		0x0C4A,0x0C4D,0x0C55,0x0C56,0x0C82,0x0C83,0x0CBE,0x0CC4,0x0CC6,0x0CC8,
		0x0CCA,0x0CCD,0x0CD5,0x0CD6,0x0D02,0x0D03,0x0D3E,0x0D43,0x0D46,0x0D48,
		0x0D4A,0x0D4D,0x0D57,0x0D57,0x0E31,0x0E31,0x0E34,0x0E3A,0x0E47,0x0E4E,
		0x0EB1,0x0EB1,0x0EB4,0x0EB9,0x0EBB,0x0EBC,0x0EC8,0x0ECD,0x0F18,0x0F19,
		0x0F35,0x0F35,0x0F37,0x0F37,0x0F39,0x0F39,0x0F3E,0x0F3E,0x0F3F,0x0F3F,
		0x0F71,0x0F84,0x0F86,0x0F8B,0x0F90,0x0F95,0x0F97,0x0F97,0x0F99,0x0FAD,
		0x0FB1,0x0FB7,0x0FB9,0x0FB9,0x20D0,0x20DC,0x20E1,0x20E1,0x302A,0x302F,
		0x3099,0x3099,0x309A,0x309A];
	immutable DigitTable=[0x0030,0x0039,0x0660,0x0669,0x06F0,0x06F9,0x0966,
		0x096F,0x09E6,0x09EF,0x0A66,0x0A6F,0x0AE6,0x0AEF,0x0B66,0x0B6F,0x0BE7,
		0x0BEF,0x0C66,0x0C6F,0x0CE6,0x0CEF,0x0D66,0x0D6F,0x0E50,0x0E59,0x0ED0,
		0x0ED9,0x0F20,0x0F29];
	immutable ExtenderTable=[0x00B7,0x00B7,0x02D0,0x02D0,0x02D1,0x02D1,0x0387,
		0x0387,0x0640,0x0640,0x0E46,0x0E46,0x0EC6,0x0EC6,0x3005,0x3005,0x3031,
		0x3035,0x309D,0x309E,0x30FC,0x30FE];

	bool lookup(const(int)[] table, int c)
	{
		while (table.length != 0)
		{
			auto m = (table.length >> 1) & ~1;
			if (c < table[m])
			{
				table = table[0..m];
			}
			else if (c > table[m+1])
			{
				table = table[m+2..$];
			}
			else return true;
		}
		return false;
	}

	string startOf(string s)
	{
		string r;
		foreach(char c;s)
		{
			r ~= (c < 0x20 || c > 0x7F) ? '.' : c;
			if (r.length >= 40) { r ~= "___"; break; }
		}
		return r;
	}

	void exit(string s=null)
	{
		throw new XMLException(s);
	}
}

