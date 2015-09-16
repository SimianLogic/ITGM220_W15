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
//DONE: populate the array with random "match game" data
//DONE: create an array of Colors and draw the board so we can see the "goal"
//DONE: refactor int[][] into Tile(value) with new Tile -> value, isFaceUp, isFinal
//DONE: draw face down tiles and add logic for detecting which tile has been clicked
//DONE: add isFinal state to Tile

//HW BONUS: add a 2nd button to the menu that toggles the difficulty from easy to hard
//HW BONUS: add dynamic text ot the home screen that shows the current difficulty

Button startButton = new Button();
PImage background;

final int MENU_STATE = 1;
final int GAME_STATE = 2;

int currentState = MENU_STATE;

//HW: replace these colors with images for the cardback and an image for each tile
Color tileBack = new Color(255,255,255);
Color[] tileColors = {
  new Color(255, 0, 0),
  new Color(0, 255, 0),
  new Color(0, 0, 255),
  new Color(255, 255, 0),
  new Color(255, 0, 255),
  new Color(0, 255, 255),
  new Color(128, 0, 0),
  new Color(0, 128, 0),
  new Color(0, 0, 128)
};

Tile[][] gameData;
int rows = 4;
int columns = 4;
int tileWidth = 100;
int tileHeight = 100;

final int MATCH_COOLDOWN = 30;
int matchCooldown = 30;

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
    drawGameplay();
  }
  
}

void drawGameplay()
{
  if(matchCooldown > 0)
  {
    matchCooldown -= 1;
    println(matchCooldown);
    //when we hit 0 (and only once), reset all tiles
    if(matchCooldown == 0)
    {
      for(int i = 0; i < columns; i++)
      {
        for(int j = 0; j < rows; j++)
        {
          if(!gameData[i][j].isFinal)
          {
            gameData[i][j].isFaceUp = false;
          }
        }
      }
      
    }
  }
  
  int start_x = 400 - (tileWidth*rows)/2;
  int start_y = 300 - (tileHeight*columns)/2;
  
  fill(255,255,255);
  rect(0,0,800,600);
  
  for(int i = 0; i < gameData.length; i++)
  {
    for(int j = 0; j < gameData[0].length; j++)
    {
      Tile which_tile = gameData[i][j];
      if(which_tile.isFaceUp)
      {
        tileColors[which_tile.value].apply();
      }else{
        tileBack.apply();
      }
      
      rect(start_x + i*tileWidth, start_y + j*tileHeight, tileWidth, tileHeight);
    }
  }
}

void mouseClicked()
{
  
  if(currentState == GAME_STATE)
  {
    int start_x = 400 - (tileWidth*rows)/2;
    int start_y = 300 - (tileHeight*columns)/2;
    
    int x = floor((mouseX - start_x)/tileWidth);
    int y = floor((mouseY - start_y)/tileHeight);
    
    println("CLICKED ON " + x + "," + y);
    if(x >= 0 && x < columns && y >= 0 && y < rows)
    {
      gameData[x][y].flip();
    }else{
      println("OUT");
    }
    
    checkForMatches();
  }
}

//HW: Check to see if all the matches have been found
//If the game is over, render a GameOver button that returns us to the main screen
void checkForMatches()
{
  Tile selected = null;
  for(int i = 0; i < columns; i++)
  {
    for(int j = 0; j < rows; j++)
    {
      if(gameData[i][j].isFaceUp && !gameData[i][j].isFinal)
      {
        if(selected == null)
        {
          selected = gameData[i][j];
        }else{
          if(selected.value == gameData[i][j].value)
          {
            println("ITS A MATCH");
            selected.isFinal = true;
            gameData[i][j].isFinal = true;
          }else{
            println("NO MATCH");
            matchCooldown = MATCH_COOLDOWN;
          }
        }
      }
    }
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
  IntList pool = new IntList();
  for(int i = 1; i <= rows*columns/2; i ++)
  {
    pool.append(i);
    pool.append(i);
  }
  
  //should now have a list that looks like [1,1,2,2,3,3, etc] 
  println(pool);
  pool.shuffle();
  println(pool);
  
  //now let's declare our grid
  gameData = new Tile[rows][columns];
  
  int pool_index = 0; //we could use row*width + column to compute this, but easier to just keep a running tally
  for(int i = 0; i < rows; i++)
  {
    for(int j = 0; j < columns; j++)
    {
      gameData[i][j] = new Tile(pool.get(pool_index));
      
      pool_index++;
    }
    
  }
}