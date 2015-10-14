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
		
		[Embed(source="web_images/field_dark.png")] public var fieldDarkGraphic:Class;
		[Embed(source="web_images/field_bright.png")] public var fieldBrightGraphic:Class;
		
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
			
			
			
			//magic numbers -- just guess & checked these
			var tile_width:Number = 115;
			var tile_height:Number = 115;
			
			//use arithmetic to center all this
			var total_width:Number = 5*tile_width;
			var start_x:Number = (640 - total_width)/2;
			
			var start_y:Number = 160;
			
			for(var i:int = 0; i < 5; i++)
			{
				for(var j:int = 0; j < 6; j++)
				{
					//same logic as our checkerboard!
					if((i + j) %2 == 0)
					{
						var dark:Bitmap = new fieldDarkGraphic();
						
						dark.x = start_x + i*tile_width;
						dark.y = start_y + j*tile_height;
						dark.width = tile_width;
						dark.height= tile_height;
						
						addChild(dark);
					}else{
						var bright:Bitmap = new fieldBrightGraphic();
						
						bright.x = start_x + i*tile_width;
						bright.y = start_y + j*tile_height;
						bright.width = tile_width;
						bright.height= tile_height;
						
						addChild(bright);
					}
				}
			}
			
			
		}
	}
}