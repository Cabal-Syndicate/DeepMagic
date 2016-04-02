module deepmagic.orm.models.prototype.query;

import deepmagic.orm;

struct EXPRESSION{
	string key;
	string value;
	string operator = "=";

	string toString(){
		string query = "";
		query ~= "(";
		query ~= key~operator~"'"~value~"' ";
		query ~= ") ";
		return query;
	}
}

struct WHERE{
	EXPRESSION expression;
	EXPRESSION and;

	string toString(){
		string query = "WHERE ";
		query ~= expression.toString();
		//query ~= and.toString();
		return query;
	}
}

struct ORM_Query{
	string record_name = "";
	WHERE where;
	string[string] and;
	string[string] or;

	string toString(){
		string query = "FROM "~record_name~" "~where.toString();
		return query;
	}
}