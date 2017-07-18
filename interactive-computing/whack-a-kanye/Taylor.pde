
class Taylor
/* @pjs preload="kanyemole.png","trophyup.png","trophydown.png", "beyonce.png","tswift.png";*/

{
  //position
  float xPos;
  float yPos;

  //artwork
  PImage taylor;

  //state
  //0 = down
  //1 = up
  int state = 0;

  //frames we want to stay in each state
  int stayin = int(random(100, 500));

  //how much time have we been in this state
  int timein = 0;


  //constructor
  Taylor(float x, float y)
  {
    xPos = x;
    yPos = y;
    taylor = loadImage("tswift.png");
  }

  //display function
  void display()
  {

    //down state
    if (state == 0)
    {
      noFill();
      stroke(255, 255, 255, 255);
      strokeWeight(10);
      ellipse (xPos, yPos, 50, 50);

      //add time
      timein += 1;

      if (timein >= stayin)
      {
        //switch!
        state = 1;
        timein = 0;
        stayin = int(random(100, 500));
      }
    }

    //up state
    if (state == 1)
    {
      imageMode(CENTER);
      image(taylor, xPos, yPos, 50, 50);

      //count up time
      timein += 1;

      if (timein >= stayin)
      {
        state = 0;
        timein = 0;
        stayin = int(random(100, 500));
      }
    }
  }

  void checkHit()
  {
    float distance = dist(xPos, yPos, mouseX, mouseY);
    if (distance < 70 && mousePressed == true && state == 1)
    {
      state = 0;
      score += 5;
    }
  }
}

