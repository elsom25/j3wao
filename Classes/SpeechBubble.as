package  {
	
	import flash.display.SimpleButton;
	import flash.display.*;
	import flash.events.*;
	
	public class SpeechBubble extends MovieClip {
		
		var speechText:String;
		var portrait:Sprite;
		var posX:Number;
		var posY:Number;
		var posZ:Number;
		
		public function SpeechBubble() {
			speechText = "Blah.";
			portrait = new Sprite();
			posX = 100;
			posY = 100;
			posZ = 0;
		}
		
		public function setSpeechText(newText:String):void {
			speechText = newText;
			speechTextBox.text = speechText;
		}
	}
	
}
