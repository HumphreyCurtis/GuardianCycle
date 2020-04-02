void setup() {
  
  pinMode(3, OUTPUT);// set digital pin 13 to output**modifyv
}

void loop() {
  // put your main code here, to run repeatedly:


  digitalWrite(3, HIGH); // turn on d12 **modify
  delay(1000);//pause 1 secs
  digitalWrite(3, LOW);//**modify
  delay(1000);
  
}
