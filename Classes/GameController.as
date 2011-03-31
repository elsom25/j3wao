package  
{	
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.display.*;
	
	/*GameController is the main driver of the game. */
	public class GameController extends MovieClip
	{
		//This variable stores the main Game Controller of the game - this is initialized when a game is started
		static var mainGameController:GameController;
		
		static var storyEngine:StoryEngine;
		static var battleController:BattleController;
		//Variables to keep track of location in story and battles
		var storyPoint:int;
		var battlePoint:int;
		private var endImage:Loader;
		
		protected var endBattleDelay:Timer;
		
		//The default constructor should only be called for a new game
		public function GameController() 
		{
			//Store away gamecontroller for use by other classes
			mainGameController = this;
			storyPoint = 0;
			battlePoint = 0;
		}
		
		// Start a new game
		public function startNewGame():void {
			storyPoint = 0;
			battlePoint = 0;
			//Since it is a new game, let's start with the intro cinematic
			storyEngine = new StoryEngine();
			gotoAndStop(3);
			addChild(getStoryEngine());
			getStoryEngine().addEventListener(StoryEngine.CUTSCENE_FINISH, cutsceneFinish);
			getStoryEngine().startCutscene(storyPoint);
		}
		
		//The things that should happen when a cutscene is finished
		public function cutsceneFinish(event:Event):void {
			removeChild(getStoryEngine());
			//If it's the ending that just finished, go back to main menu
			if (storyPoint == StoryEngine.FINAL_STORY_ELEMENT_ID) {
				gotoAndStop(1);
			} else {
				//proceed the story counter
				storyPoint++;
				startBattle();
			}
		}
		
		//The things that should happen when a battle is finished
		public function battleFinish(event:Event):void {
			endImage = new Loader();
			endBattleDelay= new Timer(3000);
			endBattleDelay.addEventListener(TimerEvent.TIMER, cleanupBattle);
			endBattleDelay.start();
			endImage.load(new URLRequest("Images/Fonts/winning.png"));
			endImage.x = 586;
			endImage.y = 363;
			var top:int = getBattleController().numChildren - 1
			
			addChild(endImage);
			//getBattleController().setChildIndex(endImage, top);
		}
		
		private function cleanupBattle(event:Event):void {
			endBattleDelay.stop();
			removeChild(endImage);
			removeChild(getBattleController());
			battlePoint++;
			startCutscene();
		}
		
		//This function starts a new battle based on the current battle counter
		public function startBattle():void {
			//There should eventually be a way to change to different battles
			gotoAndStop(2);
			battlePoint++;
			addChild(getBattleController());
			//Implement function to start battles which takes in parameter for battle counter
			//battleController.startBattle(battlePoint);
			getBattleController().addEventListener(BattleController.BATTLE_FINISH, battleFinish);
		}
		
		//Start the next cutscene
		public function startCutscene():void {
			gotoAndStop(3);
			storyPoint++;
			addEventListener(StoryEngine.CUTSCENE_FINISH, cutsceneFinish);
		}
		
		
		//Call this function to gain access to the document to add items to display
		public static function getGameController():GameController {
			if (mainGameController == null) {
				mainGameController = new GameController();
			}
			return mainGameController;
		}
		
		public static function getBattleController():BattleController {
			if (battleController == null) {
				battleController = new BattleController();
			}
			return battleController;
		}
		
		public static function getStoryEngine():StoryEngine {
			if (storyEngine == null) {
				storyEngine = new StoryEngine();
			}
			return storyEngine;
		}
	}
}
