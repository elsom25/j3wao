package  
{
	public class TapAction extends Action
	{
		public function TapAction(initX:Number, initY:Number, millisecondsUntilCompletion:Number) 
		{
			super(millisecondsUntilCompletion);
			x = initX;
			y = initY;
		}
	}
	
}
