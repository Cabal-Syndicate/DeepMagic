module deepmagic.dom.xml;

package import deepmagic.dom.xml.xml;
package import deepmagic.dom.xml.cdata;
package import deepmagic.dom.xml.comment;
package import deepmagic.dom.xml.document;
package import deepmagic.dom.xml.document_parser;
package import deepmagic.dom.xml.element;
package import deepmagic.dom.xml.element_parser;
package import deepmagic.dom.xml.exception;
package import deepmagic.dom.xml.item;
package import deepmagic.dom.xml.processing_instruction;
package import deepmagic.dom.xml.tag;
package import deepmagic.dom.xml.text;
package import deepmagic.dom.xml.xml_instruction;

package import std.algorithm : count, startsWith;
package import std.array;
package import std.ascii;
package import std.string;
package import std.encoding;
