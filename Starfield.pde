particle[] stars;
void setup()
{
  size(800,700);
  stars = new particle[400];
  stars[0] = new bigpart();
  stars[1] = new bigpart();
  stars[2] = new oddpart();
  for(int i = 3; i < stars.length; i++)
  {
    stars[i] = new normParticle();
  }
}

void draw()
{
  background(0);
  for(int i = 1; i < stars.length; i++)
  {
    stars[i].move();
    stars[i].show();
  }
}

class normParticle implements particle
{
  double x,y,speed,direction,size,lx,ly;
  
  normParticle()
  {
    x = 400;
    y = 350;
    speed = Math.random()*10 + 4.0;
    direction = (Math.random() * (2*Math.PI));
  }
  
  public void move()
  {
    x = (Math.cos(direction) * speed) + x;
    y = (Math.sin(direction) * speed) + y;
    if( x > 800 || x < 0 || y > 700 || y<0)
    {
      x = 400;
      y = 350;
      size = 70;
}

  }
  
  public void show()
  {
    fill(255,255,255);
    size = (dist(400, 350, (float)x, (float)y)) / 50;
    ellipse((float)x, (float)y, (float)size, (float)size);

  }
}

class bigpart extends normParticle
{
  public void show()
  {
    fill (250,10,250);
    ellipse((float)x, (float)y, ((float) size) + 60, ((float)size) + 60);
  }
    public void move()
  {
    x = (Math.cos(direction) * speed) + x;
    y = (Math.sin(direction) * speed) + y;
    if( x > 1500 || y > 1500 || y< -500 || x < -500)
    {
      x = 400;
      y = 350;
      size = 70;
}
}}

class oddpart implements particle
{
  double x,y;
  
  oddpart()
  {
    x = 400;
    y = 350;
  }
  public void show()
  {
    fill(250,10,250);
    stroke(250,10,250);
    strokeWeight(10);
    ellipse((float)x,(float)y, 50,50);}
   
   public void move()
   {
     x = x + (int)((Math.random()*20)-10);
     y = y + (int)((Math.random()*20)-10);
   }}

interface particle
{
  public void move();
  public void show();

}
