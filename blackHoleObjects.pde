float G = 0.5;

ArrayList<blackHole> blackHoleList = new ArrayList<blackHole>();

planet pluto;
planet ceres;

PVector pShip;
PVector vShip;
PVector aShip;

float score = 0.0;


void setup(){
  background(0);
  size(1200, 900);
  
  blackHoleList.add(new blackHole(round(random(100,width-100)), round(random(100,height-100)), round(random(2000,6000)), 50));
  blackHoleList.add(new blackHole(round(random(100,width-100)), round(random(100,height-100)), round(random(2000,6000)), 50));
  blackHoleList.add(new blackHole(round(random(100,width-100)), round(random(100,height-100)), round(random(2000,6000)), 255));
  
  pluto = new planet(300, height/2, 0.25, -2);
  ceres = new planet(799, height/4, 0.1, 1);
  
  pShip = new PVector(10, 10);
  vShip = new PVector(0,0);
  aShip = new PVector(0,0);
  
  smooth();
  textSize(36);
  frameRate(24);
}

void draw(){
  background(0);
  
  pluto.gravity(blackHoleList);
  ceres.gravity(blackHoleList);
  
  updatePlayer(blackHoleList);
  
  pluto.render();
  ceres.render();
  
  for (int i = 0; i < blackHoleList.size(); i++){
    blackHole b = blackHoleList.get(i);
    b.render();
  }
  
  renderPlayer(); 
}

void keyPressed(){
  float thurster = 0.4;
  if(key == 'a'){
    vShip.add(-thurster,0);
  }
  if(key == 'd'){
    vShip.add(thurster,0);
  }
  if(key == 'w'){
    vShip.add(0,-thurster);
  }
  if(key == 's'){
    vShip.add(0,thurster);
  }
}

void updatePlayer(ArrayList<blackHole> bList){
    aShip.mult(0);
    for (int i = 0; i < bList.size(); i++){
      blackHole b = bList.get(i);
      PVector r = PVector.sub(pShip, b.position);
      r.normalize();
      float rMag = PVector.dist(pShip, b.position);
      if(rMag<1.0) rMag = 1.0;
      float gravStrength = (-1)*G*b.mass/(rMag*rMag);
      
      aShip.add(PVector.mult(r,gravStrength));
      
      if(rMag<=b.radius/2 || PVector.dist(pShip, ceres.position)<=7 || PVector.dist(pShip, pluto.position)<=7){
        noLoop();
        stroke(255,0,0);
        text("GAME OVER", width/2, height/2);
      }
      score += 10/rMag;
      text(score, 30, 30);
    }
    vShip.add(aShip);
    pShip.add(vShip);
}

void renderPlayer(){
  fill(100,100,255);
  ellipse(pShip.x, pShip.y, 10, 10);
}
