class Basket
{
  // location
  float x, y;

  // speed (constant)
  float speed = 4;

  Basket(float _x, float _y)
  {
    // store position
    x = _x;
    y = _y;
  }

  void move()
  {
    //move right
    if (keyD && x < 800)
    {
      x += speed;
    }

    if (keyA && x > 0)
    {
      x -= speed;
    }
  }
  
  void display()
  {
    image(basketImage, x, 400, 100, 80); 
  }
  
}

