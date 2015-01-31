package imagescollage.controller 
{
	import imagescollage.event.ImageEvent;
	import imagescollage.event.SystemEvent;
	import imagescollage.factory.ViewFactory;
	import imagescollage.model.ImagesCollageModel;
	import imagescollage.view.ContainerView;
	import org.robotlegs.mvcs.Command;
	import imagescollage.view.ImagesAreaView;
	import imagescollage.view.ToolsView;
	
	/**
	 * Create main view and all components.
	 * @author Andriy
	 */	
	public class CreateMainViewCommand extends Command
	{
		[Inject]
		public var imageModel:ImagesCollageModel;

		public function CreateMainViewCommand() { }
		
		//--------------------------------------------------------------------------
		//
		// PUBLIC SECTION 
		//
		//--------------------------------------------------------------------------
				
		override public function execute():void
		{
			var containerView:ContainerView = new ContainerView();
			var toolsView:ToolsView = new ToolsView();
			var imagesAreaView:ImagesAreaView = new ImagesAreaView();
			imagesAreaView.x = 28;
			imagesAreaView.y = 140;
			imagesAreaView.mouseEnabled = false;
			imagesAreaView.mouseChildren = true;
			
			containerView.addChild(toolsView);
			containerView.addChild(imagesAreaView);
			contextView.addChild(containerView);
			
			imageModel.canvasForScreen = imagesAreaView;
			
			eventDispatcher.dispatchEvent(new ImageEvent(SystemEvent.MAIN_VIEW_CREATED_COMPLETE));
		}
				
	}
}