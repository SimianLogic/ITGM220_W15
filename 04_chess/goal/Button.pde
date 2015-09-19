class Button
{
  String name;
  
  Rectangle normalRect;
  Rectangle overRect;
  Rectangle downRect;
  
  Boolean isDown = false;
  
  //when you call the empty constructor, you must declare any variables that get used before they're called
  Button()
  {
    println("BE CAREFUL USING AN EMPTY CONSTRUCTOR");
  }
  
  Button(String name, Rectangle normal, Rectangle over, Rectangle down)
  {
    this.name = name;
    
    normalRect = normal;
    overRect = over;
    downRect = down;
  }
  
  void mousePressed()
  {
    //some frameworks also allow you to specify a hitRect, but
    //we'll just assume that normalRect is hour hitRect
    if(normalRect.containsPoint(mouseX,mouseY))
    {
      isDown = true;
    }
  }
  
  Boolean mouseReleased()
  {
    if(isDown && normalRect.containsPoint(mouseX,mouseY))
    {
      isDown = false;
      return true;
    }
    
    isDown = false;
    return false;
  }
  
  void draw()
  {
    if(normalRect.containsPoint(mouseX,mouseY))
    {
      if(isDown)
      {
        downRect.draw();
      }else{
        overRect.draw();
      }
    }else{
      normalRect.draw();
    }
  }
}