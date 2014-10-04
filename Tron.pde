/*
Definitions of variables: 
 Game1 = One player game;
 x2 = Single player light cycle x coordinate;
 y2 = Single player light cycle y coordinate;
 x3 = Computer x coordinate;
 y3 = Computer y coordinate;
 dir2 = Single plaer light cycle direction control;
 dir3 = Computer direction control;
 start1 = Single player game start/stop control;
 humanV = Human victory;
 compV = Computer victory;
 compTurn = Randomizer for computer turn;
 humanBoostCount = Human boost number control;
 
 Game2 = Two player game;
 x = P1 light cycle x coordinate;
 y = P1 light cycle y coordinate;
 x1 = P2 light cycle x coordinate;
 y2 = P2 light cycle y coordinate;
 dir = P1 direction control;
 dir1 = P2 direction control;
 start = Two player game start/stop control;
 countP1 = P1 score;
 countP2 = P2 score;
 p1V = Player 1 victory;
 p2V = Player 2 victory;
 boostCount1 = Player 1 boost number control;
 boostCount2 = Player 2 boost number control;
 */

int x=100;
int y=250;
int x1=400;
int y1=250;
int dir=RIGHT;
boolean start=false;
int dir1=LEFT;
int countP1=0;
int countP2=0;
boolean game2=false;
boolean game1=false;
boolean start1=false;
int dir2=RIGHT;
int x2=100;
int y2=250;
int countHuman=0;
int countComp=0;
int x3=400;
int y3=250;
int dir3= LEFT;
boolean p1V=false;
boolean p2V=false;
boolean humanV=false;
boolean compV=false;
int compTurn=0;
int humanBoostCount=3;
int boostCount1=3;
int boostCount2=3;

void setup()
{
  frameRate(60);
  size(500, 500);
  background(0);
  strokeWeight(2);
  stroke(255, 255, 255);
  fill(0);
  rect(0, 0, 499, 499);
  fill(255);
  textSize(30);
  textAlign(CENTER, TOP);
  text("Tron:The Game", 250, 180);
  textAlign(CENTER, CENTER);
  text("Press 1 for single player mode", 250, 250);
  textAlign(CENTER, BOTTOM);
  text("Press 2 for two player mode", 250, 320);
}
void draw()
{
  if (game1==true)
  {
    if (start1==true)
    {
      OnePlayerGame();
    }
  }

  if (game2==true)
  {
    if (start==true)
    {
      TwoPlayerGame();
    }
  }
}


void keyTyped()
{
  if (key=='1')
  {
    game1=true;
    game2=false;
    countP1=0;
    countP2=0;
    countHuman=0;
    countComp=0;
    background(0);
    x2=100;
    y2=250;
    x3=400;
    y3=250;
    dir2=RIGHT;
    stroke(255, 255, 255);
    fill(0);
    rect(0, 0, 499, 499);
    fill(255);
    textAlign(CENTER);
    textSize(30);
    text("Press B to begin the game", 250, 150);
    text("Press V for boost", 250, 250);
    text("Boost can go through walls", 250, 350);
    start=false;
  }
  if (key=='2')
  {
    game2=true;
    game1=false;
    countP1=0;
    countP2=0;
    countHuman=0;
    countComp=0;
    background(0);
    x=100;
    y=250;
    x1=400;
    y1=250;
    dir=RIGHT;
    dir1=LEFT;
    stroke(255, 255, 255);
    fill(0);
    rect(0, 0, 499, 499);
    fill(255);
    textAlign(CENTER);
    textSize(30);
    text("Press B to begin the game", 250, 100);
    text("P1: Press V for boost", 250, 200);
    text("P2: Press M for boost", 250, 300);
    text("Boost can go through walls", 250, 400);
    start1=false;
  }
  if (game1==true)
  {
    if (key=='r'||key=='b'||key=='R'||key=='B')
    {
      background(0);
      x2=100;
      y2=250;
      dir2=RIGHT;
      x3=400;
      y3=250;
      dir3=LEFT;
      stroke(255, 255, 255);
      fill(0);
      rect(0, 0, 499, 499);
      humanBoostCount=3;
      humanV=false;
      compV=false;
      start1=true;
    }
    if (start1==true)
    {
      if (key=='v'||key=='V')
      {
        if (humanBoostCount !=0)
        {
          if (dir2==RIGHT)
          {
            stroke(0, 227, 255);
            line(x2, y2, x2+30, y2);
            x2=x2+30;
            humanBoostCount--;
          }
          else if (dir2==LEFT)
          {
            stroke(0, 227, 255);
            line(x2, y2, x2-30, y2);
            x2=x2-30;
            humanBoostCount--;
          }
          else if (dir2==UP)
          {
            stroke(0, 227, 255);
            line(x2, y2, x2, y2-30);
            y2=y2-30;
            humanBoostCount--;
          }
          else
          {
            stroke(0, 227, 255);
            line(x2, y2, x2, y2+30);
            y2=y2+30;
            humanBoostCount--;
          }
        }
      }
    }
    if (humanV==false && compV==false)
    {
      if (key==' ')
      {
        if (start1==true)
        {
          start1=false;
        }
        else
        {
          start1=true;
        }
      }
    }
  }
  if (game2==true)
  {
    //begin game + restart
    if (key=='r' || key=='b'||key=='R'||key=='B')
    {
      background(0);
      x=100;
      y=250;
      x1=400;
      y1=250;
      dir=RIGHT;
      dir1=LEFT;
      stroke(255, 255, 255);
      fill(0);
      rect(0, 0, 499, 499);
      boostCount1=3;
      boostCount2=3;
      p1V=false;
      p2V=false;
      start=true;
    }
    if (start==true)
    {
      if (key=='m'||key=='M')
      {
        if (boostCount1 !=0)
        {
          if (dir==RIGHT)
          {
            stroke(0, 227, 255);
            line(x, y, x+30, y);
            x=x+30;
            boostCount1--;
          }
          else if (dir==LEFT)
          {
            stroke(0, 227, 255);
            line(x, y, x-30, y);
            x=x-30;
            boostCount1--;
          }
          else if (dir==UP)
          {
            stroke(0, 227, 255);
            line(x, y, x, y-30);
            y=y-30;
            boostCount1--;
          }
          else
          {
            stroke(0, 227, 255);
            line(x, y, x, y+30);
            y=y+30;
            boostCount1--;
          }
        }
      }
    }
    if (key=='v'||key=='V')
    {
      if (boostCount2 != 0)
      {
        if (dir1==RIGHT)
        {
          stroke(255, 72, 0);
          line(x1, y1, x1+30, y1);
          x1=x1+30;
          boostCount2--;
        }
        else if (dir1==LEFT)
        {
          stroke(255, 72, 0);
          line(x1, y1, x1-30, y1);
          x1=x1-30;
          boostCount2--;
        }
        else if (dir1==UP)
        {
          stroke(255, 72, 0);
          line(x1, y1, x1, y1-30);
          y1=y1-30;
          boostCount2--;
        }
        else
        {
          stroke(255, 72, 0);
          line(x1, y1, x1, y1+30);
          y1=y1+30;
          boostCount2--;
        }
      }
    }
    //pause + resume
    if (p1V==false && p2V==false)
    {
      if (key==' ')
      {
        if (start==true)
        {
          start=false;
        }
        else
        {
          start=true;
        }
      }
    }


    if (start==true)
    {
      //p2 control
      if (key=='w')
      {
        if (dir1!=DOWN)
        {
          dir1=UP;
        }
      }
      if (key=='s')
      {
        if (dir1!=UP)
        {
          dir1=DOWN;
        }
      }
      if (key=='a')
      {
        if (dir1!=RIGHT)
        {
          dir1=LEFT;
        }
      }
      if (key=='d')
      {
        if (dir1!=LEFT)
        {
          dir1=RIGHT;
        }
      }
    }
  }
}



void keyPressed()
{
  if (game1==true)
  {
    if (start1==true)
    {
      if (key==CODED)
      {
        if (keyCode==UP)
        {
          if (dir2!=DOWN)
          {
            dir2=UP;
          }
        }
        if (keyCode==DOWN)
        {
          if (dir2!=UP)
          {
            dir2=DOWN;
          }
        }
        if (keyCode==LEFT)
        {
          if (dir2!=RIGHT)
          {
            dir2=LEFT;
          }
        }
        if (keyCode==RIGHT)
        {
          if (dir2!=LEFT)
          {

            dir2=RIGHT;
          }
        }
      }
    }
  }
  if (game2==true)
  {
    if (start==true)
    {
      //p1 control
      if (key==CODED)
      {
        if (keyCode==UP)
        {
          if (dir!=DOWN)
          {
            dir=UP;
          }
        }
        if (keyCode==DOWN)
        {
          if (dir!=UP)
          {
            dir=DOWN;
          }
        }
        if (keyCode==LEFT)
        {
          if (dir!=RIGHT)
          {
            dir=LEFT;
          }
        }
        if (keyCode==RIGHT)
        {
          if (dir!=LEFT)
          {

            dir=RIGHT;
          }
        }
      }
    }
  }
}

void OnePlayerGame()
{
  strokeWeight(2);
  stroke(0, 227, 255);
  point(x2, y2);
  if (dir2==RIGHT)
  {
    x2=x2+1;
  }
  else if (dir2==LEFT)
  {
    x2=x2-1;
  }
  else if (dir2==UP)
  {
    y2=y2-1;
  }
  else
  {
    y2=y2+1;
  }

  stroke(255, 72, 0);
  point(x3, y3);
  if (dir3==RIGHT)
  {
    x3=x3+1;
    compTurn=int(random(2));
    if (get(x3+3, y3)!=color(0))
    {
      if (get(x3+2, y3-4)!=color(0))
      {
        dir3=DOWN;
      }
      else if (get(x3+2, y3+4)!=color(0))
      {
        dir3=UP;
      }
      else
      {
        if (compTurn==1)
        {
          dir3=DOWN;
        }
        if (compTurn==0)
        {
          dir3=UP;
        }
      }
    }
  }
  else if (dir3==LEFT)
  {
    x3=x3-1;
    compTurn=int(random(2));
    if (get(x3-3, y3)!=color(0))
    {
      if (get(x3-2, y3+4)!=color(0))
      {
        dir3=UP;
      }
      else if (get(x3-2, y3-4)!=color(0))
      {
        dir3=DOWN;
      }
      else
      {
        if (compTurn==0)
        {
          dir3=DOWN;
        }
        else if (compTurn==1)
        {
          dir3=UP;
        }
      }
    }
  }
  else if (dir3==UP)
  {
    y3=y3-1;
    compTurn=int(random(2));
    if (get(x3, y3-3)!=color(0))
    {
      if (get(x3-4, y3-2)!=color(0))
      {
        dir3=RIGHT;
      }
      else if (get(x3+4, y3-2)!=color(0))
      {
        dir3=LEFT;
      }
      else
      {
        if (compTurn==0)
        {
          dir3=RIGHT;
        }
        else if (compTurn==1)
        {
          dir3=LEFT;
        }
      }
    }
  }
  else
  {
    y3=y3+1;
    compTurn=int(random(2));
    if (get(x3, y3+3)!=color(0))
    {
      if (get(x3+4, y3+2)!=color(0))
      {
        dir3=LEFT;
      }
      else if (get(x3-4, y3+2)!=color(0))
      {
        dir3=RIGHT;
      }
      else
      {
        if (compTurn==1)
        {
          dir3=RIGHT;
        }
        else if (compTurn==0)
        {
          dir3=LEFT;
        }
      }
    }
  }


  if (dir2==RIGHT)
  {
    if (get(x2+2, y2)!=color(0))
    {
      compV=true;
    }
  }
  else if (dir2==UP)
  {
    if (get(x2, y2-1)!=color(0))
    {
      compV=true;
    }
  }
  else if (dir2==DOWN)
  {
    if (get(x2, y2+2)!=color(0))
    {
      compV=true;
    }
  }
  else if (dir2==LEFT)
  {
    if (get(x2-2, y2)!=color(0))
    {
      compV=true;
    }
  }
  else
  {
    start1=true;
  }


  if (dir3==RIGHT)
  {
    if (get(x3+2, y3)!=color(0))
    {
      humanV=true;
    }
  }
  else if (dir3==UP)
  {
    if (get(x3, y3-2)!=color(0))
    {
      humanV=true;
    }
  }
  else if (dir3==DOWN)
  {
    if (get(x3, y3+2)!=color(0))
    {
      humanV=true;
    }
  }

  else if (dir3==LEFT)
  {
    if (get(x3-2, y3)!=color(0))
    {
      humanV=true;
    }
  }

  else
  {
    humanV=false;
    compV=false;
    start1=true;
  }

  if ((y2==y3)&&((x2+1==x3-1)||(x2==x3)))
  {
    humanV=true;
    compV=true;
  }

  if (humanV==true && compV==false)
  {
    textAlign(CENTER);
    fill(255);
    textSize(30);
    text("Human Won!", 250, 250);
    countHuman=countHuman+1;
    text("Human Score: "+countHuman, 250, 150);
    text("Computer Score: "+countComp, 250, 200);
    text("Press R to restart", 250, 300);
    text("Press 2 for two player mode", 250, 350);
    start1=false;
  }
  else if (humanV==false && compV==true)
  {
    textAlign(CENTER);
    fill(255);
    textSize(30);
    text("Computer Won!", 250, 250);
    countComp=countComp+1;
    text("Human Score: "+countHuman, 250, 150);
    text("Computer Score: "+countComp, 250, 200);
    text("Press R to restart", 250, 300);
    text("Press 2 for two player mode", 250, 350);
    start1=false;
  }
  if (humanV==true && compV==true)
  {
    textAlign(CENTER);
    fill(255);
    textSize(30);
    text("Crashed at the same time!", 250, 250);
    text("Human Score: "+countHuman, 250, 150);
    text("Computer Score: "+countComp, 250, 200);
    text("Press R to restart", 250, 300);
    text("Press 2 for two player mode", 250, 350);
    start1=false;
  }
}




void TwoPlayerGame()
{
  strokeWeight(2);
  //p1
  stroke(0, 227, 255);
  point(x, y);
  if (dir==RIGHT)
  {
    x=x+1;
  }
  else if (dir==LEFT)
  {
    x=x-1;
  }
  else if (dir==UP)
  {
    y=y-1;
  }
  else
  {
    y=y+1;
  }

  //p2
  stroke(255, 72, 0);
  point(x1, y1);
  if (dir1==RIGHT)
  {
    x1=x1+1;
  }
  else if (dir1==LEFT)
  {
    x1=x1-1;
  }
  else if (dir1==UP)
  {
    y1=y1-1;
  }
  else
  {
    y1=y1+1;
  }


  if (dir==RIGHT)
  {
    if (get(x+1, y)!=color(0))
    {
      p2V=true;
    }
  }
  else if (dir==UP)
  {
    if (get(x, y-1)!=color(0))
    {
      p2V=true;
    }
  }
  else if (dir==DOWN)
  {
    if (get(x, y+1)!=color(0))
    {
      p2V=true;
    }
  }

  else if (dir==LEFT)
  {
    if (get(x-1, y)!=color(0))
    {
      p2V=true;
    }
  }

  else
  {
    start=true;
  }

  if (dir1==LEFT)
  {
    if (get(x1-1, y1)!=color(0))
    {
      p1V=true;
    }
  }
  else if (dir1==RIGHT)
  {
    if (get(x1+1, y1)!=color(0))
    {
      p1V=true;
    }
  }
  else if (dir1==UP)
  {
    if (get(x1, y1-1)!=color(0))
    {
      p1V=true;
    }
  }
  else if (dir1==DOWN)
  {
    if (get(x1, y1+1)!=color(0))
    {
      p1V=true;
    }
  }
  else
  {
    start=true;
  }

  if (p1V==true && p2V==false)
  {
    textAlign(CENTER);
    fill(255);
    textSize(30);
    text("Player 1 Won!", 250, 250);
    countP1=countP1+1;
    text("P1 Score: "+countP1, 150, 150);
    text("P2 Score: "+countP2, 350, 150);
    text("Press R to restart", 250, 300);
    text("Press 1 for single player mode", 250, 350);
    start=false;
  }
  else if (p1V==false && p2V==true)
  {
    textAlign(CENTER);
    fill(255);
    textSize(30);
    text("Player 2 Won!", 250, 250);
    countP2=countP2+1;
    text("P1 Score: "+countP1, 150, 150);
    text("P2 Score: "+countP2, 350, 150);
    text("Press R to restart", 250, 300);
    text("Press 1 for single player mode", 250, 350);
    start=false;
  }
  if (p1V==true && p2V==true)
  {
    textAlign(CENTER);
    fill(255);
    textSize(30);
    text("Crashed at the same time!", 250, 250);
    text("P1 Score: "+countP1, 150, 150);
    text("P2 Score: "+countP2, 350, 150);
    text("Press R to restart", 250, 300);
    text("Press 1 for single player mode", 250, 350);
    start=false;
  }
}

