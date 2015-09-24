// DONE: whiteboard Tower of Hanoi
// DONE: draw the board & pegs with magic numbers. woodish color = rgb(140, 115, 85)
// DONE: refactor with variables and then change some around
// DONE: draw the discs (use {0,0,0,0} for empty pegs)
// DONE: detect which peg was clicked...OOPS. let's refactor into functions
// DONE: detect which peg was clicked, add a variable for selectedRing, take disc off a peg
// DONE: write code to put a disc down on a peg
// DONE: explain the difference between pass-by-value and pass-by-reference
// DONE: pseudo-code homework assignments on whiteboard

//HW: change the pegs to hold 5 discs
int[] peg1 = {4,3,2,1};
int[] peg2 = {0,0,0,0};
int[] peg3 = {0,0,0,0};

//HW: make a variable to keep track of how many moves (pick up + put down) we've made

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
  
   //rgb(140, 115, 85)
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
    //HW: draw the selected disc with the correct color for its size
    fill(0,255,0);
    rect(400 - selectedDisc*discWidth/2, 100, discWidth*selectedDisc, discHeight);
  }
  
  //HW: draw how many moves we've taken somewhere on screen
}

void drawPeg(int which_peg, int[] discs)
{
  //HW: draw these discs with the correct color for their sizes
  for(int i = 0; i < discs.length; i++)
  {
    fill(0,255,0);
    
    if(discs[i] > 0)
    {
      //the width of an individual disc
      int temp_width = discWidth*discs[i];
      //draw a disc
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
      //put the selected disc into the first available spot
      //HW: see if this spot is SMALLER than the one below it (if one is below)
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
      //it's important to return so we don't pick up the next one as well!
      return;
    }
  }
  
}