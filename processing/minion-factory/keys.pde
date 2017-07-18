class Keys
{
  float xPos;
  float yPos; 
  float desiredSize = 25;

  PImage Keys;
  PImage cover;

  int state = 1;


  Keys(float x, float y, float s)
  {
    xPos = x;
    yPos = y;
    s = desiredSize;

    Keys = loadImage("key.png");
    cover = loadImage("2.png");
  }

  void display()
  {
    if (state == 1)
    {
      image(Keys, xPos, yPos, desiredSize, desiredSize);
    } else if (state == 0)
    {
      image(cover, xPos, yPos, desiredSize, desiredSize);
    }
  }


  void checkHit()
  {
    float distance = dist(minion.x, minion.y, xPos, yPos);
    if (distance < 35 && state == 1)
    {
      state = 0;
      bonus.pause();
      bonus.rewind();
      bonus.play();
      score --;
    }
  }


}
