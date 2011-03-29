package  
{	
	import flash.text.TextField;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.display.Sprite;
	import flash.display.Graphics;
	import flash.display.Bitmap;

	/*
	The StoryEngine module is responsible for defining important story elements and triggering them at the correct times.
	*/
	public class StoryEngine extends MovieClip
	{
		var cutScenes:Array;
		public static const CUTSCENE_FINISH:String = "event_cutscene_finish";
		//The id for the ending (credits?)
		public static const FINAL_STORY_ELEMENT_ID:int = 100;
		
		//The default constructor should be called when a new game is started
		//TODO: Create another constructor to take in a parameter to start story somewhere else
		public function StoryEngine() 
		{
			cutScenes = new Array();
			
			//HARDCODING BOO
			//Introduction Sequence
			var intro:PlotElement = new PlotElement();
			intro.setBackgroundImage("sanddunes.png");
			var dialog:SpeechBubble = new SpeechBubble();
			dialog.setSpeechText("GAME TIME STARTED");
			dialog.setXY(0, 700);
			intro.addDialog(dialog);
			cutScenes[0] = intro;
		}
		
		public function startCutscene(elementNumber:int):void {
			PlotElement(cutScenes[elementNumber]).addEventListener(CUTSCENE_FINISH, cutsceneFinish);
			PlotElement(cutScenes[elementNumber]).executePlot();
		}
		
		private function cutsceneFinish(event:Event):void {
			dispatchEvent(new Event(CUTSCENE_FINISH));
		}
	}
}
