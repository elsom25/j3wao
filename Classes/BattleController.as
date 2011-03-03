package 
{
	import flash.display.MovieClip;

	/*The BattleController manages battles. It holds the player and enemy data, and provides a basic interface
	for launching attacks.*/
	public class BattleController extends MovieClip
	{
		protected var health:Number
		protected var actionPoints:Number
		
		public function BattleController()
		{
			health = 100;
			actionPoints = 100;
		}

		public function launchFireball():void
		{
			if ( actionPoints >= 2 )
			{
				actionPoints = actionPoints - 2;
				var attack:Attack = new Fireball(90);
				addChild( attack );
				//attack.getDamage( );
			}
		}		
		public function launchIceSpear():void
		{
			if(actionPoints >= 30)
			{
				actionPoints = actionPoints - 30;
				var attack:Attack = new IceSpear(90);
				addChild( attack );
				//attack.getDamage( );
			}
		}
	}
}