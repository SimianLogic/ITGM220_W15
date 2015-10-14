package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	[SWF(width="640",height="960", backgroundColor="#999999", frameRate="30")]
	public class Match3Flash05 extends Sprite
	{
		
		public var startScreen:StartScreen;
		public var matchScreen:MatchScreen;
		
		public function Match3Flash05()
		{
			addEventListener(Event.ENTER_FRAME, draw);
			
			
			//DO YOUR SETUP CODE HERE
			
			startScreen = new StartScreen();
			addChild(startScreen);
			
			startScreen.startButton.addEventListener(MouseEvent.CLICK, handleStartButton)
		}
		
		public function handleStartButton(event:MouseEvent):void
		{
			removeChild(startScreen);
			
			matchScreen = new MatchScreen();
			matchScreen.closeButton.addEventListener(MouseEvent.CLICK, handleExitButton);
			
			addChild(matchScreen);
		}
		
		public function handleExitButton(event:MouseEvent):void
		{
			removeChild(matchScreen);
			addChild(startScreen);
		}
		
		public function draw(event:Event):void
		{
			//DO YOUR DRAWING CODE HERE
			
			if(matchScreen != null)
			{
				startScreen.highScore = Math.max(startScreen.highScore, matchScreen.score);
				startScreen.highScoreLabel.text = "" + startScreen.highScore;
			}
		}
	}
}