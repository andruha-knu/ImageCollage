package imagescollage.model 
{
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Andriy
	 */
	public interface IImagesCollageModel 
	{
		function get canvasForScreen():Sprite;
		function set canvasForScreen(value:Sprite):void;
	}
	
}