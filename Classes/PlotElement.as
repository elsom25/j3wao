package  {
	
	import flash.events.*;
	import flash.display.MovieClip;
	
	/* The Plot Element class is the container that holds a bunch of speech dialogs representing individual cutscenes*/
	public class PlotElement extends MovieClip{
		
		var speechBubbles:Array;
		
		public function PlotElement() {
			speechBubbles = new Array();
		}
		
		public function addDialog(dialog:SpeechBubble):void
		{
			speechBubbles.push(dialog);
		}
		
		public function executePlot():void {
			//Show the first dialog, then wait for click before showing the rest
			//When all dialogs are shown, send plot element completed event
			var bubble:SpeechBubble = speechBubbles[0];
			trace(bubble.speechTextBox.text);
			GameController.getGameController().addChild(SpeechBubble(speechBubbles[0]));			
		}

	}
	
}
