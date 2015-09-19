class BoardScreen extends GameScreen
{
  Rectangle[][] board;
  
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
    int rows = 8;
    int columns = 8;
    
    float tile_width = board_width / rows;
    float tile_height = board_height / rows;
    
    float start_x = 400 - board_width/2 + tile_width/2;
    float start_y = 300 - board_height/2 + tile_height/2;
    
    board = new Rectangle[columns][rows];
    for(int i = 0; i < columns; i++)
    {
      for(int j = 0; j < rows; j++)
      {
        Rectangle tile;
        if(i%2 == j%2)
        {
          board[i][j] = new Rectangle(start_x + i*tile_width,start_y + j*tile_height,tile_width, tile_height, color(255,255,255));
        }else{
          board[i][j] = new Rectangle(start_x + i*tile_width,start_y + j*tile_height,tile_width, tile_height, color(0,0,0));
        }
        
      }
    }
    
  }
  
  
  void draw()
  {
    super.draw();
    
    for(int i = 0; i < board[0].length; i++)
    {
      for(int j = 0; j < board[0].length; j++)
      {
        board[i][j].draw();
      }
    }
  }
  
  
}