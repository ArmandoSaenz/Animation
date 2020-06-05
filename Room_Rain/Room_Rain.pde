float x[]= new float[200], y[] = new float[200];
float b=tan(30*PI/180);
float c=10;
void setup()
{
  fullScreen(P3D,2);
  rectMode(CENTER);
  for(int i = 0; i<x.length;i++)
  {
    x[i] = (int)random(-200,200);
    y[i] = (int)random(-200,200);;
  }
}

void draw()
{
  background(0);
  translate(width/3,height/2);
  rotateX(PI);
  //The window is rendered
  fill(255);
  square(0,0,400);
  fill(0);
  square(100,100,175);
  square(100,-100,175);
  square(-100,100,175);
  square(-100,-100,175);
  //Hill
  stroke(255);
  for(int i = 0; i<400;i++)
  {
    line(i-200,-30*cos(PI/250*i)-120,i-199,-30*cos(PI/250*(i+1))-120);
  }
  //Rain
  for(int i = 0; i<x.length; i++)
  {
    line(sat(x[i]+b*c,200,-200),sat(y[i]-b*c,200,-200),sat(x[i]-b*c,200,-200),sat(y[i]+b*c,200,-200));
      x[i] += b*10;
      y[i] -= b*10;
    if(y[i]<-200)
    {
      x[i] = random(-600,200);
      y[i] = 200;
      println(x[i]);
    }
  }
  //The door is rendered
  translate(width/3,0);
  fill(255);
  rect(0,0,25,height);
  ellipse(width/10,-height/8,50,50);
}

int sat(float Value, int max, int min)
{
  if(Value > max)
  {
    Value = max;
  }
  if(Value < min)
  {
    Value = min;
  }
  return (int)Value;
}
