package
{
	import flash.display.Bitmap;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	public class MatchScreen extends Sprite
	{
		[Embed(source="web_images/background.png")] public var backgroundGraphic:Class;
		[Embed(source="web_images/score_window.png")] public var scoreWindowGraphic:Class;
		[Embed(source="my_images/close_button.png")] public var closeButtonGraphic:Class;
		
		
		public var closeButton:SimpleButton;
		public var scoreLabel:TextField;
		public function MatchScreen()
		{
			super();
			
			var bg:Bitmap = new backgroundGraphic();
			var score_box:Bitmap = new scoreWindowGraphic();
			
			addChild(bg);
			addChild(score_box);
			
			var close_up:Bitmap = new closeButtonGraphic();
			var close_over:Bitmap = new closeButtonGraphic();
			var close_down:Bitmap = new closeButtonGraphic();
			
			close_over.x -= 3;
			close_over.y -= 3;
			
			close_down.x += 3;
			close_down.y += 3;
			
			closeButton = new SimpleButton(close_up, close_over, close_down, close_up);
			addChild(closeButton);
			
			closeButton.x = bg.width - close_up.width - 10;
			closeButton.y = 10;
			
			score_box.x = 25;
			score_box.y = 20;
			
			
			var tf:TextFormat = new TextFormat(null, 64, 0x000000, false, false, false, "", "", TextFormatAlign.CENTER);
			scoreLabel = new TextField();
			scoreLabel.defaultTextFormat = tf;
			scoreLabel.height = 80;
			scoreLabel.width = 250;
			
			scoreLabel.x = 45;
			scoreLabel.y = 70;
			scoreLabel.text = "000";
			
			
			addChild(scoreLabel);
		}
	}
}