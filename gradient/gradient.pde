float c_start[] = {30, 128, 58}; // RGB
float c_end[] = {21, 240, 180}; // RGB
// pixel size
float sq_size = 40;

void setup(){
  size(800, 600);
  color backColor = #ff00ff;
  background(backColor);
  // draw gradient
  noStroke();
  color fillColor;
  float c_fill[] = {0.0, 0.0, 0.0};
  float distTotal = sqrt(sq(width) + sq(height));
  float wh = width/(float)height;
  float hw = 1/wh;
  float c1 = 1.0 / (wh + hw);
  float x2, y2, distPartial, progress;
  for(float y = 0; y < height; y += sq_size){
    for(float x = 0; x < width; x += sq_size){
      x2 = ((hw * x) - y) * c1;
      // y2 = ((wh * y) - x) * c1;
      y2 = - (wh * x2);
      distPartial = sqrt(sq(x2 - x) + sq(y2 - y));
      progress = distPartial / distTotal;
      for(int i = 0; i < 3; i++){ // fill in RGB
        c_fill[i] = c_start[i] + (c_end[i]-c_start[i]) * progress;      
      }
      fillColor = color(c_fill[0], c_fill[1], c_fill[2]);
      fill(fillColor);
      square(x, y, sq_size);
    }
  }
}
