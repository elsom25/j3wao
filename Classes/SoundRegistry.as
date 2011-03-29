package  
{	
	import flash.media.Sound;
	
	public class SoundRegistry 
	{
		[Embed(source="../normal-hitnormal.mp3")]
		private static var NormalHitNormalClass:Class;
		
		[Embed(source="../normal-hitclap.mp3")]
		private static var NormalHitClapClass:Class;
		
		[Embed(source="../tick3.mp3")]
		private static var beatClass:Class;
		
		public static var normalHitNormal:Sound; 
		public static var normalHitClap:Sound; 
		public static var beat:Sound; 
		
		public static function loadSounds():void
		{
			normalHitNormal = new NormalHitNormalClass() as Sound; 
			normalHitClap = new NormalHitClapClass() as Sound; 
			beat = new beatClass() as Sound;
		}
	}
}
