import grafica.*;
import java.util.Random;

int qp=120, qn=-120;
float[] F={0,0};
float K=8.99;
float Dx,Dy,DD,F1x,F1y,FT;
float x2,y2;
Random r = new Random();

int highlight = #6673b2;

PVector pos_btn = new PVector(400, 600);
PVector neg_btn = new PVector(600, 600);
float   btn_width = 30;
int draw_sign = 2;

int     selected_obj;
//0: nothing selected
//1: pos_btn selected
//2: neg_btn selected
//3: a charge selected

ElectricCharge current_charge;

PVector force_vector;

GPlot graph;
GPointsArray points = new GPointsArray(1000);

//set up electric fields
ArrayList <Particle> particles = new ArrayList <Particle> ();

//set up electric charges
ArrayList <ElectricCharge> charges = new ArrayList <ElectricCharge> ();


void setup() {
  size(1000, 700, P2D);
  smooth(16);
  background(#3c4677);
  strokeWeight(0.75);
  createGraph();
}

void draw() {
  
  btnPanel();
  
  //Drawing the fluid dynamics
    
  if (frameCount % 5 == 0) {
    noStroke();
    fill(#3c4677, 15);
    rect(0, 0, width, height);
  }
  
  stroke(#9cadb5);
  for (Particle p : particles) {
    p.run();
  }
  
  for( ElectricCharge e : charges) {
   
    for (int i = 0; i < 100; i+=5) {
      fill(e.colour, i/10); //change to color of its sign
      stroke(#000000);
      noStroke();
      ellipse(e.x_pos, e.y_pos, e.c_radius - i, e.c_radius - i);
    }
  }
  
  if (force_vector != null){
    drawVector();
  }
  
  graph.beginDraw();
  graph.drawBox();

  graph.drawPoints();
  graph.endDraw();
  
}

void btnPanel(){
  //set up control panel
  fill(#3c4677);
  stroke(highlight);
  rect(350, 575, 300, 50, 7);
  
  fill(#FF0000);
  if (selected_obj == 1){ 
    fill(highlight);
  }
  stroke(#FF0000);
  ellipse(pos_btn.x, pos_btn.y, btn_width, btn_width);
  
  textSize(21);
  fill(#FF0000);
  text("+", pos_btn.x -7, pos_btn.y +5.5);
  
  
  fill(#0070FF);
  if (selected_obj == 2){ 
    fill(highlight);
  }
  stroke(#0070FF);
  ellipse(neg_btn.x, neg_btn.y, btn_width, btn_width);
  
  textSize(23);
  fill(#0070FF);
  text("-", neg_btn.x -6, neg_btn.y +5.5);
  
  onHover();
}


//1) change the current object under control
//2) highlight the selected object
void onHover(){
  selected_obj = 0;
  
  if( inCircle(pos_btn.x, pos_btn.y, btn_width) ) {
     selected_obj = 1; 
  }
  
  if( inCircle(neg_btn.x, neg_btn.y, btn_width) ) {
     selected_obj = 2; 
  }
  
  for (ElectricCharge c : charges) {
    if( inCircle(c.x_pos, c.y_pos, c.c_radius) ) {
      selected_obj = 3;
      current_charge = c;
      break;
    }
  }
}

boolean inCircle(float x, float y, float radius) {
  float dis_x = x - mouseX;
  float dis_y = y - mouseY;
  
  if( sqrt(sq(dis_x) + sq(dis_y)) < radius) {
  return true;
  }

  return false;
}

boolean inRect(float x, float y, float w, float h) {
  //stub
  return false;
}

void mousePressed() {
  
  if(selected_obj == 1){
    draw_sign = 1;
  }
  else if(selected_obj == 2){
    draw_sign = 0;
  }
  else if(selected_obj == 3){
    ArrayList<PVector> v_list = computeEachForce();
    computeTotalForce(v_list);
    //assign this charge to Haply
  }
  else if (charges.size() < 5){
    
    if (draw_sign == 1 ){
      addCharge(1);
    }
    
    if (draw_sign == 0){
      addCharge(0);
    }
  } 

}

void addCharge(int sign){
  ElectricCharge c = new ElectricCharge(10, 100, mouseX, mouseY, sign);
  charges.add(c); 
      
  while (particles.size () < 2000) { particles.add(new Particle()); }
  
  for (Particle p : particles) {
    p.addCenter(mouseX, mouseY, sign);
  }
  
  
  current_charge = c;
  //if (charges.size() > 1){
  //ArrayList<PVector> v_list = computeEachForce();
  //computeTotalForce(v_list);
  //}
}

ArrayList<PVector> computeEachForce() {
    ArrayList<PVector> vectors = new ArrayList<PVector>();   
  
   for(ElectricCharge c : charges){
     if (c != current_charge){
       float dx = c.x_pos - current_charge.x_pos;
       float dy = c.y_pos - current_charge.y_pos;
       float dd = sqrt( dx*dx + dy*dy);
       
       float ft = K*qp*qn/(dd*dd); // current_charge.q * c.q = qp*qn    
       PVector vector = new PVector(ft*dx/dd, ft*dy/dd);
       vectors.add(vector);
     }
   }
   
  return vectors;
}

void computeTotalForce(ArrayList<PVector> vectors){
  float fx_total = 10;
  float fy_total = 10;
  
  for(PVector v : vectors) {
       fx_total += v.x;
       fy_total += v.y;
  }
  
  force_vector = new PVector(fx_total, fy_total);
}

void drawVector() {
  x2=(force_vector.x*10);
  y2=(force_vector.y*10);
  println(x2,y2);
  stroke(#000000);
  line(current_charge.x_pos, current_charge.y_pos, current_charge.x_pos+x2,current_charge.y_pos+y2);
  pushMatrix();
  translate(current_charge.x_pos+x2,current_charge.y_pos+y2);
  float a = atan2(-x2, y2);
  rotate(a);
  line(0, 0, -10, -10);
  line(0, 0, 10, -10);
  popMatrix();
}

void createGraph(){
  for (int i = 0; i < 1000; i++) {
    float x = 10 + random(200);
    float y = 10 * exp(0.015 * x);
    float xErr = 2*((float) r.nextGaussian());
    float yErr = 2*((float) r.nextGaussian());
    points.add(x + xErr, y + yErr);
  }
  
  graph = new GPlot(this);
  graph.setPos(750, 450);
  graph.setDim(150, 150);
  graph.setBoxBgColor(#3c4677);
  graph.setBoxLineColor(highlight);
  
  graph.setLogScale("x");
  graph.setInvertedXScale(true);
  
  graph.setPoints(points);
  graph.setPointColor(color(100, 100, 255, 50));
}