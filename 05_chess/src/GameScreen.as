package 
{
	import flash.display.*;
	import flash.net.URLRequest;
	
	public class GameScreen extends Sprite
	{
		public var background:Loader;
		
		public function GameScreen(background_path:String)
		{
			super();
			
			var loader:Loader = new Loader();
			loader.load(new URLRequest(background_path));
			addChild(loader);
		}
	}
}