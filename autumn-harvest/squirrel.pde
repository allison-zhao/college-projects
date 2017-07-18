class Squirrel

{
  // location
  float x, y;

  // speed (constant)
  float speed = 4;

  Squirrel(float sx, float sy)
  {
    // store position
    x = sx;
    y = sy;
  }
  
  void move()
  {
    if (x == 800)
    {
    squirrelImage = squirrelLeft;
    x -= speed;
    }
    
    if (x == 0)
    {
      squirrelImage = squirrelRight;
      x += speed;  
    }
    
  }
  
  void display()
  {
    image(squirrelImage, 800, 300, 100, 100);  
  }
  
  

}
