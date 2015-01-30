package controller 
{
	import events.ImagesCollageEvent;
	import factory.ViewFactory;
	import model.ImageModel;
	import org.robotlegs.mvcs.Command;
	import view.ContainerView;
	import view.ImagesAreaView;
	import view.ToolsView;
	
	/**
	 * Create main view and all components.
	 * @author Andriy
	 */	
	public class CreateMainViewCommand extends Command
	{
		[Inject]
		public var imageModel:ImageModel;

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
			
			eventDispatcher.dispatchEvent(new ImagesCollageEvent(ImagesCollageEvent.MAIN_VIEW_CREATED_COMPLETE));
		}
				
	}
}