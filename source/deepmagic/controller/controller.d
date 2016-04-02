module deepmagic.controller.controller;

import deepmagic.controller;

class DeepmagicController(LayoutType){
	string name = "";

	URLRouter				router					= null;
	WebInterfaceSettings	web_interface_settings	= null;

	DeepmagicSettings	settings	= null;
	DeepmagicSession	session		= null;

	DeepmagicController[string]	controllers	= null;

	LayoutType layout = null;

	this(){
		this.layout	= new LayoutType();

		this.settings	= new DeepmagicSettings();
		this.session	= new DeepmagicSession();

		this.web_interface_settings = new WebInterfaceSettings;
		this.router = new URLRouter;
	}

	protected void add_controller(DeepmagicController controller){
		this.controllers[controller.name] = controller;
		this.router.any("*", controller.router);
	}

	void listen(){
		listenHTTP(
			this.settings,
			this.router
		);
	}

	protected string render_html(HTTPServerResponse response, LayoutElement view){
		this.layout = new LayoutType();
		this.layout.body_block.main_block.content_block.contents = view;
		this.layout.body_block.main_block.content_block.reset();

		string html = "<!DOCTYPE html>\n" ~ join(this.layout.pretty(3), "\n");
		response.writeBody(html, "text/html");
		return html;
	}
}
