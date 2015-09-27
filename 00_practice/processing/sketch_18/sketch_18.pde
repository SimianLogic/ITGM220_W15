
float startDragX = -1;
float startDragY = -1;
float radius;
boolean isDragging = false;

void setup()
{
   size(800,600); 
}

void draw()
{
  fill(128,128,128);
  rect(0,0,800,600);
  
  //if we've ever clicked, our value will be > 0
  if(startDragX > 0)
  {
    fill(255,255,255);
    ellipse(startDragX,startDragY,radius*2,radius*2);
  }
  
  if(isDragging)
  {
    float dx = mouseX - startDragX;
    float dy = mouseY - startDragY;
    radius = sqrt(dx*dx + dy*dy);
  }
}

void mousePressed()
{
  startDragX = mouseX;
  startDragY = mouseY;
  isDragging = true;
  radius = 0;
}

void mouseReleased()
{
  isDragging = false;
}