class blackHole{
  PVector position;
  int mass;
  int radius;
  color c;
  
  blackHole(int x, int y, int m, color banana){
    mass = m;
    position = new PVector(x,y);
    radius = round(mass/50);
    c = color(banana);
  }
  
  void render(){
    fill(c);
    ellipse(position.x, position.y, radius, radius);
  }
}
