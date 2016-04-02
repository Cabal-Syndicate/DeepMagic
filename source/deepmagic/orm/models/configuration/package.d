module deepmagic.orm.models.configuration;

package import deepmagic.orm.models.configuration.db_config;
package import deepmagic.orm.models.configuration.dbc;
package import deepmagic.orm.models.configuration.sqlite_config;

enum DATABASE_ENGINES{
	MYSQL,
	SQLITE3,
	POSTGRES,
	MSSQL,
	MONGODB,
	REDIS
}
