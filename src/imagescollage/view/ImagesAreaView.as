package imagescollage.view
{
	import flash.display.Bitmap;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.Stage;
	import gui.ImagesAreaTemplate;
	
	/**
	 * View for creating images collage.
	 * @author Andriy
	 */
	public class ImagesAreaView extends Sprite
	{
		private var _template:Sprite;
		
		public function ImagesAreaView() 
		{ 
			_template = new ImagesAreaTemplate();
			_template.mouseEnabled = false;
			_template.mouseChildren = false;			
			addChild(_template);
			
			var rectangle:Shape = new Shape(); 
			rectangle.graphics.beginFill(0xFFFFFF); 
			rectangle.graphics.drawRect(0, 0, 780,440);
			rectangle.graphics.endFill(); 
			addChild(rectangle);
			
			this.mask = rectangle;
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
		
	}
}