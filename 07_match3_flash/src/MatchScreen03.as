package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	public class MatchScreen03 extends MatchScreen
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
		
		public function MatchScreen03()
		{
			super();
			
			gemList = [];
			gemAssets = [new jewel1(), new jewel2(), new jewel3(), new jewel4(),
				new jewel5(), new jewel6(), new jewel7(), new jewel8(),
				new jewel9(), new jewel10(), new jewel11(), new jewel12()
			];
			
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
			var button:SimpleButton = new SimpleButton(up, over, down, over);
			button.addEventListener(MouseEvent.CLICK, handleGemClick);
			
			button.name = tile_x + "_" + tile_y;
			
			addChild(button);
			gemList.push(button);
			
			var start_x:Number = backgroundGrid.x + tileWidth/2;
			var start_y:Number = backgroundGrid.y + tileHeight/2;
			
			button.x = start_x + tileWidth*tile_x;
			button.y = start_y + tileHeight*tile_y;
			
		}
		
		public function handleGemClick(event:MouseEvent):void
		{
			trace(event.target.name);
		}
	}
}