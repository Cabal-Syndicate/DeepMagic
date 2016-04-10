module deepmagic.dom.elements.html5.html5element;

import deepmagic.dom;

class Html5Element(string tag_name = "", bool CAN_BE_EMPTY = false) : Element{
	bool can_be_empty = CAN_BE_EMPTY;
	
	mixin(AttributeTemplate!(typeof(this), "Id", "id"));
	mixin(AttributeTemplate!(typeof(this), "Title", "title"));
	mixin(AttributeTemplate!(typeof(this), "Lang", "lang"));
	mixin(AttributeTemplate!(typeof(this), "Translate", "translate"));
	mixin(AttributeTemplate!(typeof(this), "Dir", "dir"));
	//mixin(AttributeTemplate!(typeof(this), "Class", "class"));
	mixin(AttributeTemplate!(typeof(this), "Style", "style"));
	//mixin(AttributeTemplate!(typeof(this), "Data", "data-"));
	mixin(AttributeTemplate!(typeof(this), "OnAbort", "onabort"));
	mixin(AttributeTemplate!(typeof(this), "OnBlur", "onblur"));
	mixin(AttributeTemplate!(typeof(this), "OnCancel", "oncancel"));
	mixin(AttributeTemplate!(typeof(this), "OnCanPlay", "oncanplay"));
	mixin(AttributeTemplate!(typeof(this), "OnCanPlayThrough", "oncanplaythrough"));
	mixin(AttributeTemplate!(typeof(this), "OnChange", "onchange"));
	mixin(AttributeTemplate!(typeof(this), "OnClick", "onclick"));
	mixin(AttributeTemplate!(typeof(this), "OnCueChange", "oncuechange"));
	mixin(AttributeTemplate!(typeof(this), "OnDblClick", "ondblclick"));
	mixin(AttributeTemplate!(typeof(this), "OnDurationChange", "ondurationchange"));
	mixin(AttributeTemplate!(typeof(this), "OnEmptied", "onemptied"));
	mixin(AttributeTemplate!(typeof(this), "OnEnded", "onended"));
	mixin(AttributeTemplate!(typeof(this), "OnError", "onerror"));
	mixin(AttributeTemplate!(typeof(this), "OnFocus", "onfocus"));
	mixin(AttributeTemplate!(typeof(this), "OnInput", "oninput"));
	mixin(AttributeTemplate!(typeof(this), "OnInvalid", "oninvalid"));
	mixin(AttributeTemplate!(typeof(this), "OnKeyDown", "onkeydown"));
	mixin(AttributeTemplate!(typeof(this), "OnKeyPress", "onkeypress"));
	mixin(AttributeTemplate!(typeof(this), "OnKeyUp", "onkeyup"));
	mixin(AttributeTemplate!(typeof(this), "OnLoad", "onload"));
	mixin(AttributeTemplate!(typeof(this), "OnLoadedData", "onloadeddata"));
	mixin(AttributeTemplate!(typeof(this), "OnLoadedMetaData", "onloadedmetadata"));
	mixin(AttributeTemplate!(typeof(this), "OnLoadedStart", "onloadstart"));
	mixin(AttributeTemplate!(typeof(this), "OnMouseDown", "onmousedown"));
	mixin(AttributeTemplate!(typeof(this), "OnMouseEnter", "onmouseenter"));
	mixin(AttributeTemplate!(typeof(this), "OnMouseLeave", "onmouseleave"));
	mixin(AttributeTemplate!(typeof(this), "OnMouseMove", "onmousemove"));
	mixin(AttributeTemplate!(typeof(this), "OnMouseOut", "onmouseout"));
	mixin(AttributeTemplate!(typeof(this), "OnMouseOver", "onmouseover"));
	mixin(AttributeTemplate!(typeof(this), "OnMouseUp", "onmouseup"));
	mixin(AttributeTemplate!(typeof(this), "OnMouseWheel", "onmousewheel"));
	mixin(AttributeTemplate!(typeof(this), "OnPause", "onpause"));
	mixin(AttributeTemplate!(typeof(this), "OnPlay", "onplay"));
	mixin(AttributeTemplate!(typeof(this), "OnPlaying", "onplaying"));
	mixin(AttributeTemplate!(typeof(this), "OnProgress", "onprogress"));
	mixin(AttributeTemplate!(typeof(this), "OnRateChange", "onratechange"));
	mixin(AttributeTemplate!(typeof(this), "OnReset", "onreset"));
	mixin(AttributeTemplate!(typeof(this), "OnResize", "onresize"));
	mixin(AttributeTemplate!(typeof(this), "OnScroll", "onscroll"));
	mixin(AttributeTemplate!(typeof(this), "OnSeeked", "onseeked"));
	mixin(AttributeTemplate!(typeof(this), "OnSeeking", "onseeking"));
	mixin(AttributeTemplate!(typeof(this), "OnSelect", "onselect"));
	mixin(AttributeTemplate!(typeof(this), "OnShow", "onshow"));
	mixin(AttributeTemplate!(typeof(this), "OnStalled", "onstalled"));
	mixin(AttributeTemplate!(typeof(this), "OnSubmit", "onsubmit"));
	mixin(AttributeTemplate!(typeof(this), "OnSuspend", "onsuspend"));
	mixin(AttributeTemplate!(typeof(this), "OnTimeUpdate", "ontimeupdate"));
	mixin(AttributeTemplate!(typeof(this), "OnToggle", "ontoggle"));
	mixin(AttributeTemplate!(typeof(this), "OnVolumeChange", "onvolumechange"));
	mixin(AttributeTemplate!(typeof(this), "OnWaiting", "onwaiting"));
	
	this(string value = ""){
		super(new Html5Tag!(tag_name)());
		if(can_be_empty){
			this ~= new Text(value);
		}
	}

	this(Element element){
		this();
		if(element !is null){
			this ~= element;
		}
	}

	this(Element[] elements){
		this();
		if(elements !is null){
			foreach(int i, Element element; elements){
				this ~= element;
			}
		}
	}

	void init(){}

	void reset(){
		this.elements = null;
		this.init();
	}
}
