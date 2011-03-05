package 
{
	import flash.display.MovieClip;
	import flash.events.Event;

	/*The BattleController manages battles. It holds the player and enemy data, and provides a basic interface
	for launching attacks.*/
	public class BattleController extends MovieClip
	{	
		public var health:Number;
		public var actionPoints:Number;
		protected var menu:BattleMenu;
		//CHANGE TO PROTECTED WHEN DONE DEBUGGING
		public var player:Entity;
		public var enemy:Array;
		
		public function BattleController()
		{
			player = new Entity(0,0,50, 100);
			enemy = new Array();
			enemy[0] = new Entity(0,0,100, 1000);
			enemy[1] = new Entity(0,0,50, 1000);
			menu = new BattleMenu();
			addChild(menu);
			menu.battleController = this;
			menu.addEventListener(BattleMenu.SHOW_EVENT, showMenu);
			menu.addEventListener(BattleMenu.HIDE_EVENT, hideMenu);
		}
		
		private function playerTurn(){
			//menu and specify target and stuff			
		}
		
		
		//CHANGE TO PRIVATE WHEN DONE DEBUG
		public function enemyTurn(){
			if ( Enemy[1].isDead() )
			{
				gotoAndStop("TitleFrame");
				
			}
			//launchFireball(Enemy[0], player);
		}

		public function launchFireball(attacker:Entity, target:Entity):void
		{
			if ( attacker.getMP() >= 2 )
			{
				var currentMP:int = attacker.spendMP(2);
				var attack:Attack = new Fireball(90);
				addChild( attack );
				target.takeDamage( attack.getDamage() );
			}
		}		
		public function launchIceSpear(attacker:Entity, target:Entity):void
		{
			if( attacker.getMP() >= 30)
			{
				var currentMP:int = attacker.spendMP(30);
				var attack:Attack = new IceSpear(90);
				addChild( attack );
				target.takeDamage( attack.getDamage() );
			}
		}
		
		public function hideMenu(ev:Event):void
		{
			menu.visible = false;
		}
		
		public function showMenu(ev:Event):void
		{
			menu.visible = true;
		}
	}
}