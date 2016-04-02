module deepmagic.dom.complex.widgets.dashboard.dashboard;

import deepmagic.dom;

class DashboardWidget : DivElement{
	string _title = "Dashboard";
	DashboardDatastructure datastructure;

	this(DashboardDatastructure datastructure){
		super();
		this.datastructure = datastructure;
		this.init();
	}

	override void init(){
		this ~= new H4Element(
			Attributes(null, [new Sass("page-title")]),
			this._title
		);
		this ~= new ShortcutArea(this.datastructure);
	}

	class ShortcutArea : DivElement{
		this(DashboardDatastructure datastructure){
			super();
			this ~= new Sass("block-area");
			this ~= new Sass("shortcut-area");

			foreach(int i, Dashboard dashboard; datastructure.dashboards){
				this ~= new AElement(
					Attributes(null, [new Sass("shortcut"), new Sass("tile")]),
					[
						new ImgElement(
							Attributes(
								null,
								null,
								[
									"src" : dashboard.uri,
									"alt" : dashboard.name
								]
							),
							""
						),
						new SmallElement(
							Attributes(
								null,
								[
									new Sass("t-overflow")
								]
							),
							dashboard.name
						)
					]
				);
			}
		}
	}
}
