module deepmagic.dom.xml.element_parser;

import deepmagic.dom;

class ElementParser
{
	alias Handler = void delegate(string);
	alias ElementHandler = void delegate(in Element element);
	alias ParserHandler = void delegate(ElementParser parser);

	public
	{
		Tag tag_;
		string elementStart;
		string* s;

		Handler commentHandler = null;
		Handler cdataHandler = null;
		Handler xiHandler = null;
		Handler piHandler = null;
		Handler rawTextHandler = null;
		Handler textHandler = null;

		// Private constructor for start tags
		this(ElementParser parent)
		{
			s = parent.s;
			this();
			tag_ = parent.tag_;
		}

		// Private constructor for empty tags
		this(Tag tag, string* t)
		{
			s = t;
			this();
			tag_ = tag;
		}
	}

	/**
	 * The Tag at the start of the element being parsed. You can read this to
	 * determine the tag's name and attributes.
	 */
	@property const(Tag) tag() const { return tag_; }

	/**
	 * Register a handler which will be called whenever a start tag is
	 * encountered which matches the specified name. You can also pass null as
	 * the name, in which case the handler will be called for any unmatched
	 * start tag.
	 *
	 * Examples:
	 * --------------
	 * // Call this function whenever a <podcast> start tag is encountered
	 * onStartTag["podcast"] = (ElementParser xml)
	 * {
	 *	 // Your code here
	 *	 //
	 *	 // This is a a closure, so code here may reference
	 *	 // variables which are outside of this scope
	 * };
	 *
	 * // call myEpisodeStartHandler (defined elsewhere) whenever an <episode>
	 * // start tag is encountered
	 * onStartTag["episode"] = &myEpisodeStartHandler;
	 *
	 * // call delegate dg for all other start tags
	 * onStartTag[null] = dg;
	 * --------------
	 *
	 * This library will supply your function with a new instance of
	 * ElementHandler, which may be used to parse inside the element whose
	 * start tag was just found, or to identify the tag attributes of the
	 * element, etc.
	 *
	 * Note that your function will be called for both start tags and empty
	 * tags. That is, we make no distinction between &lt;br&gt;&lt;/br&gt;
	 * and &lt;br/&gt;.
	 */
	ParserHandler[string] onStartTag;

	/**
	 * Register a handler which will be called whenever an end tag is
	 * encountered which matches the specified name. You can also pass null as
	 * the name, in which case the handler will be called for any unmatched
	 * end tag.
	 *
	 * Examples:
	 * --------------
	 * // Call this function whenever a </podcast> end tag is encountered
	 * onEndTag["podcast"] = (in Element e)
	 * {
	 *	 // Your code here
	 *	 //
	 *	 // This is a a closure, so code here may reference
	 *	 // variables which are outside of this scope
	 * };
	 *
	 * // call myEpisodeEndHandler (defined elsewhere) whenever an </episode>
	 * // end tag is encountered
	 * onEndTag["episode"] = &myEpisodeEndHandler;
	 *
	 * // call delegate dg for all other end tags
	 * onEndTag[null] = dg;
	 * --------------
	 *
	 * Note that your function will be called for both start tags and empty
	 * tags. That is, we make no distinction between &lt;br&gt;&lt;/br&gt;
	 * and &lt;br/&gt;.
	 */
	ElementHandler[string] onEndTag;

	protected this()
	{
		elementStart = *s;
	}

	/**
	 * Register a handler which will be called whenever text is encountered.
	 *
	 * Examples:
	 * --------------
	 * // Call this function whenever text is encountered
	 * onText = (string s)
	 * {
	 *	 // Your code here
	 *
	 *	 // The passed parameter s will have been decoded by the time you see
	 *	 // it, and so may contain any character.
	 *	 //
	 *	 // This is a a closure, so code here may reference
	 *	 // variables which are outside of this scope
	 * };
	 * --------------
	 */
	@property void onText(Handler handler) { textHandler = handler; }

	/**
	 * Register an alternative handler which will be called whenever text
	 * is encountered. This differs from onText in that onText will decode
	 * the text, whereas onTextRaw will not. This allows you to make design
	 * choices, since onText will be more accurate, but slower, while
	 * onTextRaw will be faster, but less accurate. Of course, you can
	 * still call decode() within your handler, if you want, but you'd
	 * probably want to use onTextRaw only in circumstances where you
	 * know that decoding is unnecessary.
	 *
	 * Examples:
	 * --------------
	 * // Call this function whenever text is encountered
	 * onText = (string s)
	 * {
	 *	 // Your code here
	 *
	 *	 // The passed parameter s will NOT have been decoded.
	 *	 //
	 *	 // This is a a closure, so code here may reference
	 *	 // variables which are outside of this scope
	 * };
	 * --------------
	 */
	void onTextRaw(Handler handler) { rawTextHandler = handler; }

	/**
	 * Register a handler which will be called whenever a character data
	 * segment is encountered.
	 *
	 * Examples:
	 * --------------
	 * // Call this function whenever a CData section is encountered
	 * onCData = (string s)
	 * {
	 *	 // Your code here
	 *
	 *	 // The passed parameter s does not include the opening <![CDATA[
	 *	 // nor closing ]]>
	 *	 //
	 *	 // This is a a closure, so code here may reference
	 *	 // variables which are outside of this scope
	 * };
	 * --------------
	 */
	@property void onCData(Handler handler) { cdataHandler = handler; }

	/**
	 * Register a handler which will be called whenever a comment is
	 * encountered.
	 *
	 * Examples:
	 * --------------
	 * // Call this function whenever a comment is encountered
	 * onComment = (string s)
	 * {
	 *	 // Your code here
	 *
	 *	 // The passed parameter s does not include the opening <!-- nor
	 *	 // closing -->
	 *	 //
	 *	 // This is a a closure, so code here may reference
	 *	 // variables which are outside of this scope
	 * };
	 * --------------
	 */
	@property void onComment(Handler handler) { commentHandler = handler; }

	/**
	 * Register a handler which will be called whenever a processing
	 * instruction is encountered.
	 *
	 * Examples:
	 * --------------
	 * // Call this function whenever a processing instruction is encountered
	 * onPI = (string s)
	 * {
	 *	 // Your code here
	 *
	 *	 // The passed parameter s does not include the opening <? nor
	 *	 // closing ?>
	 *	 //
	 *	 // This is a a closure, so code here may reference
	 *	 // variables which are outside of this scope
	 * };
	 * --------------
	 */
	@property void onPI(Handler handler) { piHandler = handler; }

	/**
	 * Register a handler which will be called whenever an XML instruction is
	 * encountered.
	 *
	 * Examples:
	 * --------------
	 * // Call this function whenever an XML instruction is encountered
	 * // (Note: XML instructions may only occur preceding the root tag of a
	 * // document).
	 * onPI = (string s)
	 * {
	 *	 // Your code here
	 *
	 *	 // The passed parameter s does not include the opening <! nor
	 *	 // closing >
	 *	 //
	 *	 // This is a a closure, so code here may reference
	 *	 // variables which are outside of this scope
	 * };
	 * --------------
	 */
	@property void onXI(Handler handler) { xiHandler = handler; }

	/**
	 * Parse an XML element.
	 *
	 * Parsing will continue until the end of the current element. Any items
	 * encountered for which a handler has been registered will invoke that
	 * handler.
	 *
	 * Throws: various kinds of XMLException
	 */
	void parse()
	{
		string t;
		Tag root = tag_;
		Tag[string] startTags;
		if (tag_ !is null) startTags[tag_.name] = tag_;

		while(s.length != 0)
		{
			if (startsWith(*s,"<!--"))
			{
				chop(*s,4);
				t = chop(*s,indexOf(*s,"-->"));
				if (commentHandler.funcptr !is null) commentHandler(t);
				chop(*s,3);
			}
			else if (startsWith(*s,"<![CDATA["))
			{
				chop(*s,9);
				t = chop(*s,indexOf(*s,"]]>"));
				if (cdataHandler.funcptr !is null) cdataHandler(t);
				chop(*s,3);
			}
			else if (startsWith(*s,"<!"))
			{
				chop(*s,2);
				t = chop(*s,indexOf(*s,">"));
				if (xiHandler.funcptr !is null) xiHandler(t);
				chop(*s,1);
			}
			else if (startsWith(*s,"<?"))
			{
				chop(*s,2);
				t = chop(*s,indexOf(*s,"?>"));
				if (piHandler.funcptr !is null) piHandler(t);
				chop(*s,2);
			}
			else if (startsWith(*s,"<"))
			{
				tag_ = new Tag(*s,true);
				if (root is null)
					return; // Return to constructor of derived class

				if (tag_.isStart)
				{
					startTags[tag_.name] = tag_;

					auto parser = new ElementParser(this);

					auto handler = tag_.name in onStartTag;
					if (handler !is null) (*handler)(parser);
					else
					{
						handler = null in onStartTag;
						if (handler !is null) (*handler)(parser);
					}
				}
				else if (tag_.isEnd)
				{
					auto startTag = startTags[tag_.name];
					string text;

					immutable(char)* p = startTag.tagString.ptr
						+ startTag.tagString.length;
					immutable(char)* q = tag_.tagString.ptr;
					text = decode(p[0..(q-p)], DecodeMode.LOOSE);

					auto element = new Element(startTag);
					if (text.length != 0) element ~= new Text(text);

					auto handler = tag_.name in onEndTag;
					if (handler !is null) (*handler)(element);
					else
					{
						handler = null in onEndTag;
						if (handler !is null) (*handler)(element);
					}

					if (tag_.name == root.name) return;
				}
				else if (tag_.isEmpty)
				{
					Tag startTag = new Tag(tag_.name);

					// FIX by hed010gy, for bug 2979
					// http://d.puremagic.com/issues/show_bug.cgi?id=2979
					if (tag_.attr.length > 0)
						  foreach(tn,tv; tag_.attr) startTag.attr[tn]=tv;
					// END FIX

					// Handle the pretend start tag
					string s2;
					auto parser = new ElementParser(startTag,&s2);
					auto handler1 = startTag.name in onStartTag;
					if (handler1 !is null) (*handler1)(parser);
					else
					{
						handler1 = null in onStartTag;
						if (handler1 !is null) (*handler1)(parser);
					}

					// Handle the pretend end tag
					auto element = new Element(startTag);
					auto handler2 = tag_.name in onEndTag;
					if (handler2 !is null) (*handler2)(element);
					else
					{
						handler2 = null in onEndTag;
						if (handler2 !is null) (*handler2)(element);
					}
				}
			}
			else
			{
				t = chop(*s,indexOf(*s,"<"));
				if (rawTextHandler.funcptr !is null)
					rawTextHandler(t);
				else if (textHandler.funcptr !is null)
					textHandler(decode(t,DecodeMode.LOOSE));
			}
		}
	}

	/**
	 * Returns that part of the element which has already been parsed
	 */
	override string toString() const
	{
		assert(elementStart.length >= s.length);
		return elementStart[0 .. elementStart.length - s.length];
	}

}
