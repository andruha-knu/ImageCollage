package imagescollage.view
{
	import imagescollage.constants.ViewConst;
	import imagescollage.factory.ViewFactory;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.display.Stage;
	import gui.ContainerTemplate;
	
	/**
	 * Main container for view components.
	 * @author Andriy
	 */
	public class ContainerView extends Sprite
	{
		private var _template:Sprite;
		
		public function ContainerView() 
		{ 		
			_template = new  ContainerTemplate();
			addChild(_template);
		}
		
		//--------------------------------------------------------------------------
		//
		// PUBLIC SECTION 
		//
		//--------------------------------------------------------------------------
		
		/** 
		 * Return template of view 
		 */
		public function get template():Sprite
		{
			return _template;
		}
		
	}
}