#include <M5Stack.h>

int i=0; 
int color[]={
  0xfd79, 0xe8e4, 0xfbe4, 
  0xff80, 0x2589, 0x51d, 
  0x3a59, 0xa254, 0x7bef,
  0xffff
}; 

void setup() {
  // put your setup code here, to run once:
  M5.begin(); 
  M5.Lcd.setBrightness(255); 
}

void loop() {
  // put your main code here, to run repeatedly:
  M5.Lcd.fillCircle(160, 120, 100, color[i]); 
  i++; 
  if(i>=(sizeof(color)/sizeof(int))){
    i=0; 
  }
  delay(1000); 
}
