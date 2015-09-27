//a helper class for making a UI screen
class GameScreen
{
  //we assume that every screen will have a background image
  PImage background;
  
  //we assume that every screen will have buttons
  ArrayList<Button> buttonList;
  
  //to create a GameScreen, call 
  //new GameScreen("your_image.png");
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
    
    //the code is the same as this regular for loop
    //for(int i = 0; i < buttonList.size(); i++)
    //{
    //  buttonList.get(i).draw();
    //}
  }
  
  //most of these are empty methods, but
  //we want all GameScreens to be able to handle input
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
    //return the name of the button so our Controller (or run loop)
    //can respond to this input
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