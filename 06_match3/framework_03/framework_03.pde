//This sketch demonstrates how to use our Button class

//A Button is a class made of 4 things: a string (used to identify the button) and 3
//  Rectangles for up/down/over states. Because a Sprite is ALSO a Rectangle, you 
//  can pass in 3 rectangles or 3 sprites or any combination of the two!
//
//With each button, you MUST call draw, mousePressed, and mouseReleased


/************ DECLARE YOUR VARIABLES AT THE TOP OF THE FILE, BEFORE SETUP *******************/

//an ArrayList of all of our Buttons, which will help us automate the event calls
ArrayList<Button> buttonExamples;
//an extra Sprite to demonstrate how to wire up a sprite outside of the ArrayList
Button extraButton;
//another extra to demonstrate mix & match
Button mixedButton;
//another extra to demonstrate that the rects don't need to be the same
Button scaleButton;
//another extra to demonstrate that the rects don't need to be the same
Button translateButton;

void setup()
{
  size(800,600);
  
  /************ ANY OBJECTS THAT YOU DECLARED SHOULD BE INSTANTIATED IN YOUR SETUP FUNCTION *******************/
  
  
  /************ BUTTON EXAMPLES *******************/
  
  //instantiate our container for our buttons
  buttonExamples = new ArrayList<Button>();
  
  
  //we declared this variable above, so it will be accessible from any class
  Sprite start_up = new Sprite("my_images/start_up.png", 400, 300);
  Sprite start_over = new Sprite("my_images/start_over.png", 400, 300);
  Sprite start_down = new Sprite("my_images/start_down.png", 400, 300);
  extraButton = new Button("extra_button", start_up, start_over, start_down);
  
  for(int i = 0; i < 10; i ++)
  {
    //we're drawing 10 of them, so let's use an x-value of 40 + i*80 (which will center them)
    //the sprites are 100x100, so we can't fit all 10 without overlap... so let's make them 75x75
    
    //we pass in the SAME rectangle for all 3 states, so we'll get mouse events but no visual
    //differentiation... this is useful for adding debug buttons but not production buttons
    Rectangle loop_rect = new Rectangle(40 + i*80, 600 - (i+1)*10/2, (i+1)*10, (i+1)*10, floor((i+1)*25.5)); 
    Button loop_button = new Button("loop_" + (i+1), loop_rect, loop_rect, loop_rect);
    buttonExamples.add(loop_button);
  }
  
  
  //a button made up of 1 image and 2 rectangles
  Sprite close_up = new Sprite("my_images/close_button.png", 800-36, 36);
  Rectangle close_over = new Rectangle(800-36, 36, 71, 71, color(255,0,0));
  Rectangle close_down = new Rectangle(800-36, 36, 71, 71, color(155,0,0));
  mixedButton = new Button("mixed_button", close_up, close_over, close_down);
  //"automate" this by grouping it with our other buttons
  buttonExamples.add(mixedButton);
  
  //a button made up of 1 image drawn at different sizes (3 different sprites)
  Rectangle close_normal = new Sprite("my_images/close_button.png", 40, 40);
  Rectangle close_big = new Sprite("my_images/close_button.png", 40, 40, 80, 80);
  Rectangle close_small = new Sprite("my_images/close_button.png", 40, 40, 60, 60);
  scaleButton = new Button("scale_button", close_normal, close_big, close_small);
  //"automate" this by grouping it with our other buttons
  buttonExamples.add(scaleButton);
  
  //a button made up of 1 image drawn in different places (3 different sprites)
  //another extra to demonstrate that the rects don't need to be the same
  Rectangle close_y_mid = new Sprite("my_images/close_button.png", 400, 40);
  Rectangle close_y_up = new Sprite("my_images/close_button.png", 396, 36);
  Rectangle close_y_down = new Sprite("my_images/close_button.png", 404, 44);
  translateButton = new Button("translate_button", close_y_mid, close_y_up, close_y_down);
  //"automate" this by grouping it with our other buttons
  buttonExamples.add(translateButton);
  
}


void draw()
{
  //clear the background to a light gray color
  background(175);
  
  //draw all the rectangles in rectangleExamples with a for-each loop
  for(Button local_button : buttonExamples)
  {
   local_button.draw();
  }
  
  //draw our extraRectangle (it's not in the retangleExamples array)
  extraButton.draw();

}

void mousePressed()
{
  //trigger all mousePressed button events
  for(Button local_button : buttonExamples)
  {
   local_button.mousePressed();
  }
  
  //trigger our extra by hand since it's not in the arraylist
  extraButton.mousePressed();
}


void mouseReleased()
{
  //in this loop we know a button was pressed, but not necessarily which button
  //so we use the button's NAME to do what we want
  for(Button local_button : buttonExamples)
  {
    //here we're calling a FUNCTION that returns a BOOLEAN
    //because it returns a boolean, we can put it in a conditional
    if(local_button.mouseReleased())
    {
       println("YOU PRESSED " + local_button.name); 
    }
  }
  
  
  //we know extra button was pressed and what that means
  if(extraButton.mouseReleased())
  {
    println("PRESSED EXTRA BUTTON");
  }
}