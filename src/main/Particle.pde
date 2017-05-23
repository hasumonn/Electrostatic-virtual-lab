class Particle {

  float ll = 0.5;
  float deltax, deltay;
  
  PVector loc;
  ArrayList <PVector> centers = new ArrayList <PVector> ();
 
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
 
  void addCenter (float x, float y, int sign) {
    
  PVector new_center = new PVector(x,y, sign);
  centers.add(new_center);
  
  }
 
  PVector getDirection(PVector p) {
    
    ArrayList <PVector> effects = new ArrayList<PVector>();
    float total_ex = 0;
    float total_ey = 0;
    float total_e  = 0;
    
    for (PVector c : centers) {
    
    float dx = p.x - c.x;
    float dy = p.y - c.y;
    float d  = sqrt(dx*dx + dy*dy);
    
    //sign
    float E;
    if (c.z == 1) {
    E = qp/(d*d);
    } else {
    E = qn/(d*d);
    }
    
    float Ex = dx*E/d;
    float Ey = dy*E/d;
    
    PVector effect = new PVector(Ex, Ey);
    effects.add(effect);
      
    }
    
    for (PVector e : effects){
    
      total_ex += e.x;
      total_ey += e.y;
    
    }
    
    total_e = sqrt(total_ex * total_ex + total_ey * total_ey);
    
    deltax=ll * total_ex/total_e;
    deltay=ll * total_ey/total_e;
    
    //dx=p.x-x_center; 
    //dy=p.y-y_center;
    //d1=sqrt(dx*dx+dy*dy);
    //E1=qp/(d1*d1);
    //E1x=dx*E1/d1;
    //E1y=dy*E1/d1;
    
    //dxn=p.x-300;
    //dyn=p.y-300;
    //d2=sqrt(dxn*dxn+dyn*dyn);
    //E2=qn/(d2*d2);
    //E2x=dxn*E2/d2;
    //E2y=dyn*E2/d2;
 
    //EEx=E1x+E2x;
    //EEy=E1y+E2y;
    //EE=sqrt(EEx*EEx+EEy*EEy);
    
    //Dx=abs(cpx-cnx);
    //Dy=abs(cpy-cny);
    //F1x=K*qp*qn/(Dx*Dx);
    //F1y=K*qp*qn/(Dy*Dy);
    //deltax=ll*EEx/EE;
    //deltay=ll*EEy/EE;
    
    return new PVector(deltax, deltay);
  }
}