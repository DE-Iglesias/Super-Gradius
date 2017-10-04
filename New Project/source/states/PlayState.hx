package states;

import entities.Player;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;



class PlayState extends FlxState
{
	private var player:Player;
	
	override public function create():Void
	{
		super.create();
		
		player = new Player(100, 100);
		add(player);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}