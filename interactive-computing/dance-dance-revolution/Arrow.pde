class Arrow {

  PImage uArrow, dArrow, lArrow, rArrow;
  float xPos, yPos, xCheck, yCheck;
  Arrow( float x, float y) {

    uArrow = loadImage("uArrow.png");
    dArrow = loadImage("dArrow.png");
    rArrow = loadImage("rArrow.png");
    lArrow = loadImage("lArrow.png");
    xPos = x;
    yPos = y;
  }

  boolean hitCheck(float x, float y) {
    xCheck = x;
    yCheck = y;
    float dCheck = dist(xCheck, yCheck, xPos, yPos);


    if (dCheck < 25) {
      return true;
    } else {
      return false;
    }
  }


  void display() {

    yPos -= 3;
    if ( xPos == 50) {
      image(lArrow, xPos, yPos, 100, 100);
    } 
    else if ( xPos == width* 0.25 + 50) {

      image(uArrow, xPos, yPos, 100, 100);
    } 
    
    else if ( xPos == width* 0.5 + 50) {
      image(dArrow, xPos, yPos, 100, 100);
    } else {
      image(rArrow, xPos, yPos, 100, 100);
    }
  }
  boolean offScreen() {

    if (yPos < 0)
    {
      miss += 1;
      point -= 1;
      return true;
    } else {

      return false;
    }
  }
}
