//This sketch demonstrates how to use our Sprite class

//A Sprite is a Rectangle with an image loaded from the file system. You can
//  create one by calling new Sprite("my_image.png", x_value, y_value); Unlike
//  Rectangle, you don't HAVE to pass a width & height -- by default a sprite
//  has a width and height equal to the image width/height. If you want the 
//  image to be drawn at a different size, you can either set the width/height
//  or use the longer constructor: new Sprite("my_image.png", x_value, y_value, width_value, height_value);


/************ DECLARE YOUR VARIABLES AT THE TOP OF THE FILE, BEFORE SETUP *******************/

//an ArrayList of all of our Sprites, which will help us automate the draw calls
ArrayList<Sprite> spriteExamples;
//an extra Sprite to demonstrate how to wire up a sprite outside of the ArrayList
Sprite extraSprite;
//an extra rectangle to follow the mouse and check for collisions
Sprite collisionSprite;
//an extra rectangle that doesn't draw but acts as a hidden "target" to clear the screen
//NOTE: it doesn't make sense to make this a sprite since we never draw it!
Sprite resetSprite;

void setup()
{
  size(800,600);
  
  /************ ANY OBJECTS THAT YOU DECLARED SHOULD BE INSTANTIATED IN YOUR SETUP FUNCTION *******************/
  
  
  /************ SPRITE EXAMPLES *******************/
  
  //instantiate our container for our sprites
  spriteExamples = new ArrayList<Sprite>();
  
  //we declared this variable above, so it will be accessible from any class
  extraSprite = new Sprite("my_images/logo.png", 400, 300);
  
  //these variables are declared in the setup function, so only accessible in the setup function
  //by putting them in the ArrayList, we'll be able to get to them again later (but they won't
  //have these variable names)
  Sprite local_sprite1 = new Sprite("web_images/jewel11.png", 400, 150);
  Sprite local_sprite2 = new Sprite("web_images/jewel12.png", 400, 450);
  
  spriteExamples.add(local_sprite1);
  spriteExamples.add(local_sprite2);
  
  //this code uses a for-loop to create 10 sprites at once...
  for(int i = 0; i < 10; i ++)
  {
    //we're drawing 10 of them, so let's use an x-value of 40 + i*80 (which will center them)
    //the sprites are 100x100, so we can't fit all 10 without overlap... so let's make them 75x75
    //a string + an integer results in a string, so if you name your images with repeating digits
    //  it's super-easy to use a for-loop to load them ("image1", "image2", etc)
    Sprite loop_sprite = new Sprite("web_images/jewel" + (i+1) + ".png", 40+i*80,550, 75, 75);
    spriteExamples.add(loop_sprite);
  }
  
  collisionSprite = new Sprite("my_images/start_up.png", 50, 50);
  resetSprite = new Sprite("my_images/start_up.png", 50, 50);
}


void draw()
{
  //clear the background to a light gray color
  background(175);
  
  //draw all the rectangles in rectangleExamples with a for-each loop
  for(Rectangle local_rect : spriteExamples)
  {
   local_rect.draw();
  }
  
  //draw our extraRectangle (it's not in the retangleExamples array)
  extraSprite.draw();
  
  
  ////a Rectangle is an object -- we can change its x/y values, its width/height values, and its color at runtime
  collisionSprite.x = mouseX;
  collisionSprite.y = mouseY;
  
  for(Sprite local_sprite : spriteExamples)
  {
   if(local_sprite.intersects(collisionSprite))
   {
     collisionSprite.width = local_sprite.width;
     collisionSprite.height = local_sprite.height;
     
     
     collisionSprite.image = local_sprite.image;
     //it doesn't make sense to change the fill
     //changing the image... doable but weird
     //collisionRectangle.fillColor = local_rect.fillColor;
   }
  }
  collisionSprite.draw();
  
  
  if(resetSprite.intersects(collisionSprite))
  {
    collisionSprite.width = resetSprite.width;
    collisionSprite.height = resetSprite.height;
    collisionSprite.image = resetSprite.image;
  }
}