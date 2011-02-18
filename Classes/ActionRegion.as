package  
{	
	import flash.sampler.StackFrame;

	/*An ActionRegion is our representation of the timing regions of an Action. These ActionRegions surround the ideal moment to tap an action.
	  We can have regions such as "Miss", "Bad", "Good", "Excellent" on either side of the ideal action moment. The modifier variable is used define
	  how the damage of an Attack is effected by an Action that gets tapped while in this ActionRegion. For example, a "bad" would have a 
	  lower modifier than "good". timeBeforeNext is used to determine when the next ActionRegion begins.*/
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
