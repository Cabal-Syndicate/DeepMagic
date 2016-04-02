module deepmagic.dom.xml.text;

import deepmagic.dom;

class Text : Item
{
	private string content;

	/**
	 * Construct a text (aka PCData) section
	 *
	 * Params:
	 *	  content = the text. This function encodes the text before
	 *	  insertion, so it is safe to insert any text
	 *
	 * Examples:
	 * --------------
	 * auto Text = new CData("a < b");
	 *	// constructs a &lt; b
	 * --------------
	 */
	this(string content)
	{
		this.content = encode(content);
	}

	/**
	 * Compares two text sections for equality
	 *
	 * Examples:
	 * --------------
	 * Text item1,item2;
	 * if (item1 == item2) { }
	 * --------------
	 */
	override bool opEquals(Object o)
	{
		const item = toType!(const Item)(o);
		const t = cast(Text)item;
		return t !is null && content == t.content;
	}

	/**
	 * Compares two text sections
	 *
	 * You should rarely need to call this function. It exists so that Texts
	 * can be used as associative array keys.
	 *
	 * Examples:
	 * --------------
	 * Text item1,item2;
	 * if (item1 < item2) { }
	 * --------------
	 */
	override int opCmp(Object o)
	{
		const item = toType!(const Item)(o);
		const t = cast(Text)item;
		return t !is null
			&& (content != t.content ? (content < t.content ? -1 : 1 ) : 0 );
	}

	/**
	 * Returns the hash of a text section
	 *
	 * You should rarely need to call this function. It exists so that Texts
	 * can be used as associative array keys.
	 */
	override size_t toHash() const { return hash(content); }

	/**
	 * Returns a string representation of this Text section
	 */
	override string toString() const { return content; }

	/**
	 * Returns true if the content is the empty string
	 */
	override @property bool isEmptyXML() const { return content.length == 0; }
}
