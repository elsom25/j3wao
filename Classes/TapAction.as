package  
{
	public class TapAction extends Action
	{
		public function TapAction(initX:Number, initY:Number, approachTime:Number, bufferTime:Number) 
		{
			super(approachTime, bufferTime);
			x = initX;
			y = initY;
		}
	}
	
}
