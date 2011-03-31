﻿package  
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
		public static const FINAL_STORY_ELEMENT_ID:int = 2;
		
		//The default constructor should be called when a new game is started
		//TODO: Create another constructor to take in a parameter to start story somewhere else
		public function StoryEngine() 
		{
			cutScenes = new Array();
			
			//HARDCODING BOO
			//Introduction Sequence
			var intro:PlotElement = new PlotElement();
			intro.setBackgroundImage("Images/Backgrounds/blackintro1.png");
			var dialog:SpeechBubble = new SpeechBubble();
			dialog.setSpeechText("800 years ago, the land of Osiria was ravaged by war between humans and demons. The demons, with mightier armies and stronger magic, were winning.");
			dialog.setXY(25, 700);
			intro.addDialog(dialog);
			
			dialog = new SpeechBubble();
			dialog.setSpeechText("On the verge of defeat, a simple orphan boy came forward as a hero. Wielding his own magic, he rallied the armies of men everywhere, and cut to the heart of the demonic evil.");
			dialog.setXY(25, 700);
			intro.addDialog(dialog);
			
			dialog = new SpeechBubble();
			dialog.setSpeechText("When he fought, men nearby would swear that his attacks made the most melodious music they had ever heard, with every thrust and parry sounding its own specific note.");
			dialog.setXY(25, 700);
			intro.addDialog(dialog);
		
			dialog = new SpeechBubble();
			dialog.setSpeechText("Dancing to his own melody, the hero fought the demon king, and eventually managed to seal the demon king along with himself into a crystal pendant.");
			dialog.setXY(25, 700);
			intro.addDialog(dialog);
			
			dialog = new SpeechBubble();
			dialog.setSpeechText("After the war, the head priestess of Osiria prophesied that one day the demon king would return, and only the blood of the hero could defeat him.");
			dialog.setXY(25, 700);
			intro.addDialog(dialog);
			
			intro.skipNextBattle = true;
			
			cutScenes.push(intro);
			
			var wakeUp:PlotElement = new PlotElement();
			wakeUp.setBackgroundImage("Images/Backgrounds/sand dunes.png");
			
			dialog = new SpeechBubble();
			dialog.setSpeechText("LOL");
			dialog.setXY(25, 700);
			wakeUp.addDialog(dialog);
			
			cutScenes.push(wakeUp);
			
			//After-battle scene
			var afterBattle:PlotElement = new PlotElement();
			afterBattle.setBackgroundImage("Images/Backgrounds/dunetocity.png");
			
			dialog = new SpeechBubble();
			dialog.setSpeechText("YOU ARE WINNER");
			dialog.setXY(25, 700);
			afterBattle.addDialog(dialog);
			
			cutScenes.push(afterBattle);
		}
		
		public function startCutscene(elementNumber:int):void {
			PlotElement(cutScenes[elementNumber]).addEventListener(CUTSCENE_FINISH, cutsceneFinish);
			PlotElement(cutScenes[elementNumber]).executePlot();
		}
		
		private function cutsceneFinish(event:Event):void {
			dispatchEvent(new Event(CUTSCENE_FINISH));
		}
		
		public function skipNextBattle(elementNumber:int):Boolean {
			if (PlotElement(cutScenes[elementNumber]).skipNextBattle) {
				return true;
			}
			return false;
		}
	}
}
