module deepmagic.settings.settings;

import deepmagic.settings;

class DeepmagicSettings{
	HTTPServerSettings settings = null;
	alias settings this;

	this(){
		this.settings = new HTTPServerSettings;

		this.port = 8080;
		this.bindAddresses = [
			"::1",
			"127.0.0.1"
		];
		this.sessionStore = new MemorySessionStore;

		//this.errorPageHandler = toDelegate(&errorPage);
	}
	/+
	void errorPage(HTTPServerRequest request, HTTPServerResponse response, HTTPServerErrorInfo error){
		response.render!(
			"error/error.dt",
			request,
			response,
			error
		);
	}
	+/
}