
Rectangle rect1;
Rectangle rect2;

void setup()
{
  size(800,600);
  
  rect1 = new Rectangle();
  rect1.x = 400;
  rect1.y = 300;
  rect1.width = 100;
  rect1.height = 100;
  rect1.fill = color(0,0,255);
  
  rect2 = new Rectangle(400,300,50,250,color(0,0,255));
}

void draw()
{
  background(190,190,190);
  
  rect2.x = mouseX;
  rect2.y = mouseY;
  
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