class Rectangle
{
  float x;
  float y;
  float width;
  float height;
  color fill;
  
  void draw()
  {
    fill(fill);
    rect(x-width/2, y-height/2, width, height);
  }
}