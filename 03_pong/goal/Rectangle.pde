class Rectangle
{
  float x;
  float y;
  float width;
  float height;
  
  Color fillColor;
  
  Rectangle(float center_x, float center_y, float width, float height)
  {
    x = center_x;
    y = center_y;
    this.width = width;
    this.height = height;
  }
  
  float top()
  {
    return y - height/2;
  }
  float bottom()
  {
    return y + height/2; 
  }
  
  float left()
  {
    return x - width/2;
  }
  
  float right()
  {
    return x + width/2;
  }
  
  void draw()
  {
    //if we've been given a color, apply it first! 
    //if not, just use the current fill
    if(fillColor != null)
    {
      fillColor.apply();
    }
    
    rect(x - width/2,y - height/2,width,height);
  }
  
  Boolean containsPoint(float test_x, float test_y)
  {
    if(test_x > left() && test_x < right() && test_y > top() && test_y < bottom())
    {
      return true;
    }else{
      return false;
    }
  }
  
  Boolean intersects(Rectangle test)
  {
    float delta_x = abs(test.x - x);
    float delta_y = abs(test.y - y);
    
    //proof by contradiction!
    if(left()  > test.right()) return false;
    if(right() < test.left()) return false;
    if(top() > test.bottom()) return false;   //seems opposite because of y-down...
    if(bottom() < test.top()) return false;   //seems opposite because of y-down...
    
    return true;
  }
  
}