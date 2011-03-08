package {
	
	//An Player: the maintenance of its HP and attacks
	//Inherit from this class if you want to make specialized enemies with special attacks
	
	public class Player extends Entity {	
		
		//Initialize an player
		public function Player(positionX:int, positionY:int, HP:int, MP:int) {
			super(positionX, positionY, HP, MP);
		}
		
		
		
	}
}