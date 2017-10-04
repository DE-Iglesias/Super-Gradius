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
	public var balas:FlxTypedGroup<Disparo>;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.Player__png, true, 32, 16);
		animation.add("fly", [0, 1], 12, true);
		animation.play("fly");
		
		
		balas = new FlxTypedGroup<Disparo>();
		for (i in 0...3)
		{
			var bala:Disparo = new Disparo(this.x, this.y);
			balas.add(bala);
		}
		FlxG.state.add(balas);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		velocity.set(Reg.velocidadCamara, 0);
		
		checkBoundaries();
		movimiento();
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
}