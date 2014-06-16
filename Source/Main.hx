package;

import flash.display.Sprite;
import flash.events.Event;
import tiger.twee.easing.Quadratic;
import tiger.twee.Twee;


class Main extends Sprite {
	
	public function new () {
		super ();		
		construct ();
	}
	
	private function animateCircle (circle:Sprite):Void {
		var duration = 1.5 + Math.random () * 4.5;
		var targetX = Math.random () * stage.stageWidth;
		var targetY = Math.random () * stage.stageHeight;

		Twee.to(circle, duration, { x: targetX, y: targetY }, { ease:Quadratic.easeOut, onComplete:animateCircle, onCompleteParams:[ circle ] });
	}
	
	private function construct ():Void {
		
		for (i in 0...80) {
			var creationDelay = Math.random () * 10;
			Twee.delayedCall( creationDelay, createCircle );
		}
		
	}
	
	private function createCircle ():Void {
		
		var size = 5 + Math.random () * 35 + 20;
		var circle = new Sprite ();
		
		circle.graphics.beginFill (Std.int (Math.random () * 0xFFFFFF));
		circle.graphics.drawCircle (0, 0, size);
		circle.alpha = 0.2 + Math.random () * 0.6;
		circle.x = Math.random () * stage.stageWidth;
		circle.y = Math.random () * stage.stageHeight;
		
		addChildAt (circle, 0);
		animateCircle (circle);
		
	}
	
}