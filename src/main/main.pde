int cpx=500, cpy=350;
int qp=1000, qn=1000;
float x, y, dx, dy, dxn, dyn;
float d1, E1, E1x, E1y, d2, E2, E2x, E2y;
float EEx, EEy, EE, deltax, deltay;
float ll = 0.5;
ArrayList <Particle> particles = new ArrayList <Particle> ();

void setup() {
  size(1000, 700, P2D);
  smooth(16);
  background(255);
  strokeWeight(0.75);
  while (particles.size () < 20000) { particles.add(new Particle()); }
  
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
  
  //Positive charge - red ball
   for (int i = 0; i < 300; i+=5)
  {
    fill(#FF0000, i/10);
    stroke(#000000);
      noStroke();
    ellipse(500, 350, 300 - i, 300 - i);
  }
  
  
  //Negative charge - blue ball
   for (int j = 0; j < 300; j+=5)
  {
    fill(#0070FF, j/3);
    stroke(#000000);
      noStroke();
    ellipse(0, 0, 300 - j, 300 - j);
  }
 
}