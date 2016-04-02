module deepmagic.dom.xml.processing_instruction;

import deepmagic.dom;

class ProcessingInstruction : Item
{
	private string content;

	/**
	 * Construct a Processing Instruction section
	 *
	 * Params:
	 *	  content = the body of the instruction segment
	 *
	 * Throws: PIException if the segment body is illegal (contains "?>")
	 *
	 * Examples:
	 * --------------
	 * auto item = new ProcessingInstruction("php");
	 *	// constructs <?php?>
	 * --------------
	 */
	this(string content)
	{
		if (content.indexOf("?>") != -1) throw new PIException(content);
		this.content = content;
	}

	/**
	 * Compares two processing instructions for equality
	 *
	 * Examples:
	 * --------------
	 * ProcessingInstruction item1,item2;
	 * if (item1 == item2) { }
	 * --------------
	 */
	override bool opEquals(Object o)
	{
		const item = toType!(const Item)(o);
		const t = cast(ProcessingInstruction)item;
		return t !is null && content == t.content;
	}

	/**
	 * Compares two processing instructions
	 *
	 * You should rarely need to call this function. It exists so that
	 * ProcessingInstructions can be used as associative array keys.
	 *
	 * Examples:
	 * --------------
	 * ProcessingInstruction item1,item2;
	 * if (item1 < item2) { }
	 * --------------
	 */
	override int opCmp(Object o)
	{
		const item = toType!(const Item)(o);
		const t = cast(ProcessingInstruction)item;
		return t !is null
			&& (content != t.content ? (content < t.content ? -1 : 1 ) : 0 );
	}

	/**
	 * Returns the hash of a ProcessingInstruction
	 *
	 * You should rarely need to call this function. It exists so that
	 * ProcessingInstructions can be used as associative array keys.
	 */
	override size_t toHash() const { return hash(content); }

	/**
	 * Returns a string representation of this ProcessingInstruction
	 */
	override string toString() const { return "<?" ~ content ~ "?>"; }

	override @property bool isEmptyXML() const { return false; } /// Returns false always
}
