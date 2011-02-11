package  
{	
	import flash.sampler.StackFrame;

	public class ActionRegion 
	{
		private var name:String;
		private var timeBeforeNext:Number;
		private var modifier:Number
		
		public function ActionRegion(name:String, timeBeforeNext:Number, modifer:Number) 
		{
			this.name = name;
			this.timeBeforeNext = timeBeforeNext;
			this.modifier = modifer;
		}
		
		public function getName():String
		{
			return name;
		}
		
		public function getTimeBeforeNext():Number
		{
			return timeBeforeNext;
		}
		
		public function getModifier():Number
		{
			return modifier;
		}

	}
	
}
