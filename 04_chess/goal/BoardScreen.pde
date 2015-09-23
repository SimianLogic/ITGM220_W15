class BoardScreen extends GameScreen
{
  Rectangle[][] board;
  ArrayList<ChessPiece> pieces;
  
  int rows = 8;
  int columns = 8;
    
  //will be assigned in the constructor
  float tileWidth;
  float tileHeight;
  
  Rectangle selectedRect;
  ArrayList<Rectangle> validMoves;
  
  BoardScreen()
  {
    super("chess_game.png");
    
    Rectangle back_rect = new Rectangle(780,20,40,40, color(255,0,0));
    
    Button back_button = new Button("board_exit_game",
      back_rect,
      back_rect.copyWithColor(color(200,0,0)),
      back_rect.copyWithColor(color(200,0,0))
    );
    
    //this is an inherited property. it is declared in our superclass
    buttonList.add(back_button);
    
    float board_width = 500;
    float board_height = 500;
    
    tileWidth = board_width / rows;
    tileHeight = board_height / rows;
    
    selectedRect = new Rectangle(0,0,tileWidth,tileHeight,color(0,228,255));
    
    float start_x = 400 - board_width/2 + tileWidth/2;
    float start_y = 300 - board_height/2 + tileHeight/2;
    
    board = new Rectangle[columns][rows];
    for(int i = 0; i < columns; i++)
    {
      for(int j = 0; j < rows; j++)
      {
        Rectangle tile;
        if(i%2 == j%2)
        {
          board[i][j] = new Rectangle(start_x + i*tileWidth,start_y + j*tileHeight,tileWidth, tileHeight, color(255,255,255));
        }else{
          board[i][j] = new Rectangle(start_x + i*tileWidth,start_y + j*tileHeight,tileWidth, tileHeight, color(0,0,0));
        }
        
      }
    }
    
    
    
    pieces = new ArrayList<ChessPiece>();
    JSONArray layout_data = loadJSONArray("initial_layout.txt");
    for (int i = 0; i < layout_data.size(); i++) 
    {
      //we know this is an array
      JSONArray row = layout_data.getJSONArray(i);
      for(int j = 0; j < row.size(); j++)
      {
        String piece = row.getString(j);
        println(piece);
        if(piece.equals("empty"))
        {
          //nothing to see here
        }else{
          ChessPiece sprite = new ChessPiece("pieces/" + piece + ".png", start_x + j*tileWidth, start_y+i*tileHeight, tileWidth, tileHeight);
          
          sprite.gridX = j;
          sprite.gridY = i;
          
          pieces.add(sprite);
        }
        
      }
    }
    
    
  }
  
  
  void draw()
  {
    super.draw();
    
    for(int i = 0; i < columns; i++)
    {
      for(int j = 0; j < rows; j++)
      {
        board[i][j].draw();
      }
    }
    
    for(ChessPiece piece : pieces) 
    {
      if(piece.isSelected)
      {
        selectedRect.x = piece.x;
        selectedRect.y = piece.y;
        selectedRect.draw();
      }
      
      piece.draw();
    }
    
  }
  
  void mouseClicked()
  {
    for(int i = 0; i < columns; i++)
    {
      for(int j = 0; j < rows; j++)
      {
        if(board[i][j].containsPoint(mouseX,mouseY))
        {
          println("CLICKED " + i + "," + j);
          
          for(ChessPiece piece : pieces) 
          {
            if(piece.isSelected)
            {
              piece.isSelected = false;
            }
            
            if(piece.gridX == i && piece.gridY == j)
            {
              piece.isSelected = true;
            }
          }
    
    
        }
      }
    }
  }
  
  
}