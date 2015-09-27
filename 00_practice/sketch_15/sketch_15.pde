void setup()
{
   size(800,600); 
}

void draw()
{
  fill(128,128,128);
  rect(0,0,800,600);
  
  drawColumn();
}

void drawColumn()
{
  fill(0,0,255);  
  rect(mouseX-10,0,20,600);
}