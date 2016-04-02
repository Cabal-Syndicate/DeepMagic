module deepmagic.dom.xml.xml_instruction;

import deepmagic.dom;

class XMLInstruction : Item
{
	private string content;

	/**
	 * Construct an XML Instruction section
	 *
	 * Params:
	 *	  content = the body of the instruction segment
	 *
	 * Throws: XIException if the segment body is illegal (contains ">")
	 *
	 * Examples:
	 * --------------
	 * auto item = new XMLInstruction("ATTLIST");
	 *	// constructs <!ATTLIST>
	 * --------------
	 */
	this(string content)
	{
		if (content.indexOf(">") != -1) throw new XIException(content);
		this.content = content;
	}

	/**
	 * Compares two XML instructions for equality
	 *
	 * Examples:
	 * --------------
	 * XMLInstruction item1,item2;
	 * if (item1 == item2) { }
	 * --------------
	 */
	override bool opEquals(Object o)
	{
		const item = toType!(const Item)(o);
		const t = cast(XMLInstruction)item;
		return t !is null && content == t.content;
	}

	/**
	 * Compares two XML instructions
	 *
	 * You should rarely need to call this function. It exists so that
	 * XmlInstructions can be used as associative array keys.
	 *
	 * Examples:
	 * --------------
	 * XMLInstruction item1,item2;
	 * if (item1 < item2) { }
	 * --------------
	 */
	override int opCmp(Object o)
	{
		const item = toType!(const Item)(o);
		const t = cast(XMLInstruction)item;
		return t !is null
			&& (content != t.content ? (content < t.content ? -1 : 1 ) : 0 );
	}

	/**
	 * Returns the hash of an XMLInstruction
	 *
	 * You should rarely need to call this function. It exists so that
	 * XmlInstructions can be used as associative array keys.
	 */
	override size_t toHash() const { return hash(content); }

	/**
	 * Returns a string representation of this XmlInstruction
	 */
	override string toString() const { return "<!" ~ content ~ ">"; }

	override @property bool isEmptyXML() const { return false; } /// Returns false always
}
