void setup(){
  Serial.begin(9600);
  pinMode(13, OUTPUT);
  pinMode(2, INPUT);
}

void loop(){
  if(digitalRead(2)==HIGH){
    Serial.println("up");
    digitalWrite(13, HIGH);
  }
  else{
    Serial.println("leNothing");
    digitalWrite(13, LOW);
  }
  delay(100);
}
