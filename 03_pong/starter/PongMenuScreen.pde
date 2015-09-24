class PongMenuScreen
{
  PImage background;
  Button startButton;
  
  Boolean didPressStart = false;
  
  PongMenuScreen(String image_name)
  {
    background = loadImage(image_name);
    
    startButton = new Button(
      new Rectangle(400,300,300,100, color(255,255,255)),
      color(0,255,0),
      color(0,200,0),
      color(0,100,0)
    );
  }
  
  void draw()
  {
    image(background,0,0);
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
      didPressStart = true;
    }
  }
}