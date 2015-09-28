package
{
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	public class BoardScreen extends GameScreen
	{
		public var board:Sprite;
		public var pieces:Array = []; //array of ChessPieces
		
		public static const ROWS:int = 8;
		public static const COLUMNS:int = 8;
		
		public var tileWidth:Number;
		public var tileHeight:Number;
		
		public var startX:Number;
		public var startY:Number;
		
		public var selectedRect:Sprite;
		public var validMoves:Array = []; //array of sprites
		
		public var selectedPiece:ChessPiece = null;
		
		
		public function BoardScreen()
		{
			super("ui/chess_game.png");
			
			var exit_up:Sprite = new Sprite();
			exit_up.graphics.beginFill(0xff0000);
			exit_up.graphics.drawRect(0,0,40,40);
			
			var exit_over:Sprite = new Sprite();
			exit_over.graphics.beginFill(0xcc0000);
			exit_over.graphics.drawRect(0,0,40,40);
			
			var exit_down:Sprite = new Sprite();
			exit_down.graphics.beginFill(0x990000);
			exit_down.graphics.drawRect(0,0,40,40);
			
			var button:SimpleButton = new SimpleButton(exit_up, exit_over, exit_down, exit_up);
			addChild(button);
			
			button.x = 800 - button.width;
			button.addEventListener(MouseEvent.CLICK, handleExit);
			
			
			var board_width:Number = 500;
			var board_height:Number = 500;
			
			//how wide should our individual pieces/tiles be?
			tileWidth = board_width / ROWS;
			tileHeight = board_height / COLUMNS;
			
			selectedRect = new Sprite();
			selectedRect.graphics.beginFill(0x00e4ff);
			selectedRect.graphics.drawRect(-tileWidth/2,-tileHeight/2,tileWidth,tileHeight);
			
			startX = 400 - board_width/2;
			startY = 300 - board_height/2;
			
			board = new Sprite();
			for(var i:int = 0; i < COLUMNS; i++)
			{
				for(var j:int = 0; j < ROWS; j++)
				{
					if(i%2 == j%2)
					{
						board.graphics.beginFill(0xffffff);
					}else{
						board.graphics.beginFill(0x000000);						
					}
					
					board.graphics.drawRect(startX + i*tileWidth, startY + j*tileHeight, tileWidth, tileHeight);
				}
			}
			
			addChild(board);
			
			board.addEventListener(MouseEvent.CLICK, handleBoardClick);
			
			//because we were drawing the board with top-left coordinates, we left off tileWidth/2 and tileHeight/2
			startX += tileWidth/2;
			startY += tileHeight/2;
			
			addChild(selectedRect);
			selectedRect.visible = false;
			
			var json_path:URLRequest = new URLRequest("content/initial_layout.txt");
			var json_loader:URLLoader = new URLLoader(json_path);
			json_loader.addEventListener(Event.COMPLETE, processInitialLayout);
		}
		
		public function processInitialLayout(event:Event):void
		{
			var json:String = event.target.data;
			trace(json);
			
			//TODO: explain casting, Object class
			var data:Array = JSON.parse(json) as Array;
			
			//Flash is a lot more dynamic than Java, so JSON handling is much easier
			for(var y:int = 0; y < data.length; y++)  //working in rows instead of columns
			{
				for(var x:int = 0; x < data[y].length; x++)
				{
					var piece:String = data[y][x];
					if(piece == "empty")
					{
						//nothing to see here
					}else{
						var color_and_piece:Array = piece.split("_");
						var piece_color:String = color_and_piece[0];
						var piece_name:String = color_and_piece[1];
						
						var sprite:ChessPiece = new ChessPiece(piece_color, piece_name);
						sprite.position = new Point(x,y);
						
						sprite.x = startX + x*tileWidth;
						sprite.y = startY + y*tileWidth;
						
						addChild(sprite);
						pieces.push(sprite);
						
						sprite.addEventListener(MouseEvent.CLICK, handlePieceClick);
					}
				}
			}
		}
		
		public function handleBoardClick(event:MouseEvent):void
		{
			trace("BOARD CLICK");
		}
		
		public function handlePieceClick(event:MouseEvent):void
		{
			var clicked_piece:ChessPiece = event.target as ChessPiece; 
			
			if(clicked_piece == selectedPiece)
			{
				selectedPiece = null;
				selectedRect.visible = false;
			}else{
				trace("SELECT A PIECE");
				selectedPiece = clicked_piece; 
				selectedRect.visible = true;
			
				selectedRect.x = selectedPiece.x;
				selectedRect.y = selectedPiece.y;
			}
		}
		
		public function handleExit(event:MouseEvent):void
		{
			dispatchEvent(new Event("gameplay_exit"));
		}
	}
}