module deepmagic.orm.models.configuration.dbc;

import deepmagic.orm;

struct DBC{
	string			uri		= "";
	string[string]	params	= null;
	EntityMetaData	schema	= null;
}