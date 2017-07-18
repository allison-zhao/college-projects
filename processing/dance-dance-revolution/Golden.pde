class Golden
{
  int xPos, yPos;
  float ySpeed;
  float angle;
  float rotateSpeed;  
  float noiseCount;
  int myWidth, myHeight;
  boolean dead = false;

  Golden()
  {
    xPos = 900;
    yPos = -50;
    ySpeed = random(1, 2);
    angle = random(0, 2 * PI);
    rotateSpeed = random(.01, .03);
    noiseCount = random(10000);
    myWidth = 100;
    myHeight = 100;
  }

  void move(boolean hit)
  {
    yPos += ySpeed;

    // if I was hit, make myself smaller
    if (hit)
    {
      myWidth -= 15;
      myHeight -= 15;
      
      if (myWidth == 0 && myHeight == 0)
      {
        point += 10;
      }

      // am I dead?
      if (myWidth <= 0 || myHeight <= 0)
      {
        dead = true;
      }
    }

    if (!dead)
    {
      pushMatrix();
        translate(xPos, yPos);
        rotate(angle);
        imageMode(CENTER);
        image(goldenState, 0, 0, myWidth, myHeight);
      popMatrix();
      
      xPos += map(noise(noiseCount), 0.0, 1.0, -2, 2);
      angle += rotateSpeed;
      noiseCount += .003;
    }
  }
}

