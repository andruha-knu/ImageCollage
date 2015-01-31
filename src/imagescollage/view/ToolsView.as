package imagescollage.view
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import gui.ToolsTemplate;
	
	/**
	 * Tools menu view.
	 * @author Andriy
	 */	
	public class ToolsView extends Sprite
	{
		public static const BTN_ADD_IMAGE:String = 'addImage';
		public static const BTN_DELETE_IMAGE:String = 'deleteImage';
		public static const BTN_SAVE_IMAGE:String = 'saveImage';		
		
		private var _template:Sprite;
		
		public function ToolsView() 
		{ 			
			_template = new ToolsTemplate();
			addChild(_template);
		}
		
		//--------------------------------------------------------------------------
		//
		// PUBLIC SECTION 
		//
		//--------------------------------------------------------------------------
		
		/** 
		 * Return template of view. 
		 * @return Sprite
		 */
		public function get template():Sprite
		{
			return _template;
		}	

		/** 
		 * Set properties to template components.
		 * @param name - name of display object
		 * @param property - property  of display object
		 * @param value - property value of display object 
		 */
		public function setProperty(name:String, property:String, value:*):void
		{
			if (template.getChildByName(name)) 
				if(template.getChildByName(name).hasOwnProperty(property))
					template.getChildByName(name)[property] = value;
		}
	}
}