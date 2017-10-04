package entities;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;

/**
 * ...
 * @author ...
 */
class Disparo extends FlxSprite 
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		
		makeGraphic(5, 5, FlxColor.BLUE);
		
		velocity.x = Reg.velocidadBala;
	}
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
	 
		if (this.x > FlxG.width) 
		{
			kill();
		}
	}
	override public function destroy():Void 
	{
		FlxG.state.remove(this);
		
		super.destroy();
	}
	
}