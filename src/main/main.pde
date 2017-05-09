int cpx=500, cpy=350;
int qp=1000, qn=1000;
float x, y, dx, dy, dxn, dyn;
float d1, E1, E1x, E1y, d2, E2, E2x, E2y;
float EEx, EEy, EE, deltax, deltay;
float ll = 0.5;
boolean bStroke = false;
ArrayList <Particle> particles = new ArrayList <Particle> ();
electricCharge e = new electricCharge(10, 300, 5, 0.5, false);

void setup()
{
  smooth();
  background(0);
  size(640, 480, P2D);
  
  noCursor();
  
  PShape ellipse = createShape(ELLIPSE,mouseX,mouseY, 50, 50); 
}

void draw()
{
  background(0);
  noStroke();
  for (int i = 0; i < 300; i+=5)
  {
    fill(#FF0000, i/10);
    strokeWeight(0.75);
    stroke(#000000);
    if ( bStroke == false)
    {
      noStroke();
    }
    ellipse(mouseX, mouseY, 300 - i, 300 - i);
  }
}