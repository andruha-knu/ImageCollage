package imagescollage.view 
{
	import imagescollage.event.ImageEvent;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import imagescollage.model.ImagesCollageModel;
	import flash.events.MouseEvent;
	import org.robotlegs.mvcs.Mediator;
	
	/**
	 * Mediator for ToolsView. Responsible for common menu (add, delete, save).
	 * @author Andriy
	 */	
	public class ToolsMediator extends Mediator
	{			
		[Inject]
		public var toolsView:ToolsView;
		
		public function ToolsMediator() { }		
		
		//--------------------------------------------------------------------------
		//
		// PUBLIC SECTION 
		//
		//--------------------------------------------------------------------------
		
		override public function onRegister():void
		{
			toolsView.setProperty(ToolsView.BTN_DELETE_IMAGE, 'enabled', false);
			toolsView.setProperty(ToolsView.BTN_DELETE_IMAGE, 'alpha', 0.5);
			
			eventMap.mapListener(toolsView, MouseEvent.CLICK, onClick);
			
			eventMap.mapListener(eventDispatcher, ImageEvent.IMAGE_SELECT, action);
			eventMap.mapListener(eventDispatcher, ImageEvent.IMAGE_NONE, action);
		}

		//--------------------------------------------------------------------------
		//
		// PRIVATE SECTION 
		//
		//--------------------------------------------------------------------------

		/**
		 * Handler for notifications from the system.
		 * @param event - ImagesCollageEvent
		 */
		private function action(even:ImageEvent):void 
		{
			switch (even.type) 
			{
				case ImageEvent.IMAGE_SELECT: 
				{
					toolsView.setProperty(ToolsView.BTN_DELETE_IMAGE, 'enabled', true);
					toolsView.setProperty(ToolsView.BTN_DELETE_IMAGE, 'alpha', 1);
					break;	
				}
				case ImageEvent.IMAGE_NONE:
				{
					toolsView.setProperty(ToolsView.BTN_DELETE_IMAGE, 'enabled', false);
					toolsView.setProperty(ToolsView.BTN_DELETE_IMAGE, 'alpha', 0.5);
					break;	
				}
			}
		}		
		
		/**
		 * Handler for view template events.
		 * @param event - MouseEvent
		 */
		private function onClick(event:MouseEvent):void 
		{
			var type:String = event.target.name;
			switch (type) 
			{
				case ToolsView.BTN_ADD_IMAGE: 
				{
					eventDispatcher.dispatchEvent(new ImageEvent(ImageEvent.IMAGE_ADD));
					break;
				} 
				case ToolsView.BTN_DELETE_IMAGE: 
				{
					eventDispatcher.dispatchEvent(new ImageEvent(ImageEvent.IMAGE_DELETE));
					break;
				}
				case ToolsView.BTN_SAVE_IMAGE: 
				{
					eventDispatcher.dispatchEvent(new ImageEvent(ImageEvent.IMAGE_SAVE));
					break;
				}
			}
		}
						
	}
}