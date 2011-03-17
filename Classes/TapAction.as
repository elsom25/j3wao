package  
{
	public class TapAction extends Action
	{
		public function TapAction(initX:Number, initY:Number, approachTime:Number, bufferTime:Number, associatedDamage:Number) 
		{
			super(approachTime, bufferTime, associatedDamage);
			x = initX;
			y = initY;
		}
	}
	
}
