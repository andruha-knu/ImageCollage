package imagescollage.model 
{
	import flash.display.Sprite;
	import org.robotlegs.mvcs.Actor;
	
	/**
	 * Main model of application.
	 * @author Andriy
	 */
	public class ImagesCollageModel extends Actor implements IImagesCollageModel
	{
		private var _canvasForScreen:Sprite;
		
		public function ImagesCollageModel() { }
		
		//--------------------------------------------------------------------------
		//
		// PUBLIC SECTION 
		//
		//--------------------------------------------------------------------------
		
		/** Get canvas from wich we will do screen, default <b>null</b> */
		public function get canvasForScreen():Sprite { return _canvasForScreen; }
		
		/** Set canvas from wich we will do screen */
		public function set canvasForScreen(value:Sprite):void { _canvasForScreen = value; }
								
	}
}