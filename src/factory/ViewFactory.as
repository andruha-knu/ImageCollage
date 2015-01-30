package factory 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.system.ApplicationDomain;
	import flash.utils.getDefinitionByName;
	
	/**
	 * Factory for view creation.
	 * @author Andriy
	 */
	public class ViewFactory implements IViewFactory
	{		
		/**
		 * Create view by class name.
		 * @param	className
		 * @return Sprite
		 */
		public function create(className:String):Sprite
		{	
			var classReference:Class = getDefinitionByName(className) as Class;      
			var view:Sprite = new classReference();
		
			return view;
		}
	}
}