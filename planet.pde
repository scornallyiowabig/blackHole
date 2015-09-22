class planet{
  PVector position;
  PVector velocity;
  PVector acceleration;
  color C;
  
  planet(float x, float y, float vx, float vy){
    position = new PVector(x, y);
    velocity = new PVector(vx, vy);
    acceleration = new PVector(0,0);
    C = color(round(random(0,255)),round(random(0,255)),round(random(0,255)));
  }
  
  void gravity(ArrayList<blackHole> bList){
    acceleration.mult(0);
    for (int i = 0; i < bList.size(); i++){
      blackHole b = bList.get(i);
      PVector r = PVector.sub(position, b.position);
      r.normalize();
      float rMag = PVector.dist(position, b.position);
      if(rMag<1.0) rMag = 1.0;
      float gravStrength = (-1)*G*b.mass/(rMag*rMag);
      
      acceleration.add(PVector.mult(r,gravStrength));
    }
    velocity.add(acceleration);
    position.add(velocity);
  }
  
  void render(){
    fill(C);
    ellipse(position.x, position.y, 15, 15);
  }
  
}

  
  
