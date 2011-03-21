package  {
	
	import flash.display.SimpleButton;
	import flash.display.*;
	import flash.events.*;
	
	public class SpeechBubble extends MovieClip {
		
		var speechText:String;
		var portrait:Sprite;
		
		public function SpeechBubble() {
			speechText = "Blah.";
			portrait = new Sprite();
		}
		
		public function setXY(posX:int, posY:int) {
			x = posX;
			y = posY;
		}
		
		public function setSpeechText(newText:String):void {
			speechText = newText;
			speechTextBox.text = speechText;
		}
	}
	
}
