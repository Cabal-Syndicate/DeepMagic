module deepmagic.orm.models.prototype.model;

import deepmagic.orm;

class PrototypeModel(DBConfigTemplate, RecordTemplate, PuppetTemplate, PuppetsTemplate){
	DBConfigTemplate database;

	this(DBConfigTemplate database){
		this.database = database;
	}

	RecordTemplate[] find(ORM_Query query){
		query.record_name = __traits(identifier, RecordTemplate);
		Query result = this.database.session.createQuery(query.toString());
		return result.list!(RecordTemplate)();
	}

	void populate(PuppetsTemplate _puppets){
		if(_puppets != null){
			foreach(int i, PuppetTemplate puppet; _puppets){
				RecordTemplate record = new RecordTemplate(this.database, puppet);
				record.save();
			}
		}
	}

	//take
	RecordTemplate first(ORM_Query query){
		return this.find(query)[0];
	}
	RecordTemplate last(ORM_Query query){
		return this.find(query)[$-1];
	}
	//find_by
	//find_each
	//find_in_batches
	//where
	//not
	//order
	//select
	//limit
	//group
	//count
	//having
	//reorder
	//reverse_order
	/+
	RecordTemplate[] reverse_order(ORM_Query query){
		import std.algorithm;
		return reverse(this.find(query));
	}
	+/
	//none
	//create
	//find_or_create_by
	//find_by_sql
	//select_all
	//pluck
	//ids
	//exists
	//includes
	//average
	//minimum
	//maximum
	//sum
	//explain
	/+
	//callbacks
	3.1 Creating an Object
		before_validation
		after_validation
		before_save
		around_save
		before_create
		around_create
		after_create
		after_save
		after_commit/after_rollback

	3.2 Updating an Object
		before_validation
		after_validation
		before_save
		around_save
		before_update
		around_update
		after_update
		after_save
		after_commit/after_rollback

	3.3 Destroying an Object
		before_destroy
		around_destroy
		after_destroy
		after_commit/after_rollback
	+/
}