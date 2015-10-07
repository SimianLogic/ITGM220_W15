

class MatchScreen extends GameScreen
{
  
  int score = 0;
  
  MatchScreen()
  {
    super();
    
    Sprite background = new Sprite("web_images/background.png", 320, 480);
    spriteList.add(background);
    
    Sprite score_thingy = new Sprite("web_images/score_window.png", 210,75);
    spriteList.add(score_thingy);    
    
    //a button made up of 1 image drawn at different sizes (3 different sprites)
    Rectangle close_normal = new Sprite("my_images/close_button.png", 580, 60);
    Rectangle close_big = new Sprite("my_images/close_button.png", 580, 60, 75, 75);
    Rectangle close_small = new Sprite("my_images/close_button.png", 580, 60, 65, 65);
    Button scaleButton = new Button("scale_button", close_normal, close_big, close_small);
    //buttonList is a property inherited from GameScreen
    buttonList.add(scaleButton);
    
  }
  
  void draw()
  {
    //if we dont' call this, none of our buttonList or spriteList will draw...
    super.draw();
    
    textSize(40);
    textAlign(CENTER);
    
    //black text
    fill(0);
    text("" + score, 170, 100);
  }
  
  
  
}