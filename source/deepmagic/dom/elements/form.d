module deepmagic.dom.elements.form;

import deepmagic.dom;

class FormElement : Html5Element!("form"){
	mixin(ElementConstructorTemplate!());
	//TODO: Fix accept-charset
	mixin(AttributeTemplate!(typeof(this), "AcceptCharset", "accept-charset"));
	mixin(AttributeTemplate!(typeof(this), "Action", "action"));
	mixin(AttributeTemplate!(typeof(this), "AutoComplete", "autocomplete"));
	mixin(AttributeTemplate!(typeof(this), "EncType", "enctype"));
	mixin(AttributeTemplate!(typeof(this), "Method", "method"));
	mixin(AttributeTemplate!(typeof(this), "Name", "name"));
	mixin(AttributeTemplate!(typeof(this), "NoValidate", "novalidate"));
	mixin(AttributeTemplate!(typeof(this), "Target", "target"));
}

class LabelElement : Html5Element!("label"){
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "Form", "form"));
	mixin(AttributeTemplate!(typeof(this), "For", "for"));
}

class InputElement : Html5Element!("input"){
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "Accept", "accept"));
	mixin(AttributeTemplate!(typeof(this), "Alt", "alt"));
	mixin(AttributeTemplate!(typeof(this), "AutoComplete", "autocomplete"));
	mixin(AttributeTemplate!(typeof(this), "AutoFocus", "autofocus"));
	mixin(AttributeTemplate!(typeof(this), "Checked", "checked"));
	mixin(AttributeTemplate!(typeof(this), "DirName", "dirname"));
	mixin(AttributeTemplate!(typeof(this), "Disabled", "disabled"));
	mixin(AttributeTemplate!(typeof(this), "Form", "form"));
	mixin(AttributeTemplate!(typeof(this), "FormAction", "formaction"));
	mixin(AttributeTemplate!(typeof(this), "FormEncType", "formenctype"));
	mixin(AttributeTemplate!(typeof(this), "FormMethod", "formmethod"));
	mixin(AttributeTemplate!(typeof(this), "FormNoValidate", "formnovalidate"));
	mixin(AttributeTemplate!(typeof(this), "FormTarget", "formtarget"));
	mixin(AttributeTemplate!(typeof(this), "Height", "height"));
	mixin(AttributeTemplate!(typeof(this), "InputMode", "inputmode"));
	mixin(AttributeTemplate!(typeof(this), "list", "list"));
	mixin(AttributeTemplate!(typeof(this), "Max", "max"));
	mixin(AttributeTemplate!(typeof(this), "MaxLength", "maxlength"));
	mixin(AttributeTemplate!(typeof(this), "Min", "min"));
	mixin(AttributeTemplate!(typeof(this), "MinLength", "minlength"));
	mixin(AttributeTemplate!(typeof(this), "Multiple", "multiple"));
	mixin(AttributeTemplate!(typeof(this), "Name", "name"));
	mixin(AttributeTemplate!(typeof(this), "Pattern", "pattern"));
	mixin(AttributeTemplate!(typeof(this), "PlaceHolder", "placeholder"));
	mixin(AttributeTemplate!(typeof(this), "ReadOnly", "readonly"));
	mixin(AttributeTemplate!(typeof(this), "Required", "required"));
	mixin(AttributeTemplate!(typeof(this), "Size", "size"));
	mixin(AttributeTemplate!(typeof(this), "Src", "src"));
	mixin(AttributeTemplate!(typeof(this), "Step", "step"));
	mixin(AttributeTemplate!(typeof(this), "Type", "type"));
	mixin(AttributeTemplate!(typeof(this), "Value", "value"));
	mixin(AttributeTemplate!(typeof(this), "Width", "width"));
}

class ButtonElement : Html5Element!("button"){
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "AutoFocus", "audofocus"));
	mixin(AttributeTemplate!(typeof(this), "Disabled", "disabled"));
	mixin(AttributeTemplate!(typeof(this), "Form", "form"));
	mixin(AttributeTemplate!(typeof(this), "FormAction", "formaction"));
	mixin(AttributeTemplate!(typeof(this), "FormEncType", "formenctype"));
	mixin(AttributeTemplate!(typeof(this), "FormMethod", "formmethod"));
	mixin(AttributeTemplate!(typeof(this), "FormNoValidate", "formnovalidate"));
	mixin(AttributeTemplate!(typeof(this), "FormTarget", "formtarget"));
	mixin(AttributeTemplate!(typeof(this), "Menu", "menu"));
	mixin(AttributeTemplate!(typeof(this), "Name", "name"));
	mixin(AttributeTemplate!(typeof(this), "Type", "type"));
	mixin(AttributeTemplate!(typeof(this), "Value", "value"));
}

class SelectElement : Html5Element!("select"){
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "AutoFocus", "autofocus"));
	mixin(AttributeTemplate!(typeof(this), "Disabled", "disabled"));
	mixin(AttributeTemplate!(typeof(this), "Form", "form"));
	mixin(AttributeTemplate!(typeof(this), "Multiple", "multiple"));
	mixin(AttributeTemplate!(typeof(this), "Name", "name"));
	mixin(AttributeTemplate!(typeof(this), "Required", "required"));
	mixin(AttributeTemplate!(typeof(this), "Size", "size"));
}

class DatalistElement : Html5Element!("datalist"){
	mixin(ElementConstructorTemplate!());
}

class OptgroupElement : Html5Element!("optgroup"){
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "Disabled", "disabled"));
	mixin(AttributeTemplate!(typeof(this), "Label", "label"));
}

class OptionElement : Html5Element!("option"){
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "Disabled", "disabled"));
	mixin(AttributeTemplate!(typeof(this), "Label", "label"));
	mixin(AttributeTemplate!(typeof(this), "Selected", "selected"));
	mixin(AttributeTemplate!(typeof(this), "Value", "value"));

}

class TextareaElement : Html5Element!("textarea"){
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "AutoComplete", "autocomplete"));
	mixin(AttributeTemplate!(typeof(this), "AutoFocus", "autofocus"));
	mixin(AttributeTemplate!(typeof(this), "Cols", "cols"));
	mixin(AttributeTemplate!(typeof(this), "DirName", "dirname"));
	mixin(AttributeTemplate!(typeof(this), "Disabled", "disabled"));
	mixin(AttributeTemplate!(typeof(this), "Form", "form"));
	mixin(AttributeTemplate!(typeof(this), "InputMode", "inputmode"));
	mixin(AttributeTemplate!(typeof(this), "MaxLength", "maxlength"));
	mixin(AttributeTemplate!(typeof(this), "MinLength", "minlength"));
	mixin(AttributeTemplate!(typeof(this), "Name", "name"));
	mixin(AttributeTemplate!(typeof(this), "PlaceHolder", "placeholder"));
	mixin(AttributeTemplate!(typeof(this), "ReadOnly", "readonly"));
	mixin(AttributeTemplate!(typeof(this), "Required", "required"));
	mixin(AttributeTemplate!(typeof(this), "Rows", "rows"));
	mixin(AttributeTemplate!(typeof(this), "Wrap", "wrap"));

}

class KeygenElement : Html5Element!("keygen"){
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "AutoFocus", "autofocus"));
	mixin(AttributeTemplate!(typeof(this), "Challenge", "challenge"));
	mixin(AttributeTemplate!(typeof(this), "Disabled", "disabled"));
	mixin(AttributeTemplate!(typeof(this), "Form", "form"));
	mixin(AttributeTemplate!(typeof(this), "KeyType", "keytype"));
	mixin(AttributeTemplate!(typeof(this), "Name", "name"));
}

class OutputElement : Html5Element!("output"){
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "For", "for"));
	mixin(AttributeTemplate!(typeof(this), "Form", "form"));
	mixin(AttributeTemplate!(typeof(this), "Name", "name"));
}

class ProgressElement : Html5Element!("progress"){
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "Value", "value"));
	mixin(AttributeTemplate!(typeof(this), "Max", "max"));
}

class MeterElement : Html5Element!("meter"){
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "Value", "value"));
	mixin(AttributeTemplate!(typeof(this), "Min", "min"));
	mixin(AttributeTemplate!(typeof(this), "Max", "max"));
	mixin(AttributeTemplate!(typeof(this), "Low", "low"));
	mixin(AttributeTemplate!(typeof(this), "High", "high"));
	mixin(AttributeTemplate!(typeof(this), "Optimum", "optimum"));
}

class FieldsetElement : Html5Element!("fieldset"){
	mixin(ElementConstructorTemplate!());
	mixin(AttributeTemplate!(typeof(this), "Disabled", "disabled"));
	mixin(AttributeTemplate!(typeof(this), "Form", "form"));
	mixin(AttributeTemplate!(typeof(this), "Name", "name"));
}

class LegendElement : Html5Element!("legend"){
	mixin(ElementConstructorTemplate!());
}
