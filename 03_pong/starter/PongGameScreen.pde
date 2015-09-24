class PongGameScreen
{
  PImage background;
  
  Rectangle boardRect;
  Rectangle ball;
  
  Rectangle player1;
  Rectangle player2;
  
  int player1Score = 0;
  int player2Score = 0;
  
  color white = color(255,255,255);
  
  float ballVelocityX = 7.5;
  float ballVelocityY = 5.0;
  
  float player1Velocity = 0.0;
  float player2Velocity = 0.0;
  final float PLAYER_MOVE_SPEED = 10.0;
  
  PongGameScreen(String image_name)
  {
    background = loadImage(image_name);
    
    boardRect = new Rectangle(400,300,600,400, white );
    ball = new Rectangle(400,300,30,30, white);
    
    player1 = new Rectangle(boardRect.left() + 40, boardRect.y, 20, 100, white);
    player2 = new Rectangle(boardRect.right() - 40, boardRect.y, 20, 100, white);
  }
  
  void draw()
  {
    image(background,0,0);
    
    //boardRect doesn't need to be drawn, it's just there as a border
    //boardRect.draw();
    
    ball.x += ballVelocityX;
    ball.y += ballVelocityY;
    
    //bounce off the right wall
    if(ball.right() > boardRect.right())
    {
      ballVelocityX = ballVelocityX * -1;
      player1Score += 1;
    }
    
    //bounce off the left wall
    if(ball.left() < boardRect.left())
    {
      ballVelocityX = ballVelocityX * -1;
      player2Score += 1;
    }
    if(ball.top() < boardRect.top())
    {
      ballVelocityY = ballVelocityY * -1;
    }
    if(ball.bottom() > boardRect.bottom())
    {
      ballVelocityY = ballVelocityY * -1;
    }
    
    if(ball.intersects(player1) && ballVelocityX < 0)
    {
      ballVelocityX = ballVelocityX * -1;
    }
    if(ball.intersects(player2) && ballVelocityX > 0)
    {
      ballVelocityX = ballVelocityX * -1;
    }
    
    //player1.y += player1Velocity;
    player1.y = constrain(player1.y + player1Velocity, boardRect.top(), boardRect.bottom());
    player2.y = constrain(player2.y + player2Velocity, boardRect.top(), boardRect.bottom());
    
    ball.draw();
    player1.draw();
    player2.draw();
    
    drawScores();
  }
  
  void drawScores()
  {
    textSize(24);
    textAlign(CENTER); //LEFT/RIGHT/CENTER
    
    text("SCORE", boardRect.left() - 50, boardRect.y - 50);
    text("SCORE", boardRect.right() + 50, boardRect.y - 50);
    
    text(player1Score + "", boardRect.left() - 50, boardRect.y);
    text(player2Score + "", boardRect.right() + 50, boardRect.y);
    
  }
  
  
  void keyPressed()
  {
    if(key == 'w')
    {
      player1Velocity = -PLAYER_MOVE_SPEED;
    }
    if(key == 's')
    {
      player1Velocity = PLAYER_MOVE_SPEED;
    }
    if(keyCode == UP)
    {
      player2Velocity = -PLAYER_MOVE_SPEED;
    }
    if(keyCode == DOWN)
    {
      player2Velocity = PLAYER_MOVE_SPEED;
    }
  }
  
  void keyReleased()
  {
      if(key == 'w')
      {
        player1Velocity = 0;
      }
      if(key == 's')
      {
        player1Velocity = 0;
      }
      if(keyCode == UP)
      {
        player2Velocity = 0;
      }
      if(keyCode == DOWN)
      {
        player2Velocity = 0;
      }
  }


}