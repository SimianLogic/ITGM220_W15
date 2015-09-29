class RoundedRectangle extends Rectangle
{
  float cornerRadius;
  
  RoundedRectangle(float x, float y, float width, float height, color fill, float cornerRadius)
  {
    super(x,y,width,height, fill);
    this.cornerRadius = cornerRadius;
  }
  
  void draw()
  {
    fill(fill);
    rect(x-width/2, y-height/2, width, height, cornerRadius, cornerRadius, cornerRadius, cornerRadius);
  }
}