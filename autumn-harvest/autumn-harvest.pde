PImage basketImage;
PImage leavesImage;
PImage leaf1;
PImage leaf2;
PImage leaf3;
PImage acorn;
PImage pumpkinPie;
PImage pumpkin;
PImage starbucks;
PImage bg;
PImage squirrelImage;
PImage squirrelLeft;
PImage squirrelRight;

float selectleaf = random(0, 100);

boolean keyD = false;
boolean keyA = false;

Leaves[] theLeaves = new Leaves[20];

Basket basket;
Squirrel squirrel;

int points = 0;

int thresh = 50;

void setup()
{
  size(800, 480);
  leaf1 = loadImage("leaf1.png");
  leaf2 = loadImage("leaf2.png");
  leaf3 = loadImage("leaf3.png");
  acorn = loadImage("acorn.png");
  pumpkinPie = loadImage("pumpkinPie.png");
  starbucks = loadImage("starbucks.png");
  basketImage = loadImage("basket.png");
  pumpkin = loadImage("pumpkin.png");
  bg = loadImage("forestScene.jpg");
  squirrelLeft = loadImage("squirrelLeft.png");
  squirrelRight = loadImage("squirrelRight.png");

  basket = new Basket (0, 400);
  squirrel = new Squirrel (800, 300);

  // create our banana objects
  for (int i = 0; i < theLeaves.length; i++)
  {
    // build a new banana and store it in the appropriate slot
    theLeaves[i] = new Leaves(random(0, width), random(0, height));
  }

  // increase the detail on our Perlin Noise landscape
  noiseDetail(24);
}

void draw()
{
  image(bg, 0, 0, width, height);

  basket.move();
  basket.display();

  // visit all objects and tell them to display
  for (int i = 0; i < theLeaves.length; i++)
  {
    // see if the user clicked on this coin
    boolean hitTest = theLeaves[i].collect(basket.x, basket.y);

    // hit test was successful - add points    
    if (hitTest && leavesImage == leaf1)
    {
      // add a point!
      points++;
    }

    if (hitTest && leavesImage == leaf2)
    {
      // add a point!
      points++;
    }

    if (hitTest && leavesImage == leaf3)
    {
      // add a point!
      points++;
    }

    if (hitTest && leavesImage == starbucks)
    {
      // add two points!
      points += 2;
    }

    if (hitTest && leavesImage == acorn)
    {
      // add a point!
      points += 5;
    }

    if (hitTest && leavesImage == pumpkin)
    {
      // add a point!
      points += 10;
    }

    if (hitTest && leavesImage == pumpkinPie)
    {
      // add a point!
      points += 15;
    }

    // display the coin
    theLeaves[i].display();
  }

  if (points > 100)
  {
    squirrel.move();
    squirrel.display();
  }

  // display points
  fill(255);
  textSize(30);
  text("Points: " + points, 10, 40);
}

void keyPressed()
{
  if (key == 'a') { 
    keyA = true;
  }   
  if (key == 'd') { 
    keyD = true;
  }
}

void keyReleased()
{
  if (key == 'a') { 
    keyA = false;
  }  
  if (key == 'd') { 
    keyD = false;
  }
}

