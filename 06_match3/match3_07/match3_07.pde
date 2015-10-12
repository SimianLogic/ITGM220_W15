
GameScreen menuScreen;
MatchScreen matchScreen;

GameScreen currentScreen; //a placeholder for our currently active screen

int highScore;

void setup()
{
  size(640,960);
  frameRate(30);
  
  //MenuScreen is a generic GameScreen, so we assign properties to it
  menuScreen = new GameScreen();
  
  Sprite background = new Sprite("web_images/background.png",320,480);
  menuScreen.spriteList.add(background);
  
  Sprite logo = new Sprite("my_images/logo.png", 320, 300);
  menuScreen.spriteList.add(logo);
  
  Sprite start_up = new Sprite("my_images/start_up.png",320,520);
  Sprite start_over = new Sprite("my_images/start_over.png",320,520);
  Sprite start_down = new Sprite("my_images/start_down.png",320,520);
  
  Button start_button = new Button("menu_start_game", 
    start_up, 
    start_over, 
    start_down
  );
  menuScreen.buttonList.add(start_button);
  
  matchScreen = new MatchScreen();
  
  //finally set our start
  currentScreen = menuScreen;
}

void draw()
{
  currentScreen.draw();
  
  
  highScore = max(matchScreen.gameScore, highScore);
  if(currentScreen == menuScreen)
  {
    textSize(40);
    textAlign(CENTER);
    
    //black text
    fill(255);
    text("HIGH SCORE:" + highScore, 320, 625);
  }
    
    
}

void keyPressed()
{
  currentScreen.keyPressed();
}

void keyReleased()
{
  currentScreen.keyReleased();
}

void mouseClicked()
{
  currentScreen.mouseClicked();
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
    if(maybe_button.name == "menu_start_game")
    {
      matchScreen = new MatchScreen();
      currentScreen = matchScreen;
    }else if(maybe_button.name == "scale_button"){
      currentScreen = menuScreen;
    }else{
      println("TODO: IMPLEMENT " + maybe_button.name);
    }
  }
}