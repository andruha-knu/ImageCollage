package controller 
{
	import events.ImagesCollageEvent;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.FileFilter;
	import flash.net.FileReference;
	import flash.utils.ByteArray;
	import model.ImageModel;
	import org.robotlegs.mvcs.Command;
	import utils.PNGEncoder;
	import view.ContainerView;
	import view.ImagesAreaView;
	import view.ToolsView;
	
	/**
	 * Try to save you current image collage local on device.
	 * User can cancel operation.
	 * @author Andriy
	 */	
	public class SaveImageCommand extends Command
	{	
		[Inject]
		public var imageModel:ImageModel;

		private var _fileReference:FileReference;
		
		public function SaveImageCommand() { }
		
		//--------------------------------------------------------------------------
		//
		// PUBLIC SECTION 
		//
		//--------------------------------------------------------------------------
				
		override public function execute():void
		{
			saveImagesCollage(imageModel.canvasForScreen);
		}
			
		//--------------------------------------------------------------------------
		//
		// PRIVATE SECTION 
		//
		//--------------------------------------------------------------------------
		
		/**
		 * Try to save you current image collage local on device.
		 * @param canvas - some <b>Sprite</b> instance we want to make a screenshot
		 */
        public function saveImagesCollage(canvas:Sprite):void {
            var bitmapData:BitmapData = new BitmapData(canvas.width, canvas.height);
			bitmapData.draw(canvas);  

			var byteArray:ByteArray = PNGEncoder.encode(bitmapData);

			_fileReference = new FileReference();
			_fileReference.save(byteArray, ".png");
        }
	}
}