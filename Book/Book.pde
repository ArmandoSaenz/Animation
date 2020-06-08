int t = 0;
int dt=30;
void setup()
{
  fullScreen(P3D,2);
}
int d=0;
void draw()
{
  background(0);
  translate(width/2, height/2);
  rotateX(PI/3);
  rotateZ(0.1);
  //rotateY(0.1);
  stroke(0);
  fill(150);
  box(500,300,10);
  line(0,-150,5,0,150,5);
  fill(255);
  translate(0,0,5);
  for(d = 5;d<=24;d+=3)
  {
    beginShape();
    for(int i = 0; i<=230;i++)
    {
      vertex(i, 140, -d/(pow(115.0,2.0))*i*i + 2*d/115.0 * i);
    }
    vertex(230,-140,0);
    for(int i = 230; i>=0;i--)
    {
      vertex(i, -140, -d/(pow(115.0,2.0))*i*i + 2*d/115.0 * i);
    }
    endShape(CLOSE);
  }
  d = 24;
  for(int j = -100 ; j<120; j+=10)
  {
  for(int i = 30; i<=200;i++)
    {
      line(i, j, -d/(pow(115.0,2.0))*i*i + 2*d/115.0 * i ,i+1, j, -d/(pow(115.0,2.0))*(i+1)*(i+1) + 2*d/115.0 * (i+1));
    }
  }

  
  for(d = 5;d<=25;d+=3)
  {
    beginShape();
    for(int i = 0; i<=230;i++)
    {
      vertex(-i, 140, -d/(pow(115.0,2.0))*i*i + 2*d/115.0 * i);
    }
    vertex(-230,-140,0);
    for(int i = 230; i>=0;i--)
    {
      vertex(-i, -140, -d/(pow(115.0,2.0))*i*i + 2*d/115.0 * i);
    }
    endShape(CLOSE);
  }
   rotateY(-PI/3000*t);
   d=(int)(12.5*cos(PI/1500*t)+12.5);
   beginShape();
   if(t<1500)
   {
    for(int i = 0; i<=230;i++)
    {
      vertex(i, 140, -(d-5.0)/(pow(115.0,2.0))*i*i + 2*(d-5.0)/115.0 * i);
    }
    vertex(230,-140,5);
    for(int i = 230; i>=0;i--)
    {
      vertex(i, -140, -(d-5.0)/(2*pow(115.0,2.0))*i*i + (d-5.0)/115.0 * i);
    }
    endShape(CLOSE);
  for(int j = -100 ; j<120; j+=10)
  {
  for(int i = 30; i<=200;i++)
    {
      line(i, j, -d/(pow(115.0,2.0))*i*i + 2*d/115.0 * i ,i+1, j, -d/(pow(115.0,2.0))*(i+1)*(i+1) + 2*d/115.0 * (i+1));
    }
  }   }
   else
   {
    beginShape();
    for(int i = 0; i<=230;i++)
    {
      vertex(i, 140, d/(pow(115.0,2.0))*i*i - 2*d/115.0 * i);
    }
    vertex(230,-140,0);
    for(int i = 230; i>=0;i--)
    {
      vertex(i, -140, d/(pow(115.0,2.0))*i*i - 2*d/115.0 * i);
    }
    endShape(CLOSE);   
   }

  t+=30;
  t=t%3001;
  delay(30);
  println((-2.0/3000.0*t+1.0));
}
