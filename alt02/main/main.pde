int cpx=800, cpy=350;
int cnx=300, cny=300;
int qp=120, qn=-120;
float[] F={0,0};
float K=8.99;
float x, y, dx, dy, dxn, dyn;
float d1, E1, E1x, E1y, d2, E2, E2x, E2y;
float EEx, EEy, EE, deltax, deltay;
float Dx,Dy,DD,F1x,F1y,FT;
float ll = 0.5;
ArrayList <Particle> particles = new ArrayList <Particle> ();
float x2,y2;


void setup() {
  size(1000, 700, P2D);
  smooth(16);
  background(#1275F7);
  strokeWeight(0.75);

  
  while (particles.size () < 20000) { particles.add(new Particle()); }

}
float[] Force(){
    Dx=(cpx-cnx);
    Dy=(cpy-cny);
    DD=sqrt(Dy*Dy+Dx*Dx);
    FT=K*qp*qn/(DD*DD);
    F1x=FT*Dx/DD;
    F1y=FT*Dy/DD;
    F[0]=F1x;
    F[1]=F1y;
    return F;

}

void draw() {
  
  //Drawing the fluid dynamics
  if (frameCount % 5 == 0) {
    noStroke();
    fill(#1275F7, 15);
    rect(0, 0, width, height);
  }
  stroke(#1865A8);
  for (Particle p : particles) {
    p.run();
  }
  float[] F=Force();
  x2=(F[0]*200);
  y2=(F[1]*200);
   println(x2,y2);
   line(cpx, cpy, cpx+x2,cpy+y2);
  pushMatrix();
  translate(cpx+x2,cpy+y2);
  float a = atan2(-x2, y2);
  rotate(a);
  line(0, 0, -10, -10);
  line(0, 0, 10, -10);
  popMatrix();
  
  
  
  
  //Positive charge - red ball
   for (int i = 0; i < 100; i+=5)
  {
    fill(#FF0000, i/10);
    stroke(#000000);
      noStroke();
    ellipse(cpx, cpy, 100 - i, 100 - i);
  }
  
  
  //Negative charge - blue ball
   for (int j = 0; j < 100; j+=5)
  {
    fill(#0070FF, j/3);
    stroke(#000000);
      noStroke();
    ellipse(cnx, cny, 100 - j, 100 - j);
  }
 
}