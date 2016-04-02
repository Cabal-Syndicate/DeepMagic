module deepmagic.orm.models.configuration.sqlite_config;

import deepmagic.orm;

class SQLiteConfig : DBConfig!(SQLITEDriver, SQLiteDialect){
	this(){
		super();
	}
}