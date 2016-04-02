module deepmagic.dom.xml.cdata;

import deepmagic.dom;

/// Thrown during CData constructor
class CDataException : XMLException
{ private this(string msg) { super(msg); } }

class CData : Item
{
	private string content;

	/**
	 * Construct a character data section
	 *
	 * Params:
	 *	  content = the body of the character data segment
	 *
	 * Throws: CDataException if the segment body is illegal (contains "]]>")
	 *
	 * Examples:
	 * --------------
	 * auto item = new CData("<b>hello</b>");
	 *	// constructs <![CDATA[<b>hello</b>]]>
	 * --------------
	 */
	this(string content)
	{
		if (content.indexOf("]]>") != -1) throw new CDataException(content);
		this.content = content;
	}

	/**
	 * Compares two CDatas for equality
	 *
	 * Examples:
	 * --------------
	 * CData item1,item2;
	 * if (item1 == item2) { }
	 * --------------
	 */
	override bool opEquals(Object o)
	{
		const item = toType!(const Item)(o);
		const t = cast(CData)item;
		return t !is null && content == t.content;
	}

	/**
	 * Compares two CDatas
	 *
	 * You should rarely need to call this function. It exists so that CDatas
	 * can be used as associative array keys.
	 *
	 * Examples:
	 * --------------
	 * CData item1,item2;
	 * if (item1 < item2) { }
	 * --------------
	 */
	override int opCmp(Object o)
	{
		const item = toType!(const Item)(o);
		const t = cast(CData)item;
		return t !is null && (content != t.content
			? (content < t.content ? -1 : 1 ) : 0 );
	}

	/**
	 * Returns the hash of a CData
	 *
	 * You should rarely need to call this function. It exists so that CDatas
	 * can be used as associative array keys.
	 */
	override size_t toHash() const { return hash(content); }

	/**
	 * Returns a string representation of this CData section
	 */
	override string toString() const { return cdata ~ content ~ "]]>"; }

	override @property bool isEmptyXML() const { return false; } /// Returns false always
}
