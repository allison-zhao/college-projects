// import gif animation library
import gifAnimation.*;

// import the Minim sound library
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

// minim controller
Minim minim;

// sound loop
AudioPlayer bgm;
AudioPlayer bonus;
AudioPlayer over;


// Our game state
// start = 0
// stage 1 = 1
// stage 2 = 2
// how to play = 3
// game over = 4
// game over in state2 = 5
int state = 0;


// flags
boolean keyA = false;
boolean keyS = false;
boolean keyD = false;
boolean keyW = false;


// keys variable
float xKey;
float yKey;
PImage Keys;

PImage titleScreen;
PImage Agnes;
PImage howtoplay;
PImage gameOver;
PImage stage2;
PImage bananaImage;
PImage bananaKing;
PFont font;

//keys variable
Keys Keys1;
Keys Keys2;
Keys Keys3;
Keys Keys4;
Keys Keys5;
Keys Keys6;
Keys Keys7;
Keys Keys8;
Keys Keys9;
Keys Keys10;

// stage 1 score
int score = 10;

// stage 2 score
int points = 10;

// obstacle
int enemyd = 0;

// an Array to hold all of our tiles
PImage [] tiles = new PImage [7];
PImage background;

// how big is each cell (pick a standard size)
int CELL_SIZE = 30;

// special size for minion
int MINION_SIZE = 45;


// define our level using our tiles (note that the numbers here 
// indicate which image file should appear at a particular spot on the grid)
int[][] level = {
  { 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02 }, 
  { 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02 }, 
  { 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02 }, 
  { 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 06, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02 }, 
  { 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 06, 02, 02, 02, 02, 02, 02, 00, 00, 00, 00, 02, 02, 02, 02, 02, 02, 02, 02 }, 
  { 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 06, 00, 00, 00, 00, 04, 04, 01, 01, 01, 01, 02, 06, 06, 02, 02, 02, 02, 02 }, 
  { 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02 }, 
  { 02, 02, 06, 06, 06, 06, 06, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 00, 00 }, 
  { 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02 }, 
  { 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 00, 00, 00, 00, 00, 00, 00, 02, 02, 02, 02, 02 }, 
  { 02, 02, 02, 02, 00, 00, 00, 00, 00, 04, 04, 04, 00, 00, 00, 00, 00, 00, 03, 03, 03, 03, 03, 03, 03, 00, 00, 00, 00, 00 }, 
  { 06, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02 }, 
  { 06, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02 }, 
  { 06, 02, 02, 02, 02, 02, 02, 02, 02, 02, 00, 00, 00, 00, 00, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02 }, 
  { 06, 02, 02, 02, 02, 02, 02, 02, 02, 02, 01, 01, 01, 01, 01, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02 }, 
  { 06, 05, 05, 00, 00, 00, 00, 00, 00, 00, 01, 01, 01, 01, 01, 01, 01, 04, 04, 04, 00, 00, 00, 02, 02, 02, 02, 02, 02, 02 }, 
  { 00, 00, 00, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02 }, 
  { 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 02, 00, 00, 00, 00, 00 }, 
  { 02, 02, 02, 02, 02, 02, 02, 02, 00, 00, 00, 00, 00, 00, 00, 00, 00, 00, 02, 02, 02, 02, 02, 02, 02, 03, 03, 03, 03, 03 }, 
  { 00, 00, 00, 00, 00, 00, 00, 00, 01, 01, 01, 01, 01, 01, 01, 01, 01, 01, 00, 00, 00, 00, 00, 00, 00, 03, 03, 03, 03, 03 }
};

// player object
Player minion;

// obstacle object
Enemy enemy1;
Enemy enemy2;
Enemy enemy3;

// minion graphics
Gif minionRight;
Gif minionLeft;
Gif currentMinion;

// enemy graphics
Gif enemyLeft;
Gif enemyRight;
Gif currentEnemy;

// banana array
Banana[] theBananas = new Banana[7];

void setup()
{
  size(900, 600);  
  font = loadFont("BankGothic-Medium-48.vlw");

  background = loadImage("background.jpg");
  Agnes = loadImage("agnesincage.png");
  titleScreen = loadImage("titleScreen.png");
  howtoplay = loadImage("howtoplay.png");
  stage2 = loadImage("stage2.jpg");
  gameOver = loadImage("gameOver.png");
  bananaImage = loadImage("banana.png");
  bananaKing = loadImage("bananaking.png");
  

  Keys1 = new Keys(720, 420, 25);
  Keys2 = new Keys(870, 480, 25);
  Keys3 = new Keys(540, 360, 25);
  Keys4 = new Keys(30, 330, 25);
  Keys5 = new Keys(120, 120, 25);
  Keys6 = new Keys(750, 270, 25);
  Keys7 = new Keys(870, 180, 25);
  Keys8 = new Keys(360, 120, 25);
  Keys9 = new Keys(210, 540, 25);
  Keys10 = new Keys(60, 30, 25);


  minim = new Minim(this);
  bgm = minim.loadFile("BGM.mp3"); 
  bgm.loop();
  bonus = minim.loadFile("bonus.mp3");
  over = minim.loadFile("over.mp3");

  // character  
  minionRight = new Gif(this, "minionRight.gif");
  minionRight.loop();
  minionLeft = new Gif(this, "minionLeft.gif");
  minionLeft.loop();
  currentMinion = minionRight;
  currentMinion.loop(); 

  // enemies
  enemyLeft = new Gif(this, "enemyleft.gif");
  enemyLeft.loop();
  enemyRight = new Gif(this, "enemyright.gif");
  enemyRight.loop();

  enemy1 = new Enemy (570, 540);
  enemy2 = new Enemy (120, 420);
  enemy3 = new Enemy (750, 270);
  currentEnemy = enemyRight;
  currentEnemy.loop();

  // load in our tiles
  loadTiles();

  // create our player
  minion = new Player(0, 500);
  
  // create our banana objects
  for (int i = 0; i < theBananas.length; i++)
  {
    // build a new banana and store it in the appropriate slot
    theBananas[i] = new Banana(random(0,width), random(0,height));  
  }

  // increase the detail on our Perlin Noise landscape
  noiseDetail(24);
}


void draw()
{  
  // start screen
  state0();

  // game play - stage 1
  state1();

  // game play - stage 2
  state2();

  // how to play
  state3();

  // game over
  state4();
  
  // game over for stage2
  state5();
}


// iterate over the level array and draw the correct tile to the screen
void drawLevel()
{
  for (int row = 0; row < level.length; row++)
  {
    for (int col = 0; col < level[row].length; col++)
    { 
      image( tiles[ level[row][col] ], col*CELL_SIZE, row*CELL_SIZE, CELL_SIZE, CELL_SIZE);
    }
  }
}


// load our tiles into memory
void loadTiles()
{
  for (int i = 0; i < tiles.length; i++)
  { 
    tiles[i] = loadImage(i + ".png");
  }
}


// getTileCode - checks to see what tile is under the supplied x & y position
int getTileCode(float x, float y)
{
  // convert x & y coordinate to an array coordinate
  int col = int(x)/CELL_SIZE;
  int row = int(y)/CELL_SIZE;

  // off board test
  if (x >= width || x <= 0 || y >= height || y <= 0)
  {
    // off the board - return a solid tile
    return 0;
  }

  // otherwise return the tile value
  return level[row][col];
}


// isSolid - returns true if the tile in question is solid, false if not
// you can update this function so you can support multiple solid tiles
boolean isSolid(int tileCode)
{
  if (tileCode == 2)
  {
    return false;
  } else
  {
    return true;
  }
}


boolean isDanger(int tileCode)
{
  if (tileCode == 4)
  {
    return true;
  } else
  {
    return false;
  }
}


// handle multiple key presses
void keyPressed()
{
  if (key == 'a') { 
    keyA = true;
  }  
  if (key == 's') { 
    keyS = true;
  }  
  if (key == 'd') { 
    keyD = true;
  }  
  if (key == 'w') { 
    keyW = true;
  }
}

void keyReleased()
{
  if (key == 'a') { 
    keyA = false;
  }  
  if (key == 's') { 
    keyS = false;
  }  
  if (key == 'd') { 
    keyD = false;
  }  
  if (key == 'w') { 
    keyW = false;
  }
}


//start screen
void state0()
{
  if (state == 0)
  { 
    image(titleScreen, 0, 0, width, height);

    //draw buttons
    rectMode(CENTER);
    fill(255, 255, 255, 150);
    rect(175, 470, 200, 50, 100);
    fill(200, 0, 0);
    textFont(font, 30);
    text("Play", 140, 480);

    rectMode(CENTER);
    fill(255, 255, 255, 150);
    rect(175, 535, 250, 50, 100);
    fill(200, 0, 0);
    textFont(font, 30);
    text("How to Play", 75, 545);

    if (mouseX > 175 &&  mouseX < 375 && mouseY > 470 && mouseY < 520)
    {
      fill(0, 0, 0, 200);
      rect(175, 470, 200, 50, 100);
      fill(255, 255, 0);
      textFont(font, 30);
      text("Play", 140, 480);

      if (mousePressed) 
      {
        state = 1;
      }
    } else if  (mouseX > 175 &&  mouseX < 425 && mouseY > 535 && mouseY < 585)
    {
      fill(0, 0, 0, 200);
      rect(175, 535, 250, 50, 100);
      fill(255, 255, 0);
      textFont(font, 30);
      text("How to Play", 75, 545);

      if (mousePressed) 
      {
        state = 3;
      }
    }
  }
}


// game play - stage 1
void state1()
{
  if (state == 1)
  {
    image(background, 0, 0, width, height);
    image(Agnes, 0, 0, 60, 60);  

    // draw the level
    drawLevel();

    // move our player
    minion.move();

    // draw our player
    minion.display();
    
    // draw keys
    Keys1.display();
    Keys2.display();
    Keys3.display();
    Keys4.display();
    Keys5.display();
    Keys6.display();
    Keys7.display();
    Keys8.display();
    Keys9.display();
    Keys10.display();
    Keys1.checkHit();
    Keys2.checkHit();
    Keys3.checkHit();
    Keys4.checkHit();
    Keys5.checkHit();
    Keys6.checkHit();
    Keys7.checkHit();
    Keys8.checkHit();
    Keys9.checkHit();
    Keys10.checkHit();  

    fill(255);
    textSize(15);
    text("Keys Left: " + score, 780, 20);

    nextLevel();
  }
}


// game play - stage 2
void state2()
{
  if (state == 2)
  {
    if (millis() < 5*1000) 
    { image(stage2, 0, 0, width, height); }
    else { image(background, 0, 0, width, height); }
    
    image(bananaKing, 0, 0, 60, 60);

    drawLevel();
    
    // move our player
    minion.move();

    // draw our player
    minion.display();

    //draw enemy
    enemy1.move();
    enemy1.display();
    enemy1.checkHit();
    enemy2.move();
    enemy2.display();
    enemy2.checkHit();
    enemy3.move();
    enemy3.display();
    enemy3.checkHit();
    
    // visit all objects and tell them to display
    for (int i = 0; i < theBananas.length; i++)
    {
      // see if the minion catches on this banana
      boolean hitTest = theBananas[i].collect(minion.x, minion.y);

      // hit test was successful - add points    
      if (hitTest)
      {
        // add a point!
        points--;
        if (points <= 0)
        {
          points = 0;
        }
        bonus.pause();
        bonus.rewind();
        bonus.play();
      }

      // display the bananas
      theBananas[i].display();
    }
    
    fill(255);
    textSize(15);
    text("Bananas to be collected: " + points, 650, 20);
    
    endLevel();
    
  }
}


// how to play
void state3()
{
  if (state == 3)
  {
    image(howtoplay, 0, 0, width, height);

    //draw button to go back to main page
    rectMode(CENTER);
    fill(128, 0, 0);
    rect(370, 530, 100, 50, 100);
    fill(255);
    textSize(25);
    text("Back", 340, 535);

    //if clicked
    if (mouseX > 370 &&  mouseX < 470 && mouseY > 530 && mouseY < 580) 
    {
      fill(128, 0, 0);
      rect(370, 530, 100, 50, 100);
      fill(255, 255, 0);
      textSize(25);
      text("Back", 340, 535);

      if (mousePressed)
      {
        state = 0;
      }
    }
  }
}

// game over for stage 1
void state4()
{
  if (state == 4)
  {
    image(gameOver, 0, 0, width, height);

    //draw button to go back to main page
    rectMode(CENTER);
    fill(128, 0, 0);
    rect(450, 450, 200, 50, 100);
    fill(255);
    textSize(25);
    text("Play Again", 375, 460);

    fill(128, 0, 0);
    rect(450, 520, 200, 50, 100);
    fill(255);
    textSize(25);
    text("Main Screen", 370, 530);

    //if clicked
    if (mouseX > 450 &&  mouseX < 550 && mouseY > 450 && mouseY < 500) 
    {
      fill(128, 0, 0);
      rect(450, 450, 200, 50, 100);
      fill(255, 255, 0);
      textSize(25);
      text("Play Again", 375, 460);

      if (mousePressed)
      { 
        state = 1; 
        bgm.rewind();
        bgm.loop();
      }
    } else if (mouseX > 450 &&  mouseX < 550 && mouseY > 500 && mouseY < 550)
    {
      fill(128, 0, 0);
      rect(450, 520, 200, 50, 100);
      fill(255, 255, 0);
      textSize(25);
      text("Main Screen", 370, 530);

      if (mousePressed)
      { 
        state = 0;
        bgm.rewind();
        bgm.loop();
      }
    }
  }
}


// game over for stage 2
void state5()
{
  if (state == 5)
  {
    image(gameOver, 0, 0, width, height);

    //draw button to go back to main page
    rectMode(CENTER);
    fill(128, 0, 0);
    rect(450, 450, 200, 50, 100);
    fill(255);
    textSize(25);
    text("Play Again", 375, 460);

    fill(128, 0, 0);
    rect(450, 520, 200, 50, 100);
    fill(255);
    textSize(25);
    text("Main Screen", 370, 530);

    //if clicked
    if (mouseX > 450 &&  mouseX < 550 && mouseY > 450 && mouseY < 500) 
    {
      fill(128, 0, 0);
      rect(450, 450, 200, 50, 100);
      fill(255, 255, 0);
      textSize(25);
      text("Play Again", 375, 460);

      if (mousePressed)
      { 
        state = 2; 
        bgm.rewind();
        bgm.loop();
      }
    } else if (mouseX > 450 &&  mouseX < 550 && mouseY > 500 && mouseY < 550)
    {
      fill(128, 0, 0);
      rect(450, 520, 200, 50, 100);
      fill(255, 255, 0);
      textSize(25);
      text("Main Screen", 370, 530);

      if (mousePressed)
      { 
        state = 0; 
        bgm.rewind();
        bgm.loop();
      }
    }
  }
}


void nextLevel()
{
  if ( score == 0 && minion.x > 0 && minion.x < 60 && minion.y > 0 && minion.y < 80 )
  { 
    minion.x = 0;
    minion.y = 500;
    state = 2;
  }
}


void endLevel()
{
  if ( points == 0 && minion.x > 0 && minion.x < 60 && minion.y > 0 && minion.y < 80 )
  { state = 0; }
}
