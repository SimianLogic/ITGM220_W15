class GameScreen
{
  PImage background;
  ArrayList<Button> buttonList;
  
  GameScreen(String background)
  {
    this.background = loadImage(background);
    buttonList = new ArrayList<Button>();
  }
  
  void draw()
  {
    image(background, 0, 0);
    
    //this is called "for each" in most languages
    //we don't need to know where we are in the ArrayList (index), just
    //that we want to do something to each item in the ArrayList
    for(Button button : buttonList) 
    {
      button.draw();
    }
  }
  
  void keyPressed()
  {
  }
  
  void keyReleased()
  {
  }
  
  void mouseClicked()
  {
  }
  
  void mousePressed()
  {
    for(Button button : buttonList) 
    {
      button.mousePressed();
    }
  }
  
  String mouseReleased()
  {
    for(Button button : buttonList) 
    {
      if(button.mouseReleased())
      {
        return button.name;
      }
    }
    
    return null;
  } 
  
}