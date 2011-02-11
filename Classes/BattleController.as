package 
{
	import flash.display.MovieClip;

	public class BattleController extends MovieClip
	{
		public function BattleController()
		{
		}

		public function launchFireball():void
		{
			var attack:Attack = new Fireball();
			addChild( attack );
		}		
		public function launchIceSpear():void
		{
			var attack:Attack = new IceSpear();
			addChild( attack );
		}
	}
}