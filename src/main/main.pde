int cpx=500, cpy=350;
int qp=1000, qn=1000;
float x, y, dx, dy, dxn, dyn;
float d1, E1, E1x, E1y, d2, E2, E2x, E2y;
float EEx, EEy, EE, deltax, deltay;
float ll = 0.5;
ArrayList <Particle> particles = new ArrayList <Particle> ();
PShape charge; 
 
void setup() {
  size(1000, 700, P2D);
  smooth(16);
  background(255);
  strokeWeight(0.75);
  while (particles.size () < 20000) { particles.add(new Particle()); }
  
  charge = createShape(ELLIPSE, -50, -25, 50, 50);
  charge.setFill(color(255, 0, 0, 0));
}
 
void draw() {
  if (frameCount % 5 == 0) {
    noStroke();
    fill(255, 15);
    rect(0, 0, width, height);
  }
  stroke(0, 128);
  for (Particle p : particles) {
    p.run();
  }
  
  translate(500, 350);
  shape(charge);
 
}