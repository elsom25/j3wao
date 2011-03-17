package  {
	
	import flash.events.*;
	
	/* The Plot Element class is the container that holds a bunch of speech dialogs representing individual cutscenes*/
	public class PlotElement {
		
		var speechDialogs:Array;
		
		public function PlotElement() {
			speechDialogs = new Array();
		}
		
		public function addDialog(dialog:SpeechBubble):void
		{
			speechDialogs.push(dialog);
		}
		
		public function executePlot():void {
			//Show the first dialog, then wait for click before showing the rest
			//When all dialogs are shown, send plot element completed event
			
			addChild(SimpleButton(speechDialogs[0]));
			
		}

	}
	
}
