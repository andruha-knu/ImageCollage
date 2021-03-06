package imagescollage.view 
{
	import com.greensock.TweenMax;
	import com.senocular.display.TransformTool;
	import imagescollage.event.ImageEvent;
	import flash.display.DisplayObject;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import imagescollage.model.ImagesCollageModel;
	import flash.events.MouseEvent;
	import org.robotlegs.mvcs.Mediator;
	import flash.display.Shape;
	
	/**
	 * Mediator for ImagesAreaView. 
	 * @author Andriy
	 */	
	public class ImagesAreaMediator extends Mediator
	{				
		[Inject]
		public var imagesAreaView:ImagesAreaView;

		[Inject]
		public var imageModel:ImagesCollageModel;		
		
		/** Keep track of the current tool being used. */
		private var _imageTransformTool:TransformTool;

		public function ImagesAreaMediator() { }
		
		//--------------------------------------------------------------------------
		//
		// PUBLIC SECTION 
		//
		//--------------------------------------------------------------------------
		
		override public function onRegister():void
		{
			initTransformTool();
			
			eventMap.mapListener(eventDispatcher, ImageEvent.IMAGE_ADD_COMPLETE, action);
			eventMap.mapListener(eventDispatcher, ImageEvent.IMAGE_DELETE, action);
			eventMap.mapListener(eventDispatcher, ImageEvent.IMAGE_UNSELECT, action);
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
		private function action(event:ImageEvent):void 
		{
			var spr:Sprite;
			
			switch (event.type) 
			{
				case ImageEvent.IMAGE_ADD_COMPLETE: 
				{
					_imageTransformTool.target = null;
					
					spr = event.data as Sprite;
					spr.mouseEnabled = false;
					spr.alpha = 0;
					
					imagesAreaView.addChild(spr);
					
					TweenMax.to(spr, 1, {alpha:1, onComplete:addImageComplete, onCompleteParams:[spr]});
					
					break;
				}
				case ImageEvent.IMAGE_DELETE: 
				{
					if (_imageTransformTool.target && imagesAreaView.contains(_imageTransformTool.target))
					{
						spr = _imageTransformTool.target as Sprite;
						spr.mouseEnabled = false;
						
						_imageTransformTool.target = null;
						
						eventDispatcher.dispatchEvent(new ImageEvent(ImageEvent.IMAGE_NONE));
						
						TweenMax.to(spr, 1, {alpha:0, onComplete:deleteImageComplete, onCompleteParams:[spr]});					
					}
					break;	
				}
				case ImageEvent.IMAGE_UNSELECT: 
				{
					_imageTransformTool.target = null;
					break;
				}
			}
		}

		/**
		 * Handler for adding image to view.
		 * @param spr - image, value <b>Sprite</b>
		 */
		private function addImageComplete(spr:Sprite):void 
		{
			spr.mouseEnabled = true;
		}
		
		/**
		 * Handler for deleting image from view.
		 * @param spr - image, value <b>Sprite</b>
		 */
		private function deleteImageComplete(spr:Sprite):void 
		{
			imagesAreaView.removeChild(spr);
			spr = null;
		}

		/**
		 * Initialize transform tool for images in ImagesAreaView.
		 * @param event - ImagesCollageEvent
		 */
		private function initTransformTool():void 
		{
			_imageTransformTool = new TransformTool();

			imagesAreaView.addChild(_imageTransformTool);
			contextView.addEventListener(MouseEvent.MOUSE_DOWN, select);
		}

		/**
		 * Selecting objects on the screen.
		 * @param event - MouseEvent
		 */ 
		private function select(even:MouseEvent):void 
		{
			if (imagesAreaView.contains(even.target as DisplayObject)) 
			{
				_imageTransformTool.target = even.target as Sprite;
				eventDispatcher.dispatchEvent(new ImageEvent(ImageEvent.IMAGE_SELECT));			
			}
			else if(!(even.target is SimpleButton)) 
			{
				_imageTransformTool.target = null;
				eventDispatcher.dispatchEvent(new ImageEvent(ImageEvent.IMAGE_NONE));
			}
		}
		
	}
}