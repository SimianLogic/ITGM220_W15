int[] peg1 = {4,3,2,1};
int[] peg2 = {0,0,0,0};
int[] peg3 = {0,0,0,0};

int selectedDisc = 0;

int baseY = 500;
int pegSpacing = 200;
int pegHeight = 250;
int pegWidth = 25;

int discHeight = 25;
int discWidth = 40;

void setup()
{
  size(800,600);
}

void draw()
{
  fill(180,180,180);
  rect(0,0,800,600);
  
  fill(140, 115, 85);
  rect(0,baseY,800,100);
  
  for(int i = 1; i <= 3; i++)
  {
    rect(  pegSpacing*i - pegWidth/2, 
          baseY - pegHeight,
          pegWidth,
          pegHeight);
  }
  
  drawPeg(1, peg1);
  drawPeg(2, peg2);
  drawPeg(3, peg3);
  
  if(selectedDisc > 0)
  {
    fill(0,255,0);
    rect(400 - selectedDisc*discWidth/2, 100, discWidth*selectedDisc, discHeight);
  }
}

void drawPeg(int which_peg, int[] discs)
{
  for(int i = 0; i < discs.length; i++)
  {
    fill(0,255,0);
    
    if(discs[i] > 0)
    {
      int temp_width = discWidth*discs[i];
      rect(pegSpacing*which_peg - temp_width/2, baseY - discHeight*(i+1), temp_width, discHeight);
    }
  } 
}

void mouseClicked()
{
  for(int i = 1; i <= 3; i++)
  {
    if(mouseX > pegSpacing*i - discWidth*peg1.length/2 && mouseX < pegSpacing*i + discWidth*peg1.length/2)
    {
       if(selectedDisc == 0)
       {
         if(i == 1)
         {
           maybeTakeSomethingFrom(peg1);
         }else if(i == 2){
           maybeTakeSomethingFrom(peg2);
         }else{
           maybeTakeSomethingFrom(peg3);
         } 
       }else{
         if(i == 1)
         {
           maybePutSomethingDown(peg1);
         }else if(i == 2){
           maybePutSomethingDown(peg2);
         }else{
           maybePutSomethingDown(peg3);
         }
         
       }
       
    }
  }
}

void maybePutSomethingDown(int[] which_peg)
{
  for(int i = 0; i < which_peg.length; i++)
  {
    if(which_peg[i] == 0)
    {
      which_peg[i] = selectedDisc;
      selectedDisc = 0;
    }
  }
}

void maybeTakeSomethingFrom(int[] which_peg)
{
  for(int i = which_peg.length-1; i >= 0; i--)
  {
    if(which_peg[i] != 0)
    {
      selectedDisc = which_peg[i];
      which_peg[i] = 0;
      return;
    }
  }
  
}