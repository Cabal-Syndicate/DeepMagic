module deepmagic.orm.models.prototype.record;

import deepmagic.orm;

class PrototypeRecord(DBConfigTemplate, RecordType){
	@Transient{
		DBConfigTemplate database = null;
	}

	this(DBConfigTemplate database){
		this.database = database;//new DBConfigTemplate();
	}

	void save(){
		this.database.session.save(cast(RecordType)(this));
	}

	void update(){
		this.database.session.update(cast(RecordType)(this));
	}

	void remove(){
		this.database.session.remove(cast(RecordType)(this));
	}
}