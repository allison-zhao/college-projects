import processing.video.*;

// import the Minim sound library
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

// MotionDetector - this handles everything!
MotionDetector theDetector;

// Our game state
// start = 0
// how to play = 1
// choose album = 2
// easy mode = 3
// normal mode = 4
// hard mode = 5
// game over = 6

Movie movie;
Movie countdown;

int state = -1;

// minim controller
Minim minim;

// sound loop
AudioPlayer bgm;
AudioPlayer easybgm;
AudioPlayer normalbgm;
AudioPlayer hardbgm;
AudioPlayer song;
BeatDetect beat;
int counter = 0;
PImage uArrowG, dArrowG, lArrowG, rArrowG, uArrowC, dArrowC, lArrowC, rArrowC;
PImage uArrowS, dArrowS, lArrowS, rArrowS, sparkle; 
float xPicker;
float eRadius;
float xkPos = 1000;
float ykPos  = 2000;
int aCount = 5;
int point = 0;
int miss = 0;
float arrowControl;
ArrayList<Arrow> theArrows = new ArrayList<Arrow>();
float xChoice = 250;
float xPressed; 

int time;
int playtime = 0;
int wait = 28000;
int pauseCounter = 0;

// live video object
Capture video;

PImage titleScreen;
PImage howtoplay;
PImage choose; 
PImage previousFrame;
PImage easy;
PImage normal;
PImage hard;
PFont font;
PImage goldenState;
PImage gameOver;

// for background removal
PImage theBackground;
PImage finImage;
PImage bg1;

ArrayList <Golden> theGoldenState;

// final image - this is the image we will display to the screen
PImage finalImage;
float threshold = 50;
MotionDetection motionDetection;

void setup()
{
  size(960, 720);

  //store the current time
  time = millis();
  
  movie = new Movie(this, "opening.mp4");
  countdown = new Movie(this, "countdown.mp4");
  frameRate(30);

  theDetector = new MotionDetector(this, 960, 720, true);

  font = loadFont("BankGothic-Medium-48.vlw");
  titleScreen = loadImage("titleScreen.png");
  howtoplay = loadImage("howtoplay.png");
  goldenState = loadImage("goldenState.png");
  gameOver = loadImage("gameOver.png");

  // create our bee object holder
  theGoldenState = new ArrayList<Golden>();

  motionDetection = new MotionDetection();
  choose = loadImage("state2.jpg");
  easy = loadImage("easy.png");
  normal = loadImage("normal.png");
  hard = loadImage("hard.png");
  bg1 = loadImage("bg1.png");

  minim = new Minim(this);
  easybgm = minim.loadFile("easy.mp3"); 
  normalbgm = minim.loadFile("normal.mp3");
  hardbgm = minim.loadFile("hard.mp3");
  bgm = minim.loadFile("normal.mp3"); 
  bgm.loop();


  // a beat detection object song SOUND_ENERGY mode with a sensitivity of 10 milliseconds
  beat = new BeatDetect();
  lArrowC = loadImage("lArrowC.png");
  rArrowC = loadImage("rArrowC.png");
  uArrowC = loadImage("uArrowC.png");
  dArrowC = loadImage("dArrowC.png");
  sparkle = loadImage("sparkle.png");
  lArrowG = loadImage("lArrowG.png");
  rArrowG = loadImage("rArrowG.png");
  uArrowG = loadImage("uArrowG.png");
  dArrowG = loadImage("dArrowG.png");
  eRadius = 20;
  xPicker = 0 + 25;

  video = new Capture(this, 960, 720);
  video.start();
  previousFrame = new PImage(960, 720, ARGB);
  finalImage = new PImage(960, 720, ARGB);

  // removal
  theBackground = new PImage(960, 720, ARGB);
  finImage = new PImage(960, 720, ARGB);
}

void draw()
{
  // start movie
  startmovie();

  // start screen
  state0();

  // how to play
  state1();

  // choose albums
  state2();

  //easy mode
  state3();

  //normal mode
  state4();

  //hard mode
  state5();

  //game Over
  state6();
}

//start screen
void state0()
{
  if (state == 0)
  { 
    imageMode(CENTER);
    image(titleScreen, width/2, height/2);

    //draw buttons
    rectMode(CENTER);
    fill(255, 255, 255, 150);
    rect(480, 250, 200, 50, 100);
    fill(200, 0, 0);
    textFont(font, 30);
    text("Play", 445, 255);

    rectMode(CENTER);
    fill(255, 255, 255, 150);
    rect(480, 350, 250, 50, 100);
    fill(200, 0, 0);
    textFont(font, 30);
    text("How to Play", 380, 355);

    if (mouseX > 380 &&  mouseX < 580 && mouseY > 225 && mouseY < 275)
    {
      fill(0, 0, 0, 200);
      rect(480, 250, 200, 50, 100);
      fill(255, 255, 0);
      textFont(font, 30);
      text("Play", 445, 255);

      if (mousePressed) 
      { 
        state = 2;
      }
    } else if  (mouseX > 365 &&  mouseX < 605 && mouseY > 325 && mouseY < 375)
    {
      fill(0, 0, 0, 200);
      rect(480, 350, 250, 50, 100);
      fill(255, 255, 0);
      textFont(font, 30);
      text("How to Play", 380, 355);

      if (mousePressed) 
      { 
        state = 1;
      }
    }
  }
}

//How to play
void state1()
{
  if (state == 1)
  {
    imageMode(CENTER);
    image(howtoplay, width/2, height/2);

    //draw button to go back to main page
    rectMode(CENTER);
    fill(128, 0, 0);
    rect(180, 620, 100, 50, 100);
    fill(255);
    textSize(25);
    text("Back", 150, 625);

    //if clicked
    if (mouseX > 130 &&  mouseX < 230 && mouseY > 595 && mouseY < 645) 
    {
      fill(128, 0, 0);
      rect(180, 620, 100, 50, 100);
      fill(255, 255, 0);
      textSize(25);
      text("Back", 150, 625);

      if (mousePressed)
      { 
        state = 0;
      }
    }
  }
}


//choose mode
void state2()
{ 
  if (state == 2)
  {
    bgm.pause();
    bgm.rewind();

    imageMode(CENTER);  
    image(choose, width/2, height/2);
    image(easy, 180, 350, 250, 250);    
    image(normal, 480, 200, 250, 250);
    image(hard, 780, 350, 250, 250);
    fill(255, 255, 0);
    textFont(font, 30);
    text("EASY", 140, 200);
    text("NORMAL", 420, 50);
    text("HARD", 730, 200);
    motionDetection.detect();
  }
}

void state3()
{
  if (state == 3)
  {        
    if (pauseCounter > 0)
    {
      song.pause();
      countdown.play();

      if (countdown.available())
      {
        // read the current frame
        countdown.read();
      }

      image(countdown, width/2, height/2);
      pauseCounter--;
      
    } else {
      playtime ++;
      println(playtime);
      
      song.play();
      beginset();
      removal();
      arrowControl = random(0, 30);
      play();

      if (point > 30)
      {
        // golden state
        gold();
      } 
      else if (point < -1 || playtime == 7050)
      {
        //game over
        state = 6;
      }
    }
  }
}

void state4()
{
  if (state == 4)
  {    
    if (pauseCounter > 0)
    {
      song.pause();
      countdown.play();

      if (countdown.available())
      {
        // read the current frame
        countdown.read();
      }

      image(countdown, width/2, height/2);
      pauseCounter--;
      
    } else {
      song.play();
      beginset();
      removal();
      arrowControl = random(0, 20);
      play();

      if (point > 30)
      {
        // golden state
        gold();
      } else if (point < -1)
      {
        //game over
        state = 6;
      }
    }
  }
}

void state5()
{
  if (state==5)
  {    
    if (pauseCounter > 0)
    {
      song.pause();
      countdown.play();

      if (countdown.available())
      {
        // read the current frame
        countdown.read();
      }

      image(countdown, width/2, height/2);
      pauseCounter--;
      
    } else {
      song.play();
      beginset();
      removal();
      arrowControl = random(0, 10);
      play();

      if (point > 30)
      {
        // golden state
        gold();
      } else if (point < -1)
      {
        //game over
        state = 6;
      }
    }
  }
}

void state6()
{
  if (state == 6)
  {
    image(gameOver, 0, 0);
    noStroke();

    // result
    textSize(50);
    fill(255, 255, 0);
    text("Score: " + point, 350, 150);
    text("Missed: " + miss, 350, 200);

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
        point = 0;
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
      }
    }
  }
}


void keyPressed() 
{
  if (key == ' ')
  {
    theBackground.copy(video, 0, 0, 960, 720, 0, 0, 960, 720);
  }

  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      xkPos = 50;
      ykPos = 100;
    }

    if (keyCode == UP)
    {
      xkPos = width*.25+50;
      ykPos = 100;
    }
    if (keyCode == DOWN)
    {
      xkPos = width*.5+50;
      ykPos = 100;
    }
    if (keyCode == RIGHT)
    {
      xkPos = width*.75+50;
      ykPos = 100;
    }
  }
}


void keyReleased() 
{
  xkPos = 1000;
  ykPos = 2000;
}


void play()
{
  beat.detect(song.mix);
  xPicker =random(0, 4);

  if (xPicker >= 0 & xPicker < 1)
  {
    xChoice = 50;
  } else if (xPicker >= 1 & xPicker < 2) 
  {
    xChoice = width * .25 + 50;
  } else if (xPicker >= 2 & xPicker < 3) 
  {
    xChoice = width * .5 + 50;
  } else 
  {
    xChoice = width * .75 + 50;
  }


  float a = map(eRadius, 20, 80, 60, 255);
  if ( beat.isOnset() ) eRadius = 80;
  eRadius *= 0.95;
  if (eRadius > 70 && arrowControl < 5) 
  {
    Arrow temp = new Arrow(xChoice, random(height, 1000));
    theArrows.add(temp);
  }


  for (int i = 0; i < theArrows.size (); i++) 
  {
    Arrow temp = theArrows.get(i);
    temp.display();
    boolean offTest = temp.offScreen();
    if (offTest == true) 
    {
      theArrows.remove(temp);
    }
    boolean hitTest = temp.hitCheck(xkPos, ykPos);
    if (hitTest == true) 
    {
      point += 2;
      image(sparkle, 50, 100, 100, 100);
      image(sparkle, width*.25 + 50, 100, 100, 100);
      image(sparkle, width*.5 + 50, 100, 100, 100);
      image(sparkle, width*.75 + 50, 100, 100, 100);

      if (xkPos == 50) {
        image(lArrowG, 50, 100, 100, 100);
      } else if (xkPos == width*.25 + 50) {
        image(uArrowG, width*.25 + 50, 100, 100, 100);
      } else if (xkPos == width*.5 + 50) {
        image(dArrowG, width*.5 + 50, 100, 100, 100);
      } else {
        image(rArrowG, width*.75 + 50, 100, 100, 100);
      }

      hitTest = false;
      theArrows.remove(temp);
    }
  }

  noStroke();
  fill(128, 0, 0);
  rect(470, 40, 300, 50, 70);

  fill(255, 255, 0);
  textFont(font, 20);
  text("Number of hits: " + point, 370, 45) ;
  image(lArrowC, 50, 100, 100, 100);
  image(uArrowC, width*.25 + 50, 100, 100, 100);
  image(dArrowC, width*.5 + 50, 100, 100, 100);
  image(rArrowC, width*.75 + 50, 100, 100, 100);
}


void gold()
{
  // run the motion detector
  theDetector.run();

  // should we create a new bee?  low chance to do so, and we only want about 10 on the screen at a time
  if (theGoldenState.size() < 5 && random(1) > 0.99)
  {
    // create a bee
    Golden temp = new Golden();

    // add it to our list
    theGoldenState.add(temp);
  }

  // move all of our bees
  for (int i = 0; i < theGoldenState.size (); i++)
  {
    // pull out our bee
    Golden temp = theGoldenState.get(i);

    // did the user touch the bouncer?
    boolean test = theDetector.checkHit(temp.xPos, temp.yPos, temp.myWidth, temp.myHeight);

    // move the bouncer, telling it if it was hit
    temp.move(test);

    // is it dead?  if so, remove it!
    if (temp.dead)
    {
      theGoldenState.remove(temp);
      i--;
    }
  }
}


void startmovie()
{

  if (state == -1)
  {
    movie.play();

    if (movie.available())
    {
      // read the current frame
      movie.read();
    }
    if (millis() - time >= wait)
    {
      state = 0;
    }
  }

  // draw the movie frame to the screen
  image(movie, -160, 0);
}


void beginset()
{      
  if (video.available())
  {
    video.read();

    // mirror the video input
    mirrorImage(video);
  }
}


void removal()
{

  background(0);

  // draw background video here

  // expose the pixels in our video (this lets us access the
  // pixels array via video.pixels[x]
  video.loadPixels();

  // expose the pixels in our background image
  theBackground.loadPixels();

  // expose the pixels in our final image
  finImage.loadPixels();

  bg1.loadPixels();

  float threshold1 = map(mouseX, 0, width, 0, 255);

  // every frame we should compare the current video frame
  // with our comparison image
  for (int x = 0; x < video.width; x++)
  {
    for (int y = 0; y < video.height; y++)
    {
      // construct a 1D location out of our x & y positions
      int location = x + y*video.width;

      // examine the pixel in the background image
      float bR = red(theBackground.pixels[location]);
      float bG = green(theBackground.pixels[location]);
      float bB = blue(theBackground.pixels[location]);

      // examine the pixel in the video stream
      float vR = red(video.pixels[location]);
      float vG = green(video.pixels[location]);
      float vB = blue(video.pixels[location]);

      // how different are they?
      float difference = dist(bR, bG, bB, vR, vG, vB);


      // if the difference is significant then we should paint
      // the video stream to our final image
      if (difference > threshold1)
      {
        finImage.pixels[location] = video.pixels[location];
      }

      // otherwise we will use a black color
      else
      {
        finImage.pixels[location] = bg1.pixels[location];
        // finImage.pixels[location] = color(0,0);
      }
    }
  }

  // update the pixels on the final image
  finImage.updatePixels();

  // draw the final image to the screen
  imageMode(CORNER);
  image(finImage, 0, 0);
}


void mirrorImage(PImage imageToMirror)
{
  imageToMirror.loadPixels();
  for (int x = 0; x < imageToMirror.width/2; x++)
  {
    // compute opposite x position
    int oppositeX = imageToMirror.width-x-1;

    for (int y = 0; y < imageToMirror.height; y++)
    {
      // determine our location
      int location1 = x         + y*imageToMirror.width;
      int location2 = oppositeX + y*imageToMirror.width;

      // swap!
      color temp = imageToMirror.pixels[location1];
      imageToMirror.pixels[location1] = imageToMirror.pixels[location2];
      imageToMirror.pixels[location2] = temp;
    }
  }
  imageToMirror.updatePixels();
}

