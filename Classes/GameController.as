package  
{	
	import flash.display.MovieClip;
	/*GameController is the main driver of the game. */
	public class GameController 
	{
		//The default constructor should only be called for a new game
		public function GameController() 
		{
			//Since it is a new game, let's start with the intro cinematic
			var storyEngine:StoryEngine = new StoryEngine();
			gotoAndStop("StoryFrame");
			storyEngine.startCutscene(0);
			
			//Now wait for an event saying the cutscene is over and start up the battle sequence
			//TODO:
			
		}
	}
}
