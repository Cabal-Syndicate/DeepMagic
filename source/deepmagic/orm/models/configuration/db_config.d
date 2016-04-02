module deepmagic.orm.models.configuration.db_config;

import deepmagic.orm;

class DBConfig(DriverTemplate, DialectTemplate){
	@Transient{
		DriverTemplate	driver		= null;
		EntityMetaData	schema		= null;
		string			uri			= "";
		string[string]	params		= null;
		Dialect			dialect		= null;
	}

	this(){
		this.driver		= new DriverTemplate();
		this.dialect	= new DialectTemplate();
	}
	
	@Transient{
		@property{
			private Session _session = null;
			ref Session session(){
				if(_session is null){
					this._session = this.factory.openSession();
				}
				return this._session;
			}
		}

		@property{
			private DataSource _datasource = null;
			ref DataSource datasource(){
				if(this._datasource is null){
					this._datasource = new ConnectionPoolDataSourceImpl(this.driver, this.uri, this.params);
				}
				return this._datasource;
			}
		}

		@property{
			private DBInfo _db = null;
			ref DBInfo db(){
				if(this._db is null){
					this._db = this.factory.getDBMetaData();
				}
				return this._db;
			}
		}

		@property{
			private SessionFactory _factory = null;
			ref SessionFactory factory(){
				if(this._factory is null){
					this._factory = new SessionFactoryImpl(this.schema, this.dialect, this.datasource);
				}
				return this._factory;
			}
		}

		@property{
			private Connection _connection = null;
			ref Connection connection(){
				if(this._connection is null){
					this._connection = this.datasource.getConnection();
					scope(exit) this._connection.close();
				}
				return this._connection;
			}
		}
	}

	void update(){
		bool drop_tables = true;
		bool create_tables = true;
		this.db.updateDBSchema(this.connection, drop_tables, create_tables);
	}
}