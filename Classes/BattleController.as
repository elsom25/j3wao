package 
{
	import flash.display.MovieClip;

	/*The BattleController manages battles. It holds the player and enemy data, and provides a basic interface
	for launching attacks.*/
	public class BattleController extends MovieClip
	{
		public function BattleController()
		{
		}

		public function launchFireball():void
		{
			var attack:Attack = new Fireball(90);
			addChild( attack );
		}		
		public function launchIceSpear():void
		{
			var attack:Attack = new IceSpear(90);
			addChild( attack );
		}
	}
}