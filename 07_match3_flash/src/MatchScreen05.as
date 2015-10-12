package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	public class MatchScreen05 extends MatchScreen
	{
		public var COLUMNS:int = 5;
		public var ROWS:int = 6;
		
		public var boardWidth:Number;
		public var boardHeight:Number;
		
		public var tileWidth:Number;
		public var tileHeight:Number;
		
		public var padding:Number = 10;
		
		public var gemList:Array;
		public var gemAssets:Array;
		
		public var gameScore:int;
		
		public function MatchScreen05()
		{
			super();
			
			gemList = [];
			gemAssets = [new jewel1(), new jewel2(), new jewel3(), new jewel4(),
				new jewel5(), new jewel6(), new jewel7(), new jewel8(),
				new jewel9(), new jewel10(), new jewel11(), new jewel12()
			];
			
			//backgroundGrid is defined in our UI file for this screen
			boardWidth = backgroundGrid.width;
			boardHeight = backgroundGrid.height;
			
			tileWidth = boardWidth / COLUMNS;
			tileHeight = boardHeight / ROWS;
			
			for(var i:int = 0; i < COLUMNS; i++)
			{
				for(var j:int = 0; j < ROWS; j++)
				{
					addRandomGem(i, j); 
				}
			}
			
		}
		
		
		public function addRandomGem(tile_x:int, tile_y:int):void
		{
			var which:Number = Math.floor(Math.random()*12);
			var gem_art:BitmapData = gemAssets[which];
			
			var gem:GemButton = new GemButton(gem_art, tile_x, tile_y, which);
			gem.addEventListener(MouseEvent.CLICK, handleGemClick);
			
			gem.name = tile_x + "_" + tile_y;
			
			addChild(gem);
			gemList.push(gem);
			
			var start_x:Number = backgroundGrid.x + tileWidth/2;
			var start_y:Number = backgroundGrid.y + tileHeight/2;
			
			gem.x = start_x + tileWidth*tile_x;
			gem.y = start_y + tileHeight*tile_y;
			
		}
		
		public function handleGemClick(event:MouseEvent):void
		{
			//event.target is a DisplayObject, so you have to CAST it up to a GemButton
			//to get access to your custom GemButton properties
			var gem:GemButton = event.target as GemButton;
			
			removeChild(gem);
			
			var index:int = gemList.indexOf(gem);
			gemList.splice(index,1);
			
			gameScore += gem.value;
			
			//scoreText is defined in our UI file for this screen
			scoreText.text = "" + gameScore;
		}
	}
}