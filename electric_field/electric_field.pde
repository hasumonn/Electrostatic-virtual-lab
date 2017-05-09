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
  if (frameCount % 5 == 0) {
    noStroke();
    fill(255, 15);
    rect(0, 0, width, height);
  }
  stroke(0, 128);
  for (Particle p : particles) {
    p.run();
  }
}
 
class Particle {
  PVector loc;
 
  Particle() {
    loc = new PVector(random(width), random(height));
  }
 
  void run() {
    if (loc.x > width || loc.x < 0 || loc.y > height || loc.y < 0) {
      loc = new PVector(random(width), random(height));
    } else {
      loc.add(getDirection(loc));
      point(loc.x, loc.y);
    }
  }
 
  PVector getDirection(PVector p) {
    dx=p.x-cpx; 
    dy=p.y-cpy;
    d1=sqrt(dx*dx+dy*dy);
    E1=qp/(d1*d1);
    E1x=dx*E1/d1;
    E1y=dy*E1/d1;
 
    E2x=0.016;
    E2y=0;
 
    EEx=E1x+E2x;
    EEy=E1y+E2y;
    EE=sqrt(EEx*EEx+EEy*EEy);
 
    deltax=ll*EEx/EE;
    deltay=ll*EEy/EE;
    return new PVector(deltax, deltay);
  }
}