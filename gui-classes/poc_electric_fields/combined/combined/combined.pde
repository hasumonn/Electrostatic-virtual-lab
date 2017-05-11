
//Right now as a first step, just testing the particle class
//Particle properties being defined in the Particle class for sake of simplicity
ArrayList <Particle> particles = new ArrayList <Particle> ();

//ArrayList<Light> lights = new ArrayList <Light> ();
Light light1 = new Light(10, 300, 5, 0.5, false); //eg. positive
Light light2 = new Light(5, 150, 2, 0.5, false); //eg. negative

void setup(){
  
  //particle setup
  size(1000, 700, P2D);
  smooth(16);
  background(255);
  strokeWeight(0.75);

  while (particles.size () < 20000) { particles.add(new Particle()); }
  
  //light setup
  //for (int i = 0; i < 2; i++) {
    //lights.add(new Light());
  //}
  
  noCursor();
  
}

void draw() {
  
  //particle setup
  if (frameCount % 5 == 0) {
    noStroke();
    fill(255, 15);
    rect(0, 0, width, height);
  }
  stroke(0, 128);
  for (Particle p : particles) {
    p.run();
  }
  
  
  //light setup for one type of charge polarity eg. positive
  noStroke();
  for (int i = 0; i < light1.c_radius; i+=light1.distance)
  {
    fill(#0070FF, i/light1.inner_radius); //blue
    strokeWeight(light1.stroke_weight);
    stroke(#000000);
    if (light1.bstroke == false)
    {
      noStroke();
    }
    
    //below is to create the light circle at the current mouse postion
    //ellipse(mouseX, mouseY, light1.c_radius - i, light1.c_radius - i);
    ellipse(500, 350, light1.c_radius - i, light1.c_radius - i);
  }
  
  //another light for another polarity charge eg. negative
  for (int j = 0; j < light2.c_radius; j+=light2.distance)
  {
    fill(#FF0000, j/light2.inner_radius); //red
    strokeWeight(light2.stroke_weight);
    stroke(#000000);
    if (light2.bstroke == false)
    {
      noStroke();
    }
    
    //below is to create the light circle at the current mouse postion
    //ellipse(mouseX, mouseY, light1.c_radius - i, light1.c_radius - i);
    ellipse(300, 150, light2.c_radius - j, light2.c_radius - j);
  }
  
}