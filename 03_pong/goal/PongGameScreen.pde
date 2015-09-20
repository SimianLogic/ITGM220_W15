class PongGameScreen
{
  PImage background;
  
  Rectangle boardRect;
  Rectangle ballRect;  //wait, isn't a ball round?
  
  float ballSize = 25;
  float ballSpeedX = 2.5;
  float ballSpeedY = 2.5;
  
  Rectangle player1;
  Rectangle player2;
  
  float p1Velocity = 0;
  float p2Velocity = 0;
  
  int p1Score;
  int p2Score;
  
  PongGameScreen()
  {
    background = loadImage("pong_gameplay.png");
    
    boardRect = new Rectangle(400,300,600,400, 0);
    
    ballRect = new Rectangle(400,300,ballSize,ballSize, color(255,255,255));
    
    player1 = new Rectangle(120, 300, 15, 80, color(255,255,255));
    player2 = new Rectangle(680, 300, 15, 80, color(255,255,255));
    
  }
  
  void draw()
  {
    image(background, 0, 0);
    
    player1.draw();
    player2.draw();
    
    player1.y = constrain(player1.y + p1Velocity, boardRect.top(), boardRect.bottom());
    player2.y = constrain(player2.y + p2Velocity, boardRect.top(), boardRect.bottom());
    
    ballRect.x += ballSpeedX;
    ballRect.y += ballSpeedY;
    ballRect.draw();
    
    //if we hit any of the side walls, flip our X Velocity
    if(ballRect.right() > boardRect.right())
    {
      println("HIT RIGHT " + boardRect.right());
      p1Score += 1;
      ballSpeedX = ballSpeedX * -1;
    }
    
    if(ballRect.left() < boardRect.left())
    {
      println("HIT LEFT");      
      p2Score += 1;
      ballSpeedX = ballSpeedX * -1;
    }
    
    //if we hit the top or bottom, flip our Y velocity
    if(ballRect.bottom() > boardRect.bottom())
    {
      println("HIT BOTTOM");
      ballSpeedY = ballSpeedY * -1;
    }
    
    if(ballRect.top() < boardRect.top())
    {
      println("HIT TOP");
      ballSpeedY = ballSpeedY * -1;
    }
   
    checkForPlayerCollision();
    drawScore();
  }
  
  void checkForPlayerCollision()
  {
    if(player1.intersects(ballRect) && ballSpeedX < 0)
    {
      ballSpeedX = ballSpeedX * -1;
    }
    
    if(player2.intersects(ballRect) && ballSpeedX > 0)
    {
      ballSpeedX = ballSpeedX * -1;
    }
  }
  
  void drawScore()
  {
    textAlign(CENTER);
    textSize(25);
    text("P1",50,275);
    text("P2",750,275);
    
    text("" + p1Score, 50, 300);
    text("" + p2Score, 750, 300); 
  }
  
  void keyPressed()
  {
    if(key == 'w')
    {
      p1Velocity = -5;
    }
    
    if(key == 's')
    {
      p1Velocity = 5;
    }
    
    if(keyCode == UP)
    {
      p2Velocity = -5;
    }
    
    if(keyCode == DOWN)
    {
      p2Velocity = 5;
    }
  }
  
  void keyReleased()
  {
    if(key == 'w')
    {
      p1Velocity = 0;
    }
    
    if(key == 's')
    {
      p1Velocity = 0;
    }
    
    if(keyCode == UP)
    {
      p2Velocity = 0;
    }
    
    if(keyCode == DOWN)
    {
      p2Velocity = 0;
    }
  }
}