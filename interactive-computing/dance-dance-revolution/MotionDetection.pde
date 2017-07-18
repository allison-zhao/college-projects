class MotionDetection {

  int x = 480;
  int y = 200;

  MotionDetection () {
  }

  void detect()
  {
    if (video.available())
    {
      // before we read the video we should copy the
      // video into our previousFrame image object
      previousFrame.copy(video, 0, 0, 960, 720, 0, 0, 960, 720);

      // now read in a fresh frame of video
      video.read();

      // mirror the video input
      mirrorImage(video);
    }

    // now we can compare the difference between the current frame
    // of video with the previous frame

    // for this program we are going to default the finalImage to contain
    // the live video image (we can adjust it in the loop below)
    finalImage.copy(video, 0, 0, 960, 720, 0, 0, 960, 720);

    // expose the pixels on all of our image objects
    video.loadPixels();
    previousFrame.loadPixels();
    finalImage.loadPixels();

    // examine the left side of the screen
    int leftNumChanged = 0;
    int leftNumPixels = 0;

    for (int x = 0; x < 100; x++)
    {
      for (int y = 0; y < video.height; y++)
      {
        // compute a 1D location
        int location = x + y*video.width;

        // update # of pixels visited
        leftNumPixels++;

        // grab the colors from the video
        float vR = red(video.pixels[location]);
        float vG = green(video.pixels[location]);
        float vB = blue(video.pixels[location]);

        // grab the colors from the previous frame
        float pR = red(previousFrame.pixels[location]);
        float pG = green(previousFrame.pixels[location]);
        float pB = blue(previousFrame.pixels[location]);

        // how different are these colors?
        if (dist(vR, vG, vB, pR, pG, pB) > threshold)
        {
          // draw a green pixel here
          finalImage.pixels[location] = color(0, 255, 0);

          // update the # of changed pixels
          leftNumChanged++;
        } else
        {
          // use the video pixel here
          finalImage.pixels[location] = video.pixels[location];
        }
      }
    }


    // examine the right side of the screen
    int rightNumChanged = 0;
    int rightNumPixels = 0;

    for (int x = 860; x < video.width; x++)
    {
      for (int y = 0; y < video.height; y++)
      {
        // compute a 1D location
        int location = x + y*video.width;

        // update # of pixels visited
        rightNumPixels++;

        // grab the colors from the video
        float vR = red(video.pixels[location]);
        float vG = green(video.pixels[location]);
        float vB = blue(video.pixels[location]);

        // grab the colors from the previous frame
        float pR = red(previousFrame.pixels[location]);
        float pG = green(previousFrame.pixels[location]);
        float pB = blue(previousFrame.pixels[location]);

        // how different are these colors?
        if (dist(vR, vG, vB, pR, pG, pB) > threshold)
        {
          // draw a green pixel here
          finalImage.pixels[location] = color(0, 255, 0);

          // update the # of changed pixels
          rightNumChanged++;
        } else
        {
          // use the video pixel here
          finalImage.pixels[location] = video.pixels[location];
        }
      }
    }

    int upNumChanged = 0;
    int upNumPixels = 0;

    for (int x = 0; x < video.width; x++)
    {
      for (int y = 0; y < 150; y++)
      {
        // compute a 1D location
        int location = x + y*video.width;

        // update # of pixels visited
        upNumPixels++;

        // grab the colors from the video
        float vR = red(video.pixels[location]);
        float vG = green(video.pixels[location]);
        float vB = blue(video.pixels[location]);

        // grab the colors from the previous frame
        float pR = red(previousFrame.pixels[location]);
        float pG = green(previousFrame.pixels[location]);
        float pB = blue(previousFrame.pixels[location]);

        // how different are these colors?
        if (dist(vR, vG, vB, pR, pG, pB) > threshold)
        {
          // draw a green pixel here
          finalImage.pixels[location] = color(0, 255, 0);

          // update the # of changed pixels
          upNumChanged++;
        } else
        {
          // use the video pixel here
          finalImage.pixels[location] = video.pixels[location];
        }
      }
    }

    // now see how many pixels have changed on the left side of the screen
    float leftAverage = leftNumChanged/float(leftNumPixels);

    if (leftAverage > 0.15)
    {
      // easy mode
      x = 180;
      y = 350;
      hardbgm.pause();
      hardbgm.rewind();
      normalbgm.pause();
      normalbgm.rewind();
      easybgm.play();
    }

    if (x > 55 && x < 305)
    {
      if (keyPressed && key == CODED)
      {
        if (keyCode == DOWN)
        { 
          state = 3;
          song = easybgm;
          pauseCounter = 250;
        }
      }
    }


    float rightAverage = rightNumChanged/float(rightNumPixels);

    if (rightAverage > 0.15)
    {
      // hard mode
      x = 780;
      y = 350;
      normalbgm.pause();
      normalbgm.rewind();
      easybgm.pause();
      easybgm.rewind();
      hardbgm.play();
    }

    if (x > 655 && x < 905)
    {
      if (keyPressed && key == CODED)
      {
        if (keyCode == DOWN)
        { 
          state = 5;
          song = hardbgm;
          pauseCounter = 250;
        }
      }
    }

    float upAverage = upNumChanged/float(upNumPixels);

    if (upAverage > 0.15)
    {
      // normal mode
      x = 480;
      y = 200;
      hardbgm.pause();
      hardbgm.rewind();
      easybgm.pause();
      easybgm.rewind();
      normalbgm.play();
    }

    if (x > 355 && x < 605)
    {
      if (keyPressed && key == CODED)
      {
        if (keyCode == DOWN)
        { 
          state = 4;
          song = normalbgm;
          pauseCounter = 250;
        }
      }
    }

    noFill();
    stroke(0, 0, 255);
    strokeWeight(10);
    rectMode(CENTER);
    rect(x, y, 250, 250);
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
}

