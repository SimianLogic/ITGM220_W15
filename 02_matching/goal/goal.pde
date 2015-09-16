//DONE: whiteboard a button on the board
//DONE: explain what a class means
//DONE: make a button class (and a color class)
//DONE: explain how game programming is mostly UI programming
//DONE: show how to load an image
//DONE: finish off splash screen with an image and a button 
//DONE: explain what state means, create variables for states MENU and GAME
//DONE: explain the final keyword
//DONE: modify mouse/drawing code apply to only one state
//DONE: make it so pressing the start button transitions us to the gameplay state

//DONE: whiteboard simple 4x4 matching game
//DONE: create a 2D array (4x4) to hold the state of our board
//TODO: populate the array with random "match game" data
//TODO: explain what an exception is (try doing a 5x5 array)
//TODO: draw face down tiles and add logic for detecting which tile has been clicked
//TODO: create in-game state variables for FIRST,SECOND,CONTINUE

Button startButton = new Button();
PImage background;

final int MENU_STATE = 1;
final int GAME_STATE = 2;

int currentState = MENU_STATE;

int[][] gameData;

void setup()
{
  size(800,600);
  
  background = loadImage("title_screen.png");
  
  startButton.x = 250;
  startButton.y = 250;
  startButton.width = 300;
  startButton.height = 100;
  startButton.normalFill = new Color(0,255,0);
  startButton.overFill = new Color(0,200, 0);
  startButton.downFill = new Color(0,100, 0);
  
  //HW: add a button to change difficulty, 
  //a variable to represent difficulty, 
  //and a text field to show the current difficulty
}

void draw()
{
  if(currentState == MENU_STATE)
  {
    image(background, 0, 0);
    startButton.draw();
  }else{
    fill(255,255,255);
    rect(0,0,800,600);
  }
  
}

void mousePressed()
{
  if(currentState == MENU_STATE)
  {
    startButton.mousePressed();
  }else{
    //do gameplay mouse stuff
  }
}

void mouseReleased()
{
  if(currentState == MENU_STATE)
  {
     if(startButton.mouseReleased())
     {
       println("DO BUTTON STUFF");
       setupGame();
       currentState = GAME_STATE;
     }
  }else{
    //do gameplay mouse stuff
  }
}

void setupGame()
{
  int width = 4;
  int height = 4;
  
  IntList pool = new IntList();
  for(int i = 1; i <= width*height/2; i ++)
  {
    pool.append(i);
    pool.append(i);
  }
  
  //should now have a list that looks like [1,1,2,2,3,3, etc] 
  println(pool);
  pool.shuffle();
  println(pool);
  
  //now let's declare our grid
  gameData = new int[width][height];
  
  int pool_index = 0; //we could use row*width + column to compute this, but easier to just keep a running tally
  for(int i = 0; i < width; i++)
  {
    for(int j = 0; j < height; j++)
    {
      gameData[i][j] = pool.get(pool_index);
      pool_index++;
    }
    println(gameData[i]);
  }
}