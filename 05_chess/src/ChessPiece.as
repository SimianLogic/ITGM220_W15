package
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.net.URLRequest;
	
	public class ChessPiece extends Sprite
	{
		public var position:Point;
		
		
		public var loader:Loader;
		public function ChessPiece(piece_color:String, piece_name:String)
		{
			super();
			
			loader = new Loader();
			loader.load(new URLRequest("pieces/" + piece_color + "_" + piece_name + ".png"));
			addChild(loader);
			
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoaded);
		}
		
		public function onLoaded(event:Event):void
		{
			//center our sprite!
			loader.x = -loader.width/2;
			loader.y = -loader.height/2;
		}
	}
}