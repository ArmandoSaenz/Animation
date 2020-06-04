float phi=0;
float vphi = 0;
float x[] = new float[100],y[] = new float[100];
float t=0;
int c=0;
int d = 0;
void setup()
{
  size(300,300,P2D);
  for(int i = 0; i<x.length;i++)
  {
    x[i] = 0;
    y[i] = 0;
  }
}

void draw()
{
  background(0);
  t+=0.05;
  phi = PI*t/5.0; 
  vphi = PI*t/53.0; 
  translate(width/2,height/2);
  x[c] = (width/2 - 50)*sin(vphi)*cos(phi);
  y[c] = (height/2 - 50)*cos(vphi)*sin(phi);
  fill(255);
  stroke(255);
  ellipse(x[c],y[c],50,50);
  for(int i =1;i<c;i++)
  {
    ellipse(x[i-1],y[i-1],i/2,i/2);
  }
  if(c<x.length-1)
  {
    c++;
  }
  else
  {
    for(int i=1;i<=c;i++)
    {
      x[i-1] = x[i];
      y[i-1] = y[i];
    }
  }
  saveFrame("img" + str(d)+"0.jpg");
}
