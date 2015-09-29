class Rectangle
{
  float x;
  float y;
  float width;
  float height;
  color fill;
  
  //"empty" constructor -- we assume you'll assign our values after this
  Rectangle()
  {
  }
  
  //"full" constructor -- assigns all the values we need to use the Rectangle
  Rectangle(float x, float y, float width, float height, color fill)
  {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    this.fill = fill;
  }
  
  void draw()
  {
    fill(fill);
    rect(x-width/2, y-height/2, width, height);
  }
  
  Boolean containsPoint(float test_x, float test_y)
  {
    if(test_x > x-width/2 && test_x < x+width/2 && test_y > y-height/2 && test_y < y+height/2)
    {
      return true;
    }
    
    return false;
  }
  
  Boolean intersects(Rectangle test)
  {
    //see if my left edge is more than test's right edge
    if(x-width/2 > test.x + test.width/2) return false;
    
    //see if my right edge is less than test's left edge
    if(x+width/2 < test.x-test.width/2) return false;
    
    //see if my top edge is below test's bottome dge
    if(y-height/2 > test.y+test.height/2) return false;
    
    //see if my bottom edge is above test's top edge
    if(y+height/2 < test.y-test.height/2) return false;
    
    //otherwise return true
    return true;
  }
  
}