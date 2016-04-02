module deepmagic.dom.xml.exception;

import deepmagic.dom;

/** The base class for exceptions thrown by this module */
class XMLException : Exception { this(string msg) { super(msg); } }

// Other exceptions

/// Thrown during Comment constructor
class CommentException : XMLException
{ this(string msg) { super(msg); } }

/// Thrown during CData constructor
//class CDataException : XMLException
//{ private this(string msg) { super(msg); } }

/// Thrown during XMLInstruction constructor
class XIException : XMLException
{ this(string msg) { super(msg); } }

/// Thrown during ProcessingInstruction constructor
class PIException : XMLException
{ this(string msg) { super(msg); } }

/// Thrown during Text constructor
class TextException : XMLException
{ this(string msg) { super(msg); } }

/// Thrown during decode()
class DecodeException : XMLException
{ this(string msg) { super(msg); } }

/// Thrown if comparing with wrong type
class InvalidTypeException : XMLException
{ this(string msg) { super(msg); } }

/// Thrown when parsing for Tags
class TagException : XMLException
{ this(string msg) { super(msg); } }

/+
/**
 * Thrown during check()
 */
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
+/
