package imagescollage  
{
	import imagescollage.controller.CreateMainViewCommand;
	import imagescollage.controller.LoadImageCommand;
	import imagescollage.controller.SaveImageCommand;
	import imagescollage.event.ImagesCollageEvent;
	import imagescollage.model.ImageModel;
	import imagescollage.view.ImagesAreaMediator;
	import imagescollage.view.ImagesAreaView;
	import imagescollage.view.ContainerView;
	import flash.display.DisplayObjectContainer;
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Context;
	import imagescollage.view.ToolsMediator;
	import imagescollage.view.ToolsView;
	
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