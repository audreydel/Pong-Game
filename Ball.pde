class Ball {
  float x; 
  float y;
  float dx; 
  float dy;
  int radius;
  color ballColor = color(81,237,207);
  Ball() 
  {
    x = random(SCREENX/4, SCREENX/2);
    y = random(SCREENY/4, SCREENY/2);
    dx = random(3, 4);                                              // ball speed / direction 
    dy = random(3, 4);
    radius=15;
  }
  void move() 
  {
    x = x+dx; 
    y = y+dy;
  }
  
  void draw() 
  {
    fill(ballColor);
    ellipse(int(x), int(y), radius, radius);
  }
  
  void collide(Player tp) 
  {
    if (x-radius <=0 && dx < 0) dx=-dx;                           // collision of ball & side walls
    else if (x+radius>=SCREENX && dx > 0) dx=-dx;
    if (y+radius >= tp.ypos && y-radius<tp.ypos+PADDLEHEIGHT      // collision of ball & paddles 
        && x >=tp.xpos && x <= tp.xpos+PADDLEWIDTH) 
      {
      println("collided!");
      dy=-dy;
    }
  }

  void reset() 
  {

    if (y - radius >= SCREENY)                                  // ball goes down
    {
      thePlayer.lives--;
    }
    if (y + radius <= 0)                                        // ball goes up
    {
      computerPlayer.lives--;    
    }
    if (y - radius >= SCREENY || y + radius <= 0) 
    {
      x = random(SCREENX/4, SCREENX/2);                       // ball static at the middle of the screen 
      y = random(SCREENY/4, SCREENY/2);
      dx = 0; 
      dy = 0;
    }

    
    
  }
}
