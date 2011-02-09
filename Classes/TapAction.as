package  
{
	public class TapAction extends Action
	{
		public function TapAction(initX:Number, initY:Number, approachTime:Number, hitTime:Number, bufferTime:Number) 
		{
			super(approachTime, hitTime, bufferTime);
			x = initX;
			y = initY;
		}
	}
	
}
