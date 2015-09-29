
Rectangle rect1;
Rectangle rect2;

Rectangle selectedRect;

void setup()
{
  size(800,600);
  
  rect1 = new Rectangle();
  rect1.x = 400;
  rect1.y = 300;
  rect1.width = 100;
  rect1.height = 100;
  rect1.fill = color(0,0,255);
  
  rect2 = new Rectangle(200,300,50,250,color(0,0,255));
}

void draw()
{
  background(190,190,190);
  
  if(selectedRect != null)
  {
    selectedRect.x = mouseX;
    selectedRect.y = mouseY;
  }
  
  if(rect1.intersects(rect2))
  {
    rect1.fill = color(255,0,0);
    rect2.fill = color(255,0,0);
  }else{
    rect1.fill = color(0,0,255);
    rect2.fill = color(0,0,255);
  }
  
  rect1.draw();
  rect2.draw();
}

void mouseClicked()
{
  //if we're not holding anything
  if(selectedRect == null)
  {
    //see if we clicked rect 1
    if(rect1.containsPoint(mouseX,mouseY))
    {
      //and pick it up
      selectedRect = rect1;
    //otherwise see if we clicked rect 2
    }else if(rect2.containsPoint(mouseX,mouseY)){
      //and pick it up
      selectedRect = rect2;
    }
  }else{
    
    if(rect1.intersects(rect2))
    {
      //they intersect, can't put it down
    }else{
      selectedRect = null;
    }
  }

}