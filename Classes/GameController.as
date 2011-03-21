package  
{	
	import flash.display.MovieClip;
	import flash.text.TextField;
	
	/*GameController is the main driver of the game. */
	public class GameController extends MovieClip
	{
		//This variable stores the main Game Controller of the game - this is initialized when a game is started
		static var mainGameController:GameController;
		
		//The default constructor should only be called for a new game
		public function GameController() 
		{
			//Store away gamecontroller for use by other classes
			mainGameController = this;
		}
		
		// Start a new game
		public function startNewGame() {
			//Since it is a new game, let's start with the intro cinematic
			var storyEngine:StoryEngine = new StoryEngine();
			gotoAndStop(3);
			storyEngine.startCutscene(0);
			//TODO: Now wait for an event saying the cutscene is over and start up the battle sequence
		}
		
		
		//Call this function to gain access to the document to add items to display
		public static function getGameController():GameController {
			if (mainGameController == null) {
				mainGameController = new GameController();
			}
			return mainGameController;
		}
	}
}
