package imagescollage.controller 
{
	import imagescollage.event.ImagesCollageEvent;
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.FileFilter;
	import flash.net.FileReference;
	import org.robotlegs.mvcs.Command;
	import imagescollage.view.ContainerView;
	import imagescollage.view.ImagesAreaView;
	import imagescollage.view.ToolsView;
	
	/**
	 * Try to load image to our application.
	 * User can cancel operation.
	 * @author Andriy
	 */	
	public class LoadImageCommand extends Command
	{		 
		private var _file:FileReference;
		private var _fileLoader:Loader; 

		public function LoadImageCommand() { }
		
		//--------------------------------------------------------------------------
		//
		// PUBLIC SECTION 
		//
		//--------------------------------------------------------------------------
				
		override public function execute():void
		{
			showDialog();
		}

		//--------------------------------------------------------------------------
		//
		// PRIVATE SECTION 
		//
		//--------------------------------------------------------------------------		
		
		/**
		 * Show dialog box for image selection. 
		 */
		private function showDialog():void
		{
			_file = new FileReference();
 
			var imageFileTypes:FileFilter = new FileFilter("Images (*.jpg, *.png)", "*.jpg;*.png"); 
			_file.browse([imageFileTypes]);
			_file.addEventListener(Event.SELECT, selectFileHandler);
			_file.addEventListener(Event.CANCEL, cancelHandler);
            _file.addEventListener(IOErrorEvent.IO_ERROR, cancelHandler);
            _file.addEventListener(SecurityErrorEvent.SECURITY_ERROR, cancelHandler);
		}
		
		/**
		 * User selected image. Trying to load.
		 * @param event - Event
		 */ 
		private function selectFileHandler(event:Event):void
		{
			_file.addEventListener(Event.COMPLETE, loadFileHandler);
			_file.load();
		}

		/**
		 * Start load file.
		 * @param event - Event 
		 */ 
		private function loadFileHandler(event:Event):void
		{
			_fileLoader = new Loader();
			_fileLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, completeHandler);
			_fileLoader.loadBytes(_file.data);
		}
		
		/**
		 * Image loaded successful.
		 * @param event - Event 
		 */ 		
		private function completeHandler(event:Event):void
		{
			var loadedBitmap:Bitmap = _fileLoader.content as Bitmap;
			var sprite:Sprite = new Sprite();
			sprite.addChild(loadedBitmap);
   
			eventDispatcher.dispatchEvent(new ImagesCollageEvent(ImagesCollageEvent.IMAGE_ADD_COMPLETE, sprite));
		}
		
		/**
		 * Problems with selection image. Cancel operation.
		 * @param event - any problem event 
		 */ 
		private function cancelHandler(event:* = null):void 
		{
			eventDispatcher.dispatchEvent(new ImagesCollageEvent(ImagesCollageEvent.IMAGE_ADD_CANCEL));
		}
				
	}
}