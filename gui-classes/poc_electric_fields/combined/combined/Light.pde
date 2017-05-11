class Light{

  int inner_radius;
  int c_radius;
  int distance;
  float stroke_weight;
  boolean bstroke;
  
  Light(int tmpInnerRadius, int tmpCRadius, int tmpDistance, float tmpStrokeWeight, boolean tmpBStroke){
    inner_radius = tmpInnerRadius;
    c_radius = tmpCRadius;
    distance = tmpDistance;
    stroke_weight = tmpStrokeWeight;
    bstroke = tmpBStroke;
  }

  void keyPressed(){
      if (key == '+' && inner_radius > 1) {
        inner_radius--;
      }
      if (key == '-') {
        inner_radius++;
      }
      if (key == 'g') {
        c_radius++;
      }
      if (key == 'k') {
        c_radius--;
      }
      if (key == 'm' && distance > 1) {
        distance--;
      }
      if (key == 'n') {
        distance++;
      }
      if (key == 's' && stroke_weight > 0.2) {
        bstroke = true; 
        stroke_weight-=0.1;
      }
      if (key == 'w') {
        bstroke = true; 
        stroke_weight+=0.1;
      }
      if (key == 'x') {
        bstroke = false;
      }
      if (key == 'd')
      {
        distance = 5;
        c_radius = 300;
        inner_radius = 10;
        stroke_weight = 0.5;
      }
  }
}