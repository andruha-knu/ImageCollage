package 
{
	import context.ImagesCollageContext;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageQuality;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Andriy
	 */	
	public class Main extends Sprite 
	{
		private var _context:ImagesCollageContext;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		//--------------------------------------------------------------------------
		//
		// PRIVATE SECTION 
		//
		//--------------------------------------------------------------------------

		/**
		 * Handler for main container added to stage.
		 * @param event - Event 
		 */		
		private function init(e:Event = null):void 
		{
			setupStage();
			
			removeEventListener(Event.ADDED_TO_STAGE, init);
			_context = new ImagesCollageContext(this);
		}

		/**
		 * Set up main settings for stage. 
		 */
		private function setupStage():void {
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP;
			stage.tabChildren = false;
			stage.stageFocusRect = false;
			stage.quality = StageQuality.HIGH;
			stage.focus = stage;
		}		
	}
}