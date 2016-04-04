module deepmagic.layout.code_black.script_block.script_block;

import deepmagic.layout.code_black;

class AppLayoutScriptBlock : DivElement{
	string[] scripts = null;

	this(){
		super();
		this.scripts ~= "/js/jquery.min.js";
		this.scripts ~= "/js/jquery-ui.min.js";
		this.scripts ~= "/js/jquery.easing.1.3.js";
		this.scripts ~= "/js/bootstrap.min.js";
		this.scripts ~= "/js/charts/jquery.flot.js";
		this.scripts ~= "/js/charts/jquery.flot.time.js";
		this.scripts ~= "/js/charts/jquery.flot.animator.min.js";
		this.scripts ~= "/js/charts/jquery.flot.resize.min.js";
		this.scripts ~= "/js/sparkline.min.js";
		this.scripts ~= "/js/easypiechart.js";
		this.scripts ~= "/js/charts.js";
		this.scripts ~= "/js/maps/jvectormap.min.js";
		this.scripts ~= "/js/maps/usa.js";
		this.scripts ~= "/js/icheck.js";
		this.scripts ~= "/js/scroll.min.js";
		this.scripts ~= "/js/calendar.min.js";
		this.scripts ~= "/js/feeds.min.js";

		//From Calendar
		this.scripts ~= "/js/scroll.min.js";
		this.scripts ~= "/js/validation/validate.min.js";
		this.scripts ~= "/js/validation/validationEngine.min.js";
		this.scripts ~= "/views/calendar/calendar.js";

		//From Charts
		this.scripts ~= "/js/charts/jquery.flot.js";
		this.scripts ~= "/js/charts/jquery.flot.time.js";
		this.scripts ~= "/js/charts/jquery.flot.animator.min.js";
		this.scripts ~= "/js/charts/jquery.flot.resize.min.js";
		this.scripts ~= "/js/charts/jquery.flot.orderBar.js";
		this.scripts ~= "/js/charts/jquery.flot.pie.min.js";
		this.scripts ~= "/js/sparkline.min.js";
		this.scripts ~= "/js/maps/world.js";

		//From File Manager
		this.scripts ~= "/js/file-manager/elfinder.min.js";
		this.scripts ~= "/views/file_manager/file_manager.js";

		//From Photo Gallery
		this.scripts ~= "/js/simple-inheritance.min.js";
		this.scripts ~= "/js/code-photoswipe-1.0.11.min.js";

		this.scripts ~= "/js/functions.js";
		this.init();
	}

	override void init(){
		foreach(int i, string script; this.scripts){
			ScriptElement s = new ScriptElement();
			s.tag.attr["src"] = script;
			s ~= new Text("");
			this ~= s;
		}
	}
}
