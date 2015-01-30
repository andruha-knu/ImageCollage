package context  
{
	import controller.CreateMainViewCommand;
	import controller.LoadImageCommand;
	import controller.SaveImageCommand;
	import events.ImagesCollageEvent;
	import model.ImageModel;
	import view.ImagesAreaMediator;
	import view.ImagesAreaView;
	import view.ContainerView;
	import flash.display.DisplayObjectContainer;
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Context;
	import view.ToolsMediator;
	import view.ToolsView;
	
	/**
	 * Main context of application.
	 * @author Andriy
	 */
	public class ImagesCollageContext extends Context
	{
		public function ImagesCollageContext(contextView:DisplayObjectContainer) 
		{
			super(contextView);
		}
		
		//--------------------------------------------------------------------------
		//
		// PUBLIC SECTION 
		//
		//--------------------------------------------------------------------------

		/**
		 * Init facade(all main objects for work).
		 * Start the application.
		 */
		override public function startup():void
		{
			commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, CreateMainViewCommand, ContextEvent, true);
			commandMap.mapEvent(ImagesCollageEvent.IMAGE_ADD, LoadImageCommand, ImagesCollageEvent);
			commandMap.mapEvent(ImagesCollageEvent.IMAGE_SAVE, SaveImageCommand, ImagesCollageEvent);
			
			injector.mapSingleton(ImageModel);
			
			mediatorMap.mapView(ToolsView, ToolsMediator);
			mediatorMap.mapView(ImagesAreaView, ImagesAreaMediator);
			
			super.startup();
		}
		
	}
}