package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author 
 */
class Player extends FlxSprite 
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
		loadGraphic(AssetPaths.Player__png, true, 32, 16);
		animation.add("fly", [0, 1], 12, true);
		
		animation.play("fly");
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		velocity.set(Reg.velocidadCamara, 0);
		
		if (FlxG.keys.pressed.RIGHT) 
			velocity.x += 180;
		if (FlxG.keys.pressed.LEFT) 
			velocity.x -= 180;
		if (FlxG.keys.pressed.DOWN) 
			velocity.y += 180;
		if (FlxG.keys.pressed.UP) 
			velocity.y -= 180;
	}
	
}