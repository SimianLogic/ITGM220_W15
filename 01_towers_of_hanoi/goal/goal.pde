float baseY = 500;
float pegSpacing = 200;
float pegWidth = 25;
float pegHeight = 200;
  
int[] peg1 = {4,3,2,1};
int[] peg2 = {0,0,0,0};
int[] peg3 = {0,0,0,0};

int selectedRing = 0;
int selectedX = 400;
int selectedY = 100;

int ringHeight = 25;
int ringWidth = 35;
  
void setup()
{
  size(800,600);
  
}

void draw()
{
  fill(180,180,180);
  rect(0,0,800,600);
  
  fill(140, 115, 85);
  
  //draw the base
  rect(0,baseY,800,100);
  for(int i = 1; i <= 3; i++)
  {
    rect(pegSpacing*i - pegWidth/2, baseY - pegHeight, pegWidth, pegHeight);
  }

  //draw the rings
  drawPeg(peg1, 1);
  drawPeg(peg2, 2);
  drawPeg(peg3, 3);
  
  //draw the selected ring
  if(selectedRing != 0)
  {
    fill(0,0,255);
    rect(selectedX - selectedRing*ringWidth/2, selectedY, selectedRing*ringWidth, ringHeight);
  }
}

void drawPeg(int[] ring_array, int peg)
{
  fill(0,0,255);
  for(int i = 0; i < ring_array.length; i++)
  {
    if(ring_array[i] > 0)
    {
      rect(pegSpacing*peg - ring_array[i]*ringWidth/2, baseY - ringHeight*(i+1), ring_array[i]*ringWidth, ringHeight);
    }
  }
}

void mouseClicked()
{
  int max_ring_width = ringWidth*4;
  
  for(int i = 1; i <= 3; i++)
  {
    if(mouseX > pegSpacing*i - max_ring_width && mouseX < pegSpacing*i + max_ring_width)
    {
      handleClick(i);
    }
  }
}

void handleClick(int column)
{
  if(selectedRing == 0)
  {
    if(column == 1)
    {
      selectedRing = removeLast(peg1);
    }else if(column == 2){
      selectedRing = removeLast(peg2);
    }else{
      selectedRing = removeLast(peg3);
    }
    
  }else{
    
    if(column == 1)
    {
      selectedRing = addRing(peg1, selectedRing);
    }else if(column == 2){
      selectedRing = addRing(peg2, selectedRing);
    }else{
      selectedRing = addRing(peg3, selectedRing);
    }
        
  }
}

//if there's a ring above 0, return the last one and set the value to 0
int removeLast(int[] peg)
{
  for(int i = peg.length-1; i >= 0; i--)
  {
    if(peg[i] > 0)
    {
      int value = peg[i];
      peg[i] = 0;
      return value;
    }
  }
  return 0;
}

//if there's space, add a ring to the top
int addRing(int[] peg, int value)
{
  for(int i = 0; i < peg.length; i++)
  {
    if(peg[i] == 0)
    {
      peg[i] = value;
      return 0;
    }
  }
  
  //couldn't place it, stay where you are!
  return value;
}