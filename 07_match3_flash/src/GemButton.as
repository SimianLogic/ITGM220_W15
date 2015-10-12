package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.SimpleButton;
	
	public class GemButton extends SimpleButton
	{
		public var gridX:int;
		public var gridY:int;
		public var value:int;
		
		
		public function GemButton(gem_art:BitmapData, grid_x:int, grid_y:int, value:int)
		{
			gridX = grid_x;
			gridY = grid_y;
			this.value = value;
			
			var up:Bitmap = new Bitmap(gem_art);
			var over:Bitmap = new Bitmap(gem_art);
			var down:Bitmap = new Bitmap(gem_art);
			
			up.x -= up.width/2;
			up.y -= up.height/2;
			over.scaleX = 1.05;
			over.scaleY = 1.05;
			over.x -= over.width/2;
			over.y -= over.height/2;
			down.scaleX = 0.95;
			down.scaleY = 0.95;
			down.x -= down.width/2;
			down.y -= down.height/2;
			
			//we use the over as the hit rect b/c it's the biggest and we don't want it to flicker
			super(up, over, down, over);
		}
	}
}