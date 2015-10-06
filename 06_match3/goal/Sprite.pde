class Sprite extends Rectangle
{
  PImage image;
  
  Sprite(String image_path, float center_x, float center_y, float width, float height)
  {
    super(center_x, center_y, width, height, color(255,255,255));
    image = loadImage(image_path);
  }
  
  Sprite(String image_path, float center_x, float center_y)
  {
    super(center_x, center_y, 0, 0, color(255,255,255));
    image = loadImage(image_path);
    
    this.width = image.width;
    this.height = image.height;
  }
  
  void draw()
  {
    image(image, x - width/2, y-height/2, width, height);
  }
}
