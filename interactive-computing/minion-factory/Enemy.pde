class Enemy
{
  // location
  float enemyx, enemyy;

  // speed (constant)
  float enemyspeed = 1;


  Enemy(float ex, float ey)
  {
    // store position
    enemyx = ex;
    enemyy = ey;
  }  

  void move()
  {
    //if enemy is going right
    if (enemyd == 0)
    {
      // we need to check to see what tile is to our right (by 3 pixels or so)
      int tileCode = getTileCode(enemyx + MINION_SIZE + 3, enemyy + MINION_SIZE/2);

      // is this a solid tile?  if so, don't allow us to move!
      if ( !isSolid(tileCode) )
      {
        enemyx += enemyspeed;
        currentEnemy = enemyRight;
      } 

      //if tile to the right is solid, flip the enemy to opposite direction
      else if (isSolid(tileCode))
      {
        currentEnemy = enemyLeft;
        enemyd = 1;
      }
    }

    //if enemy is going left
    else if (enemyd == 1)
    {
      // we need to check to see what tile is to our right (by 3 pixels or so)
      int tileCode = getTileCode(enemyx - MINION_SIZE/2 - 3, enemyy + MINION_SIZE/2);

      if ( !isSolid(tileCode) )
      {
        enemyx -= enemyspeed;
        currentEnemy = enemyLeft;
      } 

      //if tile to the left is solid, flip the enemy to opposite direction
      else if (isSolid(tileCode))
      {
        currentEnemy = enemyRight;
        enemyd = 0;
      }
    }
  }

  // draw the player
  void display()
  {

    image(currentEnemy, enemyx, enemyy, MINION_SIZE, MINION_SIZE);
  }

  void checkHit()
  {
    float distance = dist(minion.x, minion.y, enemyx, enemyy);
    if (distance < 20 && state == 2)
    {
      state = 5;
      minion.x = 0;
      minion.y = 500;
      bgm.pause();
      over.pause();
      over.rewind();
      over.play();
    }
  }
}

