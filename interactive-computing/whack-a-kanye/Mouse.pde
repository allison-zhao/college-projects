

class Mouse
/* @pjs preload="kanyemole.png","trophyup.png","trophydown.png", "beyonce.png","tswift.png";*/
{
  PImage trophyup;
  PImage trophydown;

  //constructor
  Mouse(int x, int y, int s)
  {
    //position
    mouseX = x;
    mouseY = y;

    noCursor();

    //load artwork
    trophyup = loadImage("trophyup.png");
    trophydown = loadImage("trophydown.png");
  }

  void display()
  {
    if (mousePressed == true)
    {
      imageMode(CENTER);
      image(trophydown, mouseX, mouseY, 50, 50);
    } else
    {
      imageMode(CENTER);
      image(trophyup, mouseX, mouseY, 50, 50);
    }
  }
}

