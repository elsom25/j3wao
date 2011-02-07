package 
{
	import flash.display.MovieClip;

	public class BattleController extends MovieClip
	{
		public var attack:Attack;

		public function BattleController()
		{
			attack = new IceSpear();
			addChild( attack );
		}
	}
}