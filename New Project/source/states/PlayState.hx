package states;

import AssetPaths;
import entities.Enemies;
import entities.Player;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.FlxObject;



class PlayState extends FlxState
{
	private var player:Player;
	private var enemGroup:FlxTypedGroup<Enemies>;
	private var loader:FlxOgmoLoader;
	private var tilemap:FlxTilemap;
	override public function create():Void
	{
		super.create();
		
		player = new Player(100, 100);
		enemGroup = new FlxTypedGroup<Enemies>();
		loader =  new FlxOgmoLoader(AssetPaths.UnsavedLevel__oel);
		
		add(player);
		add(enemGroup);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
	}

}