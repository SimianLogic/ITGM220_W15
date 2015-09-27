void setup()
{
   size(800,600); 
}

void draw()
{
  if(mousePressed)
  {
    fill(255,0,0);
  }else{
    fill(0,0,255);
  }
    
  rect(mouseX-10,mouseY-10,20,20);
}