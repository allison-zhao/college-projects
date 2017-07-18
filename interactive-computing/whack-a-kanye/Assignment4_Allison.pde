import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

//Allison Zhao, Assignment 4, WHACK A KANYE WEST!

/* @pjs preload="kanyemole.png","trophyup.png","trophydown.png", "beyonce.png","tswift.png", "beeback.png";*/

// main audio controller - we need one of these variables
Minim minim;

// audio files - we need one of these for each sound we want to play
AudioPlayer player;

Kanye mole1;
Kanye mole3;
Kanye mole5;
Kanye mole7;
Kanye mole9;

Mouse mouse;

Beyonce mole2;
Beyonce mole4;

Taylor mole6;
Taylor mole8;

//keep a score system
int score = 0;

PImage bg;

void setup()
{
  //size of canvas
  size(500, 500);
  bg = loadImage("beeback.png");

  // set up Minim  
  minim = new Minim(this);

  // load in our audio file
  player = minim.loadFile("song.mp3");

  //import the class we created
  mole1 = new Kanye(100, 100);
  mole2 = new Beyonce(250, 100);
  mole3 = new Kanye(400, 100);
  mole4 = new Beyonce(100, 250);
  mole5 = new Kanye(250, 250);
  mole6 = new Taylor(400, 250);
  mole7 = new Kanye(100, 400);
  mole8 = new Taylor(250, 400);
  mole9 = new Kanye(400, 400);
  mouse = new Mouse(mouseX, mouseY,50);


}

void draw()
{
  
  background(0);
  imageMode(CENTER);
  image(bg, 250, 250, width, height);
  fill(255);
  textSize(20);
  text("Score: " + score, 20, 20);
  
  //set timer
  float time = millis();
  text("Time played: " + time, 20, 50);
  
  player.play();
    
  //display
  mole1.display();
  mole2.display();
  mole3.display();
  mole4.display();
  mole5.display();
  mole6.display();
  mole7.display();
  mole8.display();
  mole9.display();

  //display mouse
  mouse.display();
  
  //check hits
  mole1.checkHit();
  mole2.checkHit();
  mole3.checkHit();
  mole4.checkHit();
  mole5.checkHit();
  mole6.checkHit();
  mole7.checkHit();
  mole8.checkHit();
  mole9.checkHit();
  
}


