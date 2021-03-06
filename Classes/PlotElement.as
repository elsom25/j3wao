﻿package  {
	
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
		var skipNextBattle:Boolean;
		
		public function PlotElement() {
			speechBubbles = new Array();
			dialogCounter = 0;
			skipNextBattle = false;
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
			loader.z = 0;
			GameController.getStoryEngine().addChild(loader);
			trace(backgroundImage);
			
			GameController.getStoryEngine().addChild(SpeechBubble(speechBubbles[dialogCounter]));
			//if speech bubble has a portrait, add it
			addPortrait(SpeechBubble(speechBubbles[dialogCounter]), 1350, 640);
			
			(SpeechBubble(speechBubbles[dialogCounter])).addEventListener(MouseEvent.CLICK, nextDialog);
		}
		
		public function nextDialog(event:MouseEvent):void {
			GameController.getStoryEngine().removeChild(SpeechBubble(speechBubbles[dialogCounter]));
			//if speech bubble had a portrait, remove it
			removePortrait(SpeechBubble(speechBubbles[dialogCounter]));
			dialogCounter++;
			if (dialogCounter == speechBubbles.length) {
				//We just finished with the last speech bubble - end cutscene
				dispatchEvent(new Event(StoryEngine.CUTSCENE_FINISH));
			} else
			{
				//Show next dialog box
				GameController.getStoryEngine().addChild(SpeechBubble(speechBubbles[dialogCounter]));
				addPortrait(SpeechBubble(speechBubbles[dialogCounter]), 1350, 640);
				(SpeechBubble(speechBubbles[dialogCounter])).addEventListener(MouseEvent.CLICK, nextDialog);
			}
		}
		
		private function addPortrait(bubble:SpeechBubble, posX:int, posY:int):void {
			var portrait = bubble.getPortrait();
			trace(bubble.portrait);
			if (portrait != null) {
				portrait.x = posX;
				portrait.y = posY;
				portrait.z = 1;
				GameController.getStoryEngine().addChild(portrait);
				trace("added portrait");
			}
		}
		
		private function removePortrait(bubble:SpeechBubble):void {
			if (bubble.getPortrait() != null) {
				GameController.getStoryEngine().removeChild(bubble.getPortrait());
			}
		}

	}
	
}
