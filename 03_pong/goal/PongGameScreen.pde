class PongGameScreen
{
  PImage background;
  
  Rectangle boardRect;
  Rectangle ballRect;  //wait, isn't a ball round?
  
  float ballSize = 25;
  float ballSpeedX = 2.5;
  float ballSpeedY = 2.5;
  
  PongGameScreen()
  {
    background = loadImage("pong_gameplay.png");
    
    boardRect = new Rectangle(400,300,600,400);
    
    ballRect = new Rectangle(400,300,ballSize,ballSize);
    ballRect.fillColor = new Color(255,255,255);
    
  }
  
  void draw()
  {
    image(background, 0, 0);
    
    ballRect.draw();
    ballRect.x += ballSpeedX;
    ballRect.y += ballSpeedY;
    
    println(ballRect.x + "," + ballRect.y);
    
    //if we hit any of the side walls, flip our X Velocity
    if(ballRect.right() > boardRect.right())
    {
      println("HIT RIGHT " + boardRect.right());
      ballSpeedX = ballSpeedX * -1;
    }
    
    if(ballRect.left() < boardRect.left())
    {
      println("HIT LEFT");      
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
    
  }
  
  void mousePressed()
  {
  }
  
  void mouseReleased()
  {
  }
}