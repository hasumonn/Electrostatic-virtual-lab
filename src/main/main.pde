int cpx=800, cpy=350; // location of postive charge
int cnx=300, cny=300; // location of negetive charge
int qp=120, qn=-120;  // Quantities for +/- charges
float[] F={0,0};      // Forces in different axes Fx and Fy 
float K=8.99;         // Constant
float x, y, dx, dy, dxn, dyn;
float d1, E1, E1x, E1y, d2, E2, E2x, E2y; // Electric field for each charges
float EEx, EEy, EE, deltax, deltay; //Total electric field
float Dx,Dy,DD,F1x,F1y,FT; //Distances of charges and Forces between two charges
float ll = 0.5;
ArrayList <Particle> particles = new ArrayList <Particle> (); 
float x2,y2;

// ******************* Field line properties ***************************
void setup() { 
  size(1000, 700, P2D);
  smooth(16);
  background(255);
  strokeWeight(0.75);

  
  while (particles.size () < 20000) { particles.add(new Particle()); }// Number of field lines

}
 //******************* Calculating Force between two charges **********
float[] Force(){
    Dx=(cpx-cnx);
    Dy=(cpy-cny);
    DD=sqrt(Dy*Dy+Dx*Dx);//r^1/2
    FT=K*qp*qn/(DD*DD);  //kqq/r^2
    F1x=FT*Dx/DD;        // Fx
    F1y=FT*Dy/DD;        // Fy
    F[0]=F1x;
    F[1]=F1y;
    return F;

}

void draw() {
  
  //Drawing the fluid dynamics
  if (frameCount % 5 == 0) {
    noStroke();
    fill(255, 15);
    rect(0, 0, width, height);
  }
  stroke(0, 128);
  for (Particle p : particles) {
    p.run();
  }
  //******************* drawing force vector ************************
  float[] F=Force();
  x2=(F[0]*200);                       // Fx
  y2=(F[1]*200);                       // Fy
   //println(x2,y2);
   line(cpx, cpy, cpx+x2,cpy+y2);      //field magnitude
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