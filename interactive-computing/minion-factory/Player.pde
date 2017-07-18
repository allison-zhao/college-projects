class Player
{
  // location
  float x, y;

  // speed (constant)
  float speed = 4;

  // jump power
  float jumpPower = 0;

  Player(float _x, float _y)
  {
    // store position
    x = _x;
    y = _y;
  }  

  void move()
  {
    // move right
    if (keyD) 
    {
      // we need to check to see what tile is to our right (by 3 pixels or so)
      int tileCode = getTileCode(x + MINION_SIZE + 3, y + MINION_SIZE/2);

      // is this a solid tile?  if so, don't allow us to move!
      if ( !isSolid(tileCode) )
      {
        x += speed;
      }       

      currentMinion = minionRight;
    }

    // left
    if (keyA) 
    {       
      // we need to check to see what tile is to our left (by 3 pixels or so)
      int tileCode = getTileCode(x - 3, y + MINION_SIZE/2);

      // is this a solid tile?  if so, don't allow us to move!
      if ( !isSolid(tileCode) )
      {
        x -= speed;
      }

      currentMinion = minionLeft;
    }


    // jump
    if (keyW) { 

      // only jump if we are on solid ground (not falling, not jumping)
      if (jumpPower == 0)
      {
        // we need to check the tile ABOVE the minion - if it is solid, don't let him jump
        int tileCode = getTileCode(x + MINION_SIZE/2, y + 3);
        if ( !isSolid(tileCode))
        {
          jumpPower = 7.5;
        }
      }
    }

    // super jump
    if (keyS) { 

      // only jump if we are on solid ground (not falling, not jumping)
      if (jumpPower == 0)
      {
        // we need to check the tile ABOVE the minion - if it is solid, don't let him jump
        int tileCode = getTileCode(x + MINION_SIZE/2, y + 3);
        if ( !isSolid(tileCode))
        {
          jumpPower = 10;
        }
      }
    }

    // apply jump power (if we are actively jumping this will push us up into the sky)
    int tileCode = getTileCode(x + MINION_SIZE/2, y + 3);
    if ( isSolid(tileCode))
    {
      jumpPower = -2;
    }

    y -= jumpPower;


    // always pull down the character (gravity) if we aren't on solid land
    int downTileCode = getTileCode(x + MINION_SIZE/2, y + MINION_SIZE+3);

    // check bottom danger tiles
    tileCode = getTileCode(x + MINION_SIZE/2, y + MINION_SIZE + 3);
    if ( isDanger(tileCode) )
    {      
      // game over
      state = 4;
      currentMinion = minionRight;
      x = 0;
      y = 500;

      bgm.pause();
      over.pause();
      over.rewind();
      over.play();
    }


    if (isSolid( downTileCode))
    {
      jumpPower = 0;
    } else
    {
      jumpPower -= 0.4;
    }
  }

  // draw the player
  void display()
  {
    image(currentMinion, x, y, MINION_SIZE, MINION_SIZE);
  }
}

