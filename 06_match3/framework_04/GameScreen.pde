//GAME SCREEN is a generic class that you can use to represent a screen (like a splash screen).
//It assumes you might have some sprites, and some buttons, but doesn't do anything else!
//If you need MORE than sprites/buttons, subclass GameScreen and override the event methods
//you need for your screen (typically draw, mousePressed, mouseReleased

//To add a button to a GameScreen:
//  create an instance of your gamescreen
//    Gamescreen my_screen = new GameScreen("my_background_image.png");
//  create a button
//    Button my_button = new Button("my_button_name", my_rect_1, my_rect_2, my_rect_3);
//  add your button to your screen
//    my_screen.buttonList.add(my_button);

//To add a sprite to a GameScreen:
//  create an instance of your gamescreen
//    Gamescreen my_screen = new GameScreen("my_background_image.png");
//  create a sprite
//    Sprite my_sprite = new Sprite("my_image.png", my_x_value, my_y_value);
//  add your sprite to your screen
//    my_screen.spriteList.add(my_sprite);


import java.util.Map;


class GameScreen
{
  ArrayList<Button> buttonList;
  ArrayList<Sprite> spriteList;
  
  GameScreen()
  {
    spriteList = new ArrayList<Sprite>();    
    buttonList = new ArrayList<Button>();
    
  }
  
  void draw()
  {
    for(Sprite sprite : spriteList)
    {
      sprite.draw();
    }
    
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
  
  //instead of iterating over each button, this allows our "shell" or "controller" to
  //call mouseReleased once and get back the button that was pressed
  Button mouseReleased()
  {
    for(Button button : buttonList) 
    {
      if(button.mouseReleased())
      {
        return button;
      }
    }
    
    return null;
  } 
  
}