class ElectricCharge{

  int inner_radius;
  int c_radius;
  int x_pos;
  int y_pos;
  int colour;
  
  ElectricCharge(int tmpInnerRadius, int tmpCRadius, int tmpX, int tmpY, int tmpSign){
    inner_radius = tmpInnerRadius;
    c_radius = tmpCRadius;
    x_pos = tmpX;
    y_pos = tmpY;
    
    if(tmpSign == 1) {
    //positive:
    colour = #FF0000;
    } else {
    //negative:
    colour = #0070FF;
    }
  }
  
  
}