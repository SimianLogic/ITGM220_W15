class Rectangle
{
  //float is a decimal. when modeling things that
  //can move, it's sometimes helpeful to have 
  //velocties that aren't whole numbers (especially
  //if we're using time-based velocity)
  float x;  //center x
  float y;  //center y
  float width; //rectangle width
  float height; //rectangle height
  
  Color fillColor; //optional fillColor -- will only be used if this value is set
  
  //center coordinate is different from Processing's default
  //top-left box model, but more similar how most game engines
  //treat Sprites (which we'll use next week)
  Rectangle(float center_x, float center_y, float width, float height)
  {
    x = center_x;
    y = center_y;
    
    //our parameters width & height cover up our member variables of
    //the same name. to refer to our member variable, we use "this"
    this.width = width;
    this.height = height;
  }
  
  //the visual top of the rectangle (remember we're y-negative)
  float top()
  {
    return y - height/2;
  }
  //the visual botto of the rectangle (remember we're y-negative)
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

  //you don't have to memorize a ton of Geometry rules -- when writing this, I 
  //just googled "rectangle rectangle collision" or "rectangle intersect test"
  Boolean intersects(Rectangle test)
  {
    //proof by contradiction!
    if(left()  > test.right()) return false;
    if(right() < test.left()) return false;
    if(top() > test.bottom()) return false;   //seems opposite because of y-negative...    
    if(bottom() < test.top()) return false;   //seems opposite because of y-negative...    
    
    return true;
  }
  
}