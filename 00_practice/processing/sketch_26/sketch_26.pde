
ArrayList<Rectangle> rectangles;
Rectangle selectedRect;

void setup()
{
  size(800,600);
  
  rectangles = new ArrayList<Rectangle>();
  for(int i = 0; i < 7; i++)
  {
    float width = random(50) + 25;
    float height = random(50) + 25;
    //local rectangle variable
    Rectangle rect = new Rectangle((i+1)*100,300,width,height,color(0,0,255));
    
    rectangles.add(rect);
  }
}

void draw()
{
  background(190,190,190);
  
  if(selectedRect != null)
  {
    selectedRect.x = mouseX;
    selectedRect.y = mouseY;
  }
  
  //first reset all rectangles to blue
  for(Rectangle rect : rectangles)
  {
    rect.fill = color(0,0,255);
  }
  
  //loop through TWICE. we need to test each rect against each other rect
  //to see if they intersect
  for(Rectangle test1 : rectangles)
  {
    for(Rectangle test2:rectangles)
    {
      //we can't collide with ourself
      if(test1 == test2) continue;
      
      if(test1.intersects(test2))
      {
        test1.fill = color(255,0,0);
        test2.fill = color(255,0,0);
      }
    }
  }
  
  for(Rectangle rect : rectangles)
  {
    rect.draw();
  }
}

void mouseClicked()
{
  println("mouse");
  //if we're not holding anything
  if(selectedRect == null)
  {
    for(Rectangle rect : rectangles)
    {
      if(rect.containsPoint(mouseX,mouseY))
      {
        selectedRect = rect;
      }
    }
  }else{
    
    //if our selectedRect is blue, put it down!
    if(selectedRect.fill == color(0,0,255))
    {
      selectedRect = null;
    }
    
  }

}