#include <M5Stack.h>

#define IndicatorLeft 0xe8e4
#define IndicatorRight 0x2589
#define ConsoleColour 0x51d


void setup() {
  M5.begin(); 
  M5.Lcd.setBrightness(100); 
  M5.Lcd.setTextSize(3); 

  M5.Lcd.setCursor(25, 215); 
  M5.Lcd.setTextColor(IndicatorLeft);
  M5.Lcd.printf("LEFT");  

  M5.Lcd.setCursor(135, 215); 
  M5.Lcd.setTextColor(ConsoleColour); 
  M5.Lcd.printf("LOG"); 

  M5.Lcd.setCursor(222, 215); 
  M5.Lcd.setTextColor(IndicatorRight); 
  M5.Lcd.printf("RIGHT"); 

}

void loop() {
  
  if(M5.BtnA.wasPressed()){
    M5.Lcd.fillCircle(160, 120, 80, IndicatorLeft); 
    M5.update(); 
    delay(1000);
    
    M5.Lcd.fillCircle(160, 120, 80, ConsoleColour); 
  } else if (M5.BtnC.wasPressed()){
    M5.Lcd.fillCircle(160, 120, 80, IndicatorRight);
    M5.update(); 
    delay(1000); 
    
    M5.Lcd.fillCircle(160, 120, 80, ConsoleColour);
  } else if (M5.BtnB.wasPressed()){
    M5.Lcd.fillCircle(160, 120, 80, ConsoleColour); 
  }
  
  M5.update(); 
  
}
