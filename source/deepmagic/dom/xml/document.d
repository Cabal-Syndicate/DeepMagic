module deepmagic.dom.xml.document;

import deepmagic.dom;

class Document : Element
{
	/**
	 * Contains all text which occurs before the root element.
	 * Defaults to &lt;?xml version="1.0"?&gt;
	 */
	string prolog = "<?xml version=\"1.0\"?>";
	/**
	 * Contains all text which occurs after the root element.
	 * Defaults to the empty string
	 */
	string epilog;

	/**
	 * Constructs a Document by parsing XML text.
	 *
	 * This function creates a complete DOM (Document Object Model) tree.
	 *
	 * The input to this function MUST be valid XML.
	 * This is enforced by DocumentParser's in contract.
	 *
	 * Params:
	 *	  s = the complete XML text.
	 */
	this(string s)
	in
	{
		assert(s.length != 0);
	}
	body
	{
		auto xml = new DocumentParser(s);
		string tagString = xml.tag.tagString;

		this(xml.tag);
		prolog = s[0 .. tagString.ptr - s.ptr];
		this.parse(xml);
		epilog = *xml.s;
	}

	/**
	 * Constructs a Document from a Tag.
	 *
	 * Params:
	 *	  tag = the start tag of the document.
	 */
	this(const(Tag) tag)
	{
		super(tag);
	}

	const
	{
		/**
		 * Compares two Documents for equality
		 *
		 * Examples:
		 * --------------
		 * Document d1,d2;
		 * if (d1 == d2) { }
		 * --------------
		 */
		override bool opEquals(Object o)
		{
			const doc = toType!(const Document)(o);
			return
				(prolog != doc.prolog			) ? false : (
				(super  != cast(const Element)doc) ? false : (
				(epilog != doc.epilog			) ? false : (
			true )));
		}

		/**
		 * Compares two Documents
		 *
		 * You should rarely need to call this function. It exists so that
		 * Documents can be used as associative array keys.
		 *
		 * Examples:
		 * --------------
		 * Document d1,d2;
		 * if (d1 < d2) { }
		 * --------------
		 */
		override int opCmp(Object o)
		{
			const doc = toType!(const Document)(o);
			return
				((prolog != doc.prolog			)
					? ( prolog < doc.prolog			 ? -1 : 1 ) :
				((super  != cast(const Element)doc)
					? ( cast()super  < cast()cast(const Element)doc ? -1 : 1 ) :
				((epilog != doc.epilog			)
					? ( epilog < doc.epilog			 ? -1 : 1 ) :
			0 )));
		}

		/**
		 * Returns the hash of a Document
		 *
		 * You should rarely need to call this function. It exists so that
		 * Documents can be used as associative array keys.
		 */
		override size_t toHash() @trusted
		{
			return hash(prolog, hash(epilog, (cast()super).toHash()));
		}

		/**
		 * Returns the string representation of a Document. (That is, the
		 * complete XML of a document).
		 */
		override string toString()
		{
			return prolog ~ super.toString() ~ epilog;
		}
	}
}
