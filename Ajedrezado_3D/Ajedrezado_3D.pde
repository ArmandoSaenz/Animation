float maxV = 300;
float minV = -300;
float m1, m2;
float VT;
int n = 40;
int step = 0;
float[] x1,y1,x2,y2;
boolean start = false;
void setup()
{
  //DEFINIENDO TAMAÑO DE LA VENTANA
  size(640,640,P2D);
  //Valor total
  VT = maxV - minV;
  //DEFINIENDO PENDIENTES  
  m1 = 2.0*VT/n;
  m2 = -m1;
  //Estableciendo los puntos
  x1 = new float[n+1];
  y1 = new float[n+1];
  x2 = new float[n+1];
  y2 = new float[n+1];
  for(int i = 0; i<=n; i++)
  {
    x1[i] = maxV - g((float)i);
    y1[i] = 0;
    x2[i] = 0;
    y2[i] = h((float)i);
  }
  stroke(0,255,0); //Seleccionando color de linea
  strokeWeight(2); //Ancho de linea
  line(0, height/2, 0, -height/2); //Dibujando Eje Y
  line(width/2, 0, -width/2, 0); //Dibujando Eje X
  println("Pendiente 1: " + m1);
  println("Pendiente 2: " + m2);
  println("Espacio total: " + VT);
  ClearScreen();
}

void draw()
{
  if(step>n || !start)
  {
    return;
  }
  Origin();
  line(x1[step],y1[step],x2[step],y2[step]);
  print("Número de paso: " + step + " ");
  println(" [" + x1[step] + ", " + y1[step] + ", " + x2[step] + ", " +  y2[step] +"]");
  step++;
  delay(500);
}

void ClearScreen()
{
  background(0); //Borrando la pantalla
}

void Origin()
{
   translate(width/2, height/2);//Ubicando origen en el centro de la pantalla  
}
float h(float x)
{
  if( x >= 0 && x <= n/4.0 )
    return m1*x;
  if( x > n/4.0 && x <= 3.0/4.0 * n )
    return m2*x-m2*n/2;
  if( x >= 3.0/4.0*n && x<= n )
    return m1*x-m1*n;
  return 0;
}

float g(float x)
{
  if(x>=0 && x<=n/2.0)
    return m1*x;
  if(x>n/2.0 && x<=n)
    return m2*x-m2*n;
  return 0;
}

void keyPressed()
{
  start = !start;
  if(start)
  {
    ClearScreen();
    Origin();
    step = 0;
  }
}
