module deepmagic.dom.xml.comment;

import deepmagic.dom;

class Comment : Item
{
	private string content;

	/**
	 * Construct a comment
	 *
	 * Params:
	 *	  content = the body of the comment
	 *
	 * Throws: CommentException if the comment body is illegal (contains "--"
	 * or exactly equals "-")
	 *
	 * Examples:
	 * --------------
	 * auto item = new Comment("This is a comment");
	 *	// constructs <!--This is a comment-->
	 * --------------
	 */
	this(string content)
	{
		if (content == "-" || content.indexOf("==") != -1)
			throw new CommentException(content);
		this.content = content;
	}

	/**
	 * Compares two comments for equality
	 *
	 * Examples:
	 * --------------
	 * Comment item1,item2;
	 * if (item1 == item2) { }
	 * --------------
	 */
	override bool opEquals(Object o)
	{
		const item = toType!(const Item)(o);
		const t = cast(Comment)item;
		return t !is null && content == t.content;
	}

	/**
	 * Compares two comments
	 *
	 * You should rarely need to call this function. It exists so that Comments
	 * can be used as associative array keys.
	 *
	 * Examples:
	 * --------------
	 * Comment item1,item2;
	 * if (item1 < item2) { }
	 * --------------
	 */
	override int opCmp(Object o)
	{
		const item = toType!(const Item)(o);
		const t = cast(Comment)item;
		return t !is null && (content != t.content
			? (content < t.content ? -1 : 1 ) : 0 );
	}

	/**
	 * Returns the hash of a Comment
	 *
	 * You should rarely need to call this function. It exists so that Comments
	 * can be used as associative array keys.
	 */
	override size_t toHash() const { return hash(content); }

	/**
	 * Returns a string representation of this comment
	 */
	override string toString() const { return "<!--" ~ content ~ "-->"; }

	override @property bool isEmptyXML() const { return false; } /// Returns false always
}
