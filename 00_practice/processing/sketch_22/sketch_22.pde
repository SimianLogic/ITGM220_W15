
Rectangle blue_rect;

void setup()
{
  size(800,600);
  
  blue_rect = new Rectangle();
  blue_rect.x = 400;
  blue_rect.y = 300;
  blue_rect.width = 100;
  blue_rect.height = 100;
  blue_rect.fill = color(0,0,255);
}

void draw()
{
  blue_rect.draw();
}