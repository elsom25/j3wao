package  {
	
	import flash.events.*;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Loader;
	import flash.net.URLRequest;
	import flash.display.BitmapData;
	import flash.display.Bitmap;
	import flash.display.IBitmapDrawable;
	
	/* The Plot Element class is the container that holds a bunch of speech dialogs representing individual cutscenes*/
	public class PlotElement extends MovieClip{
		
		var speechBubbles:Array;
		var dialogCounter:int;
		var backgroundImage:String;
		
		public function PlotElement() {
			speechBubbles = new Array();
			dialogCounter = 0;
		}
		
		public function addDialog(dialog:SpeechBubble):void
		{
			speechBubbles.push(dialog);
		}
		
		public function setBackgroundImage(image:String):void
		{
			backgroundImage = image;
		}
		
		public function executePlot():void {
			//Show the first dialog, then wait for click before showing the rest
			//When all dialogs are shown, send plot element completed event
			
			//Load the background image
			var loader:Loader = new Loader();
			var url:URLRequest = new URLRequest(backgroundImage);
			loader.load(url);
			loader.z = 1;
			GameController.getStoryEngine().addChild(loader);
			trace("blah");
			
			GameController.getStoryEngine().addChild(SpeechBubble(speechBubbles[dialogCounter]));
			(SpeechBubble(speechBubbles[dialogCounter])).addEventListener(MouseEvent.CLICK, nextDialog);
		}
		
		public function nextDialog(event:MouseEvent):void {
			GameController.getStoryEngine().removeChild(SpeechBubble(speechBubbles[dialogCounter]));
			dialogCounter++;
			if (dialogCounter == speechBubbles.length) {
				//We just finished with the last speech bubble - end cutscene
				dispatchEvent(new Event(StoryEngine.CUTSCENE_FINISH));
			} else
			{
				//Show next dialog box
				GameController.getStoryEngine().addChild(SpeechBubble(speechBubbles[dialogCounter]));
				(SpeechBubble(speechBubbles[dialogCounter])).addEventListener(MouseEvent.CLICK, nextDialog);
			}
		}

	}
	
}
