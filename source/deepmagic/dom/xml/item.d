module deepmagic.dom.xml.item;

import deepmagic.dom;

abstract class Item
{
	/// Compares with another Item of same type for equality
	abstract override bool opEquals(Object o);

	/// Compares with another Item of same type
	abstract override int opCmp(Object o);

	/// Returns the hash of this item
	abstract override size_t toHash() const;

	/// Returns a string representation of this item
	abstract override string toString() const;

	/**
	 * Returns an indented string representation of this item
	 *
	 * Params:
	 *	  indent = number of spaces by which to indent child elements
	 */
	string[] pretty(uint indent) const
	{
		string s = strip(toString());
		return s.length == 0 ? [] : [ s ];
	}

	/// Returns true if the item represents empty XML text
	abstract @property bool isEmptyXML() const;
}
