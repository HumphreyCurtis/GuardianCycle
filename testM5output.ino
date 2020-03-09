//will test outputs from M5 to will flash LED
//this replicates final button on/off to send signal to Arduino

//This is code for Arduino will need to be modified

//Connect Nathan's test circuit to M5 
//Black cable goes to Ground/GND on M5
//Red cable by resistor goes to output source on M5

// *****works by sending high/low signal from pin 12********
// ****change pinMode to match M5 - need 3 outputs tested***

void setup() {
  
  pinMode(10, OUTPUT);// set digital pin 13 to output**modifyv
}

void loop() {
  // put your main code here, to run repeatedly:


  digitalWrite(10, HIGH); // turn on d12 **modify
  delay(1000);//pause 1 secs
  digitalWrite(10, LOW);//**modify
  delay(1000);
  
  
}
