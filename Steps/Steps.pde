import processing.sound.*;
SoundFile file;
int t=0;
int dt = 1000;
int posX = 0;
int posY = 0;
float phi= 0;
PImage ls,rs;
void setup()
{
  fullScreen(P3D,2);
  ls = loadImage("Left_Step.png");
  rs = loadImage("Right_Step.png");
  file = new SoundFile(this, "steps.mp3");
  posX = -height/2;
}

void draw()
{
  background(0);
  translate(width/2,height/2);
  rotate(phi);
  if(t%2==0)
  {
  image(ls,-60,128-posX);
  }
  else
  {
  image(rs,60,128-posX);
  }
  file.play();
  posX+=200;
  delay(dt);
  if(posX > width/2)
  {
    posX = -width/2;
    dt=(int)random(100,1500);
    phi = random(0,2*PI);
  }
  t++;
}
