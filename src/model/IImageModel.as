package model 
{
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Andriy
	 */
	public interface IImageModel 
	{
		function get canvasForScreen():Sprite;
		function set canvasForScreen(value:Sprite):void;
	}
	
}