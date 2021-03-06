package
{
	import flash.display.Loader;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;

  //we need the events package to hook into the enterFrame event
	
	
	[SWF(width="800",height="600", backgroundColor="#999999")]
	public class FlashChess extends Sprite
	{
		
		public var menuScreen:GameScreen;
		public var boardScreen:BoardScreen;
		
		//Flash doesn't run through a central run loop by default, so 
		//we don't need a current screen to pass events. each screen
		//can hook into the events it needs with EventListeners
//		public var currentScreen:GameScreen;
		
		public function FlashChess()
		{
			super();
			
			//start this data load at startup, we need it to be loaded before we make our chess pieces!
			ChessPiece.loadMoveData();
			
			menuScreen = new GameScreen("ui/chess_menu.png");
			addChild(menuScreen);
			
			var start_up:Loader = new Loader();
			start_up.load(new URLRequest("ui/start_up.png"));
			
			var start_over:Loader = new Loader();
			start_over.load(new URLRequest("ui/start_over.png"));
			
			var start_down:Loader = new Loader();
			start_down.load(new URLRequest("ui/start_down.png"));
			
			var button:SimpleButton = new SimpleButton(start_up, start_over, start_down, start_up);
			menuScreen.addChild(button);
			button.x = 250;
			button.y = 250;
			
			button.addEventListener(MouseEvent.CLICK, handleStart);
			
		}
		
		public function handleStart(event:MouseEvent):void
		{
			if(!ChessPiece.dataIsLoaded)
			{
				trace("NO DATA YET");
				return;
			}
			//we defer initialization to until they press the button so our data has time to load
			if(boardScreen == null)
			{
				boardScreen = new BoardScreen();
				boardScreen.addEventListener("gameplay_exit", handleExit);
			}
						
			addChild(boardScreen);
			removeChild(menuScreen);
		}
		
		public function handleExit(event:Event):void
		{
			trace("EXIT");
			addChild(menuScreen);
			removeChild(boardScreen);
		}
	}
}