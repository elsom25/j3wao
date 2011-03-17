package  {
	
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
			//For every speech dialog in speechDialogs, show a conversation window
		}

	}
	
}
