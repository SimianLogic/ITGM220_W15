//instead of junking up the main sketch, our CustomGameScreen
//does all of its setup within its own constructor

class CustomGameScreen extends GameScreen
{
  
  CustomGameScreen()
  {
    //it's important to call super in a subclass so that all our class variables 
    //get intialized properly
    super();
    
    //a button made up of 1 image and 2 rectangles
    Sprite close_up = new Sprite("my_images/close_button.png", 800-36, 36);
    Rectangle close_over = new Rectangle(800-36, 36, 71, 71, color(255,0,0));
    Rectangle close_down = new Rectangle(800-36, 36, 71, 71, color(155,0,0));
    Button mixedButton = new Button("mixed_button", close_up, close_over, close_down);
    //buttonList is a property inherited from GameScreen
    buttonList.add(mixedButton);
    
    //a button made up of 1 image drawn at different sizes (3 different sprites)
    Rectangle close_normal = new Sprite("my_images/close_button.png", 40, 40);
    Rectangle close_big = new Sprite("my_images/close_button.png", 40, 40, 80, 80);
    Rectangle close_small = new Sprite("my_images/close_button.png", 40, 40, 60, 60);
    Button scaleButton = new Button("scale_button", close_normal, close_big, close_small);
    //buttonList is a property inherited from GameScreen
    buttonList.add(scaleButton);
    
    //a button made up of 1 image drawn in different places (3 different sprites)
    //another extra to demonstrate that the rects don't need to be the same
    Rectangle close_y_mid = new Sprite("my_images/close_button.png", 400, 40);
    Rectangle close_y_up = new Sprite("my_images/close_button.png", 396, 36);
    Rectangle close_y_down = new Sprite("my_images/close_button.png", 404, 44);
    Button translateButton = new Button("translate_button", close_y_mid, close_y_up, close_y_down);
    //buttonList is a property inherited from GameScreen
    buttonList.add(translateButton);
  
    
    Sprite background = new Sprite("web_images/background.png",400,300,800,600);
    spriteList.add(background);
  
  }
}