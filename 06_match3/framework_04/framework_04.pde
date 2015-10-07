//This sketch demonstrates how to use our GameScreen class

//A GameScreen provides a background image and 2 ArrayLists for buttons and sprites. 
// It's important to know how rectangles work, but you won't use them as much in game 
// code, so it didn't make sense to "automate" them.

//There are 2 GameScreens in this sketch -- one is a "generic" game screen and one
//  is a custom subclass. Both approaches are valid! If you're just showing images/buttons,
//  the "generic" route is easier. If you're doing custom game logic, the custom route
//  is easier/cleaner.

//The "content" of each of these screens is a mish-mash of the prior 3 examples.

/************ DECLARE YOUR VARIABLES AT THE TOP OF THE FILE, BEFORE SETUP *******************/

GameScreen myGenericScreen;
CustomGameScreen myCustomScreen;

//our currently active screen
GameScreen currentScreen;




void setup()
{
  size(800,600);
  
  /************ ANY OBJECTS THAT YOU DECLARED SHOULD BE INSTANTIATED IN YOUR SETUP FUNCTION *******************/
  
  
  /************ GAMESCREEN EXAMPLES *******************/
  
  //instantiate our generic screen
  myGenericScreen = new GameScreen();
   
  //we declared this variable above, so it will be accessible from any class
  Sprite start_up = new Sprite("my_images/start_up.png", 400, 300);
  Sprite start_over = new Sprite("my_images/start_over.png", 400, 300);
  Sprite start_down = new Sprite("my_images/start_down.png", 400, 300);
  Button start_button = new Button("start_button", start_up, start_over, start_down);
  
  //here we access the buttonList property of our screen and add our startButton
  myGenericScreen.buttonList.add(start_button);
  
  //this code uses a for-loop to create 10 sprites at once
  for(int i = 0; i < 10; i ++)
  {
    Sprite loop_sprite = new Sprite("web_images/jewel" + (i+1) + ".png", 40+i*80,550, 75, 75);
    myGenericScreen.spriteList.add(loop_sprite);
  }
  
  
  //instantiate our custom screen
  myCustomScreen = new CustomGameScreen();
  
  
  //set the active screen
  currentScreen = myGenericScreen;
}


void draw()
{
  //clear the background to a light gray color
  background(175);
  
  currentScreen.draw();
}

void mousePressed()
{
  currentScreen.mousePressed();
}


void mouseReleased()
{
  Button maybe_button = currentScreen.mouseReleased();
  if(maybe_button != null)
  {
    if(maybe_button.name == "start_button")
    {
      currentScreen = myCustomScreen;
    }else if(maybe_button.name == "mixed_button"){
      currentScreen = myGenericScreen;
    }else{
      println("BUTTON " + maybe_button.name + " DOESN'T DO ANYTHING YET");
    }
  }
}