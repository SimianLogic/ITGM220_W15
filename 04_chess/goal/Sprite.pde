class Sprite extends Rectangle
{
  PImage image;
  
  Sprite(String image_path, float center_x, float center_y, float width, float height)
  {
    super(center_x, center_y, width, height, color(255,255,255));
    image = loadImage(image_path);
  }
  
  void draw()
  {
    image(image, x - width/2, y-height/2, width, height);
  }
}