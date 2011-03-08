package {
	
	//An Enemy is the enemy sprite, and the maintenance of its HP and attacks
	//Inherit from this class if you want to make specialized enemies with special attacks
	
	public class Enemy extends Entity {	
		
		//Initialize an enemy
		public function Enemy(positionX:int, positionY:int, spriteSetToLoad:Array, HP:int, MP:int) {
			super(positionX, positionY, HP, MP);
			super.setSpriteArray(spriteSetToLoad);
			x = positionX;
			y = positionY;
			spriteSet = spriteSetToLoad;
			maxHP = HP;
			curHP = HP;
		}
		
		
		
	}
}