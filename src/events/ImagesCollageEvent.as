package events
{
	import flash.events.Event;
	
	/**
	 * Main event of application.
	 * @author Andriy
	 */	
	public class ImagesCollageEvent extends Event
	{
		public static const MAIN_VIEW_CREATED_COMPLETE:String = "mainViewCreatedComplete";
		
		public static const IMAGE_ADD:String = "imageAdd";
		public static const IMAGE_ADD_COMPLETE:String = "imageAddComplete";
		public static const IMAGE_ADD_CANCEL:String = "imageAddCancel";
		
		public static const IMAGE_SAVE:String = "imageSave";
		public static const IMAGE_SAVE_COMPLETE:String = "imageSaveComplete";
		public static const IMAGE_SAVE_CANCEL:String = "imageSaveCancel";
		
		public static const IMAGE_SELECT:String = "imageSelect";
		public static const IMAGE_NONE:String = "imageNone";
		
		public static const IMAGE_DELETE:String = "imageDelete";
		
		private var _data:*;
		
		public function ImagesCollageEvent(type:String, data:* = null):void
		{
			super(type);
			_data = data;
		}

		//--------------------------------------------------------------------------
		//
		// PUBLIC SECTION 
		//
		//--------------------------------------------------------------------------
		
		/**
		 * @return * - additional data if it present, by default <b>null</b>
		 */
		public function get data():* 
		{ 
			return _data; 	
		}
		
	}
}