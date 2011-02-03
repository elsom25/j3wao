package  
{	
	import flash.display.MovieClip;

	public class BattleController extends MovieClip
	{
		public var action:Attack;
		
		public function BattleController() 
		{
			action = new IceSpear();
			addChild( action );
		}
	}
}
