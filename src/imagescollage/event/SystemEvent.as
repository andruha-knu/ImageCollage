package imagescollage.event
{
	import flash.events.Event;
	
	/**
	 * Main event of application.
	 * @author Andriy
	 */	
	public class SystemEvent extends Event
	{
		public static const MAIN_VIEW_CREATED_COMPLETE:String = "mainViewCreatedComplete";
		
		private var _data:*;
		
		public function SystemEvent(type:String, data:* = null):void
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