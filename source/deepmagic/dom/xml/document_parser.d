module deepmagic.dom.xml.document_parser;

import deepmagic.dom;

class DocumentParser : ElementParser
{
	string xmlText;

	/**
	 * Constructs a DocumentParser.
	 *
	 * The input to this function MUST be valid XML.
	 * This is enforced by the function's in contract.
	 *
	 * Params:
	 *	  xmlText_ = the entire XML document as text
	 *
	 */
	this(string xmlText_)
	in
	{
		assert(xmlText_.length != 0);
		try
		{
			// Confirm that the input is valid XML
			check(xmlText_);
		}
		catch (CheckException e)
		{
			// And if it's not, tell the user why not
			assert(false, "\n" ~ e.toString());
		}
	}
	body
	{
		xmlText = xmlText_;
		s = &xmlText;
		super();	// Initialize everything
		parse();	// Parse through the root tag (but not beyond)
	}
}
