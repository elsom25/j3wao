package 
{
	import flash.display.MovieClip;
	import flash.events.Event;

	/*The BattleController manages battles. It holds the player and enemy data, and provides a basic interface
	for launching attacks.*/
	public class BattleController extends MovieClip
	{
		public var health:Number
		public var actionPoints:Number
		protected var menu:BattleMenu
		protected var attack:Attack
		
		public function BattleController()
		{
			health = 100;
			actionPoints = 100;
			menu = new BattleMenu();
			addChild(menu);
			menu.battleController = this;
			menu.addEventListener("finish", showMenu);
			menu.addEventListener("hide", hideMenu);
		}

		public function launchFireball():void
		{
			if ( actionPoints >= 2 )
			{
				actionPoints = actionPoints - 2;
				attack = new Fireball(90);
				addChild( attack );
				//attack.getDamage( );
			}
		}		
		public function launchIceSpear():void
		{
			if(actionPoints >= 30)
			{
				actionPoints = actionPoints - 30;
				attack = new IceSpear(90);
				addChild( attack );
				//attack.getDamage( );
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