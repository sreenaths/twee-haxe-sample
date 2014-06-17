/**
 * Twee
 * @author Sreenath Somarajapuram
 */

package;

import flash.display.Sprite;
import flash.events.Event;
import tiger.twee.easing.Quadratic;
import tiger.twee.interfaces.ITwee;
import tiger.twee.Twee;


class Main extends Sprite {
	
	private var _hideVars:Dynamic = { alpha:0 };
	
	public function new () {
		super ();		
		generateObjects();
	}

	private function generateObjects():Void {
		for (i in 0...100) {
			var creationDelay = Math.random () * 10;
			Twee.delayedCall( creationDelay, createCircle );
		}
	}
	
	private function drawObject():Sprite {
		var size = Math.random () * 40 + 20;
		var circle = new Sprite ();
		
		circle.graphics.beginFill (Std.int (Math.random () * 0xFFFFFF));
		circle.graphics.drawCircle (0, 0, size);
		
		return circle;
	}
	
	private function spawnObject (circle:Sprite):Void {
		var duration = Math.random () * 4 + 2;
		var targetX = Math.random () * stage.stageWidth;
		var targetY = Math.random () * stage.stageHeight;
		var targetScale = Math.random ()*.7 + .3;

		circle.alpha = 0.2 + Math.random () * 0.6;
		circle.x = stage.stageWidth/2;
		circle.y = stage.stageHeight/2;
		circle.scaleX = circle.scaleY = 0;

		var twee:ITwee = Twee.to( circle, duration, { x: targetX, y: targetY, scaleX:targetScale, scaleY:targetScale } );
		twee.tail( Twee.to( circle, duration * .3, _hideVars, { inactive:true, onComplete:spawnObject, onCompleteParams:[ circle ] }));
	}
	
	private function createCircle ():Void {
		var circle = drawObject();
		
		addChildAt (circle, 0);
		spawnObject (circle);
	}
	
}
