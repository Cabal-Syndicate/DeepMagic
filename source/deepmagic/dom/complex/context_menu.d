module deepmagic.dom.complex.context_menu;

import deepmagic.dom;

struct ContextMenuItem{
	string id = "";
	string value = "";
}

struct ContextMenuDatastructure{
	ContextMenuItem[] items = null;
}

class ContextMenuWidget : DivElement{
	ContextMenuDatastructure datastructure;

	this(ContextMenuDatastructure datastructure){
		super();
		this ~= new Sass("tile-config");
		this ~= new Sass("dropdown");
		this.datastructure = datastructure;
		this ~= new MenuAnchor();
		this ~= new DropdownList(this.datastructure.items);
	}

	class MenuAnchor : AElement{
		this(){
			super();
			this ~= new Sass("tile-menu");
			this.tag.attr["data-toggle"] = "dropdown";
			this.Href("");
			this ~= new Text("");
		}
	}

	class DropdownList : UlElement{
		this(ContextMenuItem[] items){
			super();
			this ~= new Sass("dropdown-menu");
			this ~= new Sass("animated");
			this ~= new Sass("pull-right");
			this ~= new Sass("text-right");
			foreach(int i, ContextMenuItem item; items){
				this ~= new ListItem(item);
			}
		}

		class ListItem : LiElement{
			this(ContextMenuItem item){
				super();
				this.Id = item.id;
				this ~= new ListAnchor(item);
			}

			class ListAnchor : AElement{
				this(ContextMenuItem item){
					super();
					this.Href("");
					this ~= new Text(item.value);
				}
			}
		}
	}
}