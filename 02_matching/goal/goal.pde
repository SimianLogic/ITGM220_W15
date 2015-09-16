//TODO: whiteboard a button on the board
//TODO: explain what a class means
//TODO: make a button class (and a color class)
//TODO: explain how game programming is mostly UI programming
//TODO: show how to load an image
//TODO: finish off splash screen with an image and a button

//TODO: whiteboard simple 4x4 matching game 
//TODO: explain what state means, create variables for states MENU and GAME
//TODO: create a 2D array (4x4) to hold the state of our board
//TODO: populate the array with random "match game" data
//TODO: explain what an exception is (try doing a 5x5 array)
//TODO: draw face down tiles and add logic for detecting which tile has been clicked
//TODO: create in-game state variables for FIRST,SECOND,CONTINUE

Button startButton = new Button();
PImage background;

void setup()
{
  size(800,600);
  
  background = loadImage("title_screen.png");
  
  startButton.x = 250;
  startButton.y = 250;
  startButton.width = 300;
  startButton.height = 100;
  startButton.normalColor = new Color(0,255,0);
  
  //HW: add a button to change difficulty, 
  //a variable to represent difficulty, 
  //and a text field to show the current difficulty
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
     println("DO BUTTON STUFF");
   }
}