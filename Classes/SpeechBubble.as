package  {
	
	import flash.display.SimpleButton;
	import flash.display.*;
	import flash.events.*;
	import flash.net.URLRequest;
	
	public class SpeechBubble extends MovieClip {
		
		var speechText:String;
		var portrait:Loader;
		
		public function SpeechBubble() {
			speechText = "Blah.";
			portrait = null;
		}
		
		public function setXY(posX:int, posY:int):void {
			x = posX;
			y = posY;
		}
		
		public function setSpeechText(newText:String):void {
			speechText = newText;
			speechTextBox.text = speechText;
		}
		
		public function setPortrait(newPortrait:String):void {
			portrait = new Loader();
			var url:URLRequest = new URLRequest(newPortrait);
			portrait.load(url);
		}
		
		public function getPortrait():Loader {
			if (portrait == null) {
				return null;
			}
			return portrait;
		}
		
		//Don't know if this works
		/*
		public function setSpeechFont(newFont:String):void {
			speechTextBox.font = newFont;
		}
		*/
	}
	
}
