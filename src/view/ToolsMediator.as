package view 
{
	import events.ImagesCollageEvent;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import model.ImageModel;
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
			
			eventMap.mapListener(eventDispatcher, ImagesCollageEvent.IMAGE_SELECT, action);
			eventMap.mapListener(eventDispatcher, ImagesCollageEvent.IMAGE_NONE, action);
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
		private function action(event:ImagesCollageEvent):void 
		{
			switch (event.type) 
			{
				case ImagesCollageEvent.IMAGE_SELECT: 
				{
					toolsView.setProperty(ToolsView.BTN_DELETE_IMAGE, 'enabled', true);
					toolsView.setProperty(ToolsView.BTN_DELETE_IMAGE, 'alpha', 1);
					break;	
				}
				case ImagesCollageEvent.IMAGE_NONE:
				{
					toolsView.setProperty(ToolsView.BTN_DELETE_IMAGE, 'enabled', false);
					toolsView.setProperty(ToolsView.BTN_DELETE_IMAGE, 'alpha', 0.5);
					break;	
				}
			}
		}		
		
		/**
		 * Handler for view template events
		 * @param event - MouseEvent
		 */
		private function onClick(event:MouseEvent):void 
		{
			var type:String = event.target.name;
			switch (type) 
			{
				case ToolsView.BTN_ADD_IMAGE: 
				{
					eventDispatcher.dispatchEvent(new ImagesCollageEvent(ImagesCollageEvent.IMAGE_ADD));
					break;
				} 
				case ToolsView.BTN_DELETE_IMAGE: 
				{
					eventDispatcher.dispatchEvent(new ImagesCollageEvent(ImagesCollageEvent.IMAGE_DELETE));
					break;
				}
				case ToolsView.BTN_SAVE_IMAGE: 
				{
					eventDispatcher.dispatchEvent(new ImagesCollageEvent(ImagesCollageEvent.IMAGE_SAVE));
					break;
				}
			}
		}
						
	}
}