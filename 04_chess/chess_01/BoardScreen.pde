class BoardScreen extends GameScreen
{
  Rectangle[][] board;
  
  //a standard chess board is 8x8
  final int ROWS = 8;
  final int COLUMNS = 8;
    
  //will be assigned in the constructor
  float tileWidth;
  float tileHeight;
  
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
    
    
    tileWidth = board_width / ROWS;
    tileHeight = board_height / ROWS;
    
    float start_x = 400 - board_width/2 + tileWidth/2;
    float start_y = 300 - board_height/2 + tileHeight/2;
    
    board = new Rectangle[COLUMNS][ROWS];
    for(int i = 0; i < COLUMNS; i++)
    {
      for(int j = 0; j < ROWS; j++)
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
    
  }
  
  
  void draw()
  {
    super.draw();
    
    for(int i = 0; i < COLUMNS; i++)
    {
      for(int j = 0; j < ROWS; j++)
      {
        board[i][j].draw();
      }
    }
  }
  
  void mouseClicked()
  {
    for(int i = 0; i < COLUMNS; i++)
    {
      for(int j = 0; j < ROWS; j++)
      {
        if(board[i][j].containsPoint(mouseX,mouseY))
        {
          println("CLICKED " + i + "," + j);
        }
      }
    }
  }
  
  
}