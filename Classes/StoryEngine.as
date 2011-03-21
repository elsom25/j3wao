package  
{	
	import flash.text.TextField;
	import flash.display.MovieClip;

	/*
	The StoryEngine module is responsible for defining important story elements and triggering them at the correct times.
	*/
	public class StoryEngine extends MovieClip
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
			dialog.setXY(0, 0);
			intro.addDialog(dialog);
			cutScenes[0] = intro;
		}
		
		public function startCutscene(elementNumber:int):void {
			PlotElement(cutScenes[elementNumber]).executePlot();
			
		}
	}
}
