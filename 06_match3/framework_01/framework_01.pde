//This sketch demonstrates how to use our Rectangle class

//A Rectangle contains an x/y value, a width/height, and a fill color.
//  It has helper methods for getting the left/top/right/bottom, for
//  testing to see if an x/y value are within the Rectangle, and for seeing
//  if two rectangles overlap. It serves as the building block for our 
//  Button and Sprite classes.


/************ DECLARE YOUR VARIABLES AT THE TOP OF THE FILE, BEFORE SETUP *******************/
//an ArrayList of all of our Rectangles, which will help us automate the draw calls
ArrayList<Rectangle> rectangleExamples;
//an extra Rectangle to demonstrate how to wire up a rectangle outside of the ArrayList
Rectangle extraRectangle;
//an extra rectangle to follow the mouse and check for collisions
Rectangle collisionRectangle;
//an extra rectangle that doesn't draw but acts as a hidden "target" to clear the screen
Rectangle resetRectangle;


void setup()
{
  size(800,600);
  
  /************ ANY OBJECTS THAT YOU DECLARED SHOULD BE INSTANTIATED IN YOUR SETUP FUNCTION *******************/
  
  
  /************ RECTANGLE EXAMPLES *******************/
  
  //instantiate our container for our rectangles
  rectangleExamples = new ArrayList<Rectangle>();
  
  //we declared this variable above, so it will be accessible from any class
  extraRectangle = new Rectangle(400,300,100,100,color(0,255,0));
  
  //these variables are declared in the setup function, so only accessible in the setup function
  //by putting them in the ArrayList, we'll be able to get to them again later (but they won't
  //have these variable names)
  Rectangle local_rect1 = new Rectangle(300,300,100,100,color(255,0,0));
  Rectangle local_rect2 = new Rectangle(500,300,100,100,color(0,0,255));
  
  rectangleExamples.add(local_rect1);
  rectangleExamples.add(local_rect2);
  
  //this code uses a for-loop to create 10 rectangles at once... and all with different sizes!
  for(int i = 0; i < 10; i ++)
  {
    //our total width is 800, so if we want to do 10 rectangles we space them 80 pixels
    //apart starting at x=40
    //for our width/height, we'll do (i+1)*10 ----- so: 10,20,30,40,50...
    //for our y-value, we'll do BOTTOM (600) - our height/2 (so we should be sitting on the bottom)
    //for our color we'll pass (i+1)*25.5, which is a grayscale gradient
    Rectangle loop_rect = new Rectangle(40 + i*80, 600 - (i+1)*10/2, (i+1)*10, (i+1)*10, floor((i+1)*25.5));
    rectangleExamples.add(loop_rect);
  }
  
  //these 2 rectangles have the same size/position, but one will move around and they other
  //will stay put
  collisionRectangle = new Rectangle(50,100,100,200,color(255,255,0));
  resetRectangle = new Rectangle(50,100,100,200,color(255,255,0));
}

void draw()
{
  //clear the background to a light gray color
  background(175);
  
  //draw all the rectangles in rectangleExamples with a for-each loop
  for(Rectangle local_rect : rectangleExamples)
  {
   local_rect.draw();
  }
  
  //draw our extraRectangle (it's not in the retangleExamples array)
  extraRectangle.draw();
  
  
  ////a Rectangle is an object -- we can change its x/y values, its width/height values, and its color at runtime
  collisionRectangle.x = mouseX;
  collisionRectangle.y = mouseY;
  
  for(Rectangle local_rect : rectangleExamples)
  {
   if(local_rect.intersects(collisionRectangle))
   {
     collisionRectangle.width = local_rect.width;
     collisionRectangle.height = local_rect.height;
     collisionRectangle.fillColor = local_rect.fillColor;
   }
  }
  collisionRectangle.draw();
  
  
  if(resetRectangle.intersects(collisionRectangle))
  {
    collisionRectangle.width = resetRectangle.width;
    collisionRectangle.height = resetRectangle.height;
    collisionRectangle.fillColor = resetRectangle.fillColor;
  }
}