﻿package 
{
	import flash.display.MovieClip;
	import flash.events.Event;

	/*The BattleController manages battles. It holds the player and enemy data, and provides a basic interface
	for launching attacks.*/
	public class BattleController extends MovieClip
	{	
		protected var target:int;
		protected var menu:BattleMenu;
		//CHANGE TO PROTECTED WHEN DONE DEBUGGING
		public var player:Player;
		public var enemy:Array;
		
		public function BattleController()
		{
			target = 0;
			player = new Player(0,0,50, 100);
			enemy = new Array();
			//NEED TO CHANGE TO ENEMY WHEN SPRITES ARE DECIDED
			enemy[0] = new Entity(0,0,100, 1000);
			enemy[1] = new Entity(0,0,50, 1000);
			//TODO: SPRITES FOR ENEMIES ABOVE
			menu = new BattleMenu();
			addChild(menu);
			menu.battleController = this;
			menu.addEventListener(BattleMenu.SHOW_EVENT, showMenu);
			menu.addEventListener(BattleMenu.HIDE_EVENT, hideMenu);
		}
		
		private function playerTurn():void
		{
			if ( player.isDead() )
			{
				trace("Player is DEAD!");
				gotoAndStop("TitleFrame");				
			}		
		}
		
		
		//CHANGE TO PRIVATE WHEN DONE DEBUG
		public function enemyTurn():void
		{
			if ( enemy[0].isDead() )
			{
				trace("Player is DEAD!");
				gotoAndStop("TitleFrame");
				
			}
			var damage = Math.round(Math.random()*10);
			player.takeDamage( damage );
			trace(damage + " damage was given to player");
			//launchFireball(Enemy[0], player);
		}

		public function launchFireball():Attack
		{
			var attack:Attack = new Fireball(90);
			if ( player.getMP() >= 2 )
			{
				var currentMP:int = player.spendMP(2);
				addChild( attack );
				enemy[target].takeDamage( attack.getDamage() );
			}
			return attack;
		}	
		public function launchIceSpear():Attack
		{
			var attack:Attack = new IceSpear(90);
			if( player.getMP() >= 30)
			{
				var currentMP:int = player.spendMP(30);
				addChild( attack );
				enemy[target].takeDamage( attack.getDamage() );
			}
			return attack;
		}
		
		public function chooseTarget(tar:int):void
		{
			target = tar;
		}
		
		public function hideMenu(ev:Event):void
		{
			menu.visible = false;
		}
		
		public function showMenu(ev:Event):void
		{
			menu.visible = true;
		}
	}
}