package entities;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.group.FlxGroup.FlxTypedGroup;

/**
 * ...
 * @author 
 */
class Player extends FlxSprite 
{
	public var disparo:Disparo;
	public var timer:Float = 0;
	public var vidas:Int = 3;
	
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
		
		checkBoundaries();
		movimiento();
		disparar();
		timer += elapsed;
	}
	
	private function movimiento()
	{
		if (FlxG.keys.pressed.RIGHT)
			velocity.x += 180;
		if (FlxG.keys.pressed.LEFT)
			velocity.x -= 180;
		if (FlxG.keys.pressed.DOWN)
			velocity.y += 180;
		if (FlxG.keys.pressed.UP)
			velocity.y -= 180;
	}
	
	private function checkBoundaries()
	{
		if (this.x < 0)
			this.x = FlxG.width - FlxG.width;
		if (this.x > FlxG.width - this.width)
			this.x = FlxG.width - this.width;
		if (this.y < 0)
			this.y = FlxG.height - FlxG.height;
		if (this.y > FlxG.height - this.height)
			this.y = FlxG.height - this.height;
	}
	
	private function disparar()
	{
		if (FlxG.keys.pressed.SPACE)
		{
			if (timer >= 0.25)
			{
				timer = 0;
				var disparo = new Disparo(); 
				disparo.x = x + width;
				disparo.y = y + height / 2;
				FlxG.state.add(disparo);
			}
		}
	}
}