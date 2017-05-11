class Particle{

  int cpx, cpy;
  int qp, qn;
  float x, y, dx, dy, dxn, dyn;
  float d1, E1, E1x, E1y, d2, E2, E2x, E2y;
  float EEx, EEy, EE, deltax, deltay;
  float ll;
  
  PVector loc;
  
  Particle(){
    
    cpx = 500;
    cpy = 350;
    qp = 1000;
    qn = 1000;
    ll = 0.5;
    
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