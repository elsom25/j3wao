package  
{	
	/*
	The StoryEngine module is responsible for defining important story elements and triggering them at the correct times.
	*/
	public class StoryEngine
	{
		var cutScenes:Array;
		
		//The default constructor should be called when a new game is started
		//TODO: Create another constructor to take in a parameter to start story somewhere else
		public function StoryEngine() 
		{
			cutScenes = new Array();
			
			//HARDCODING BOO
			//Introduction Sequence
			var intro:PlotElement = new PlotElement();
			var dialog:SpeechBubble = new SpeechBubble();
			dialog.setSpeechText("GAME TIME STARTED");
			intro.addDialog(dialog);
			intro.executePlot();
		}
	}
}
