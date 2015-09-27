int minRedX = 300;
int maxRedX = 500;

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
  if(mouseX > minRedX && mouseX < maxRedX)
  {
    fill(255,0,0);
  }else{
    fill(0,0,255);
  }
  
  rect(mouseX-10,0,20,600);
}