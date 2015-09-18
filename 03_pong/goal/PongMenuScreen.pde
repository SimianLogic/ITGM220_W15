class PongMenuScreen
{
  PImage background;
  Button startButton;
  
  Boolean buttonPressed = false;
  
  PongMenuScreen()
  {
    background = loadImage("pong_mainmenu.png");
    
    Rectangle button_rect = new Rectangle(400,300,300,100);
    Color up_color = new Color(0,255,0);
    Color over_color = new Color(0, 200, 0);
    Color down_color = new Color(0, 100, 0);
    
    startButton = new Button(button_rect, up_color, over_color, down_color);
  }
  
  void draw()
  {
    image(background, 0, 0);    
    startButton.draw();
  }
  
  void mousePressed()
  {
    startButton.mousePressed();
  }
  
  void mouseReleased()
  {
    if(startButton.mouseReleased())
    {
      buttonPressed = true;
      println("clicked start");
    }else{
      buttonPressed = false;
      println("didn't press start");
    }
  }
}