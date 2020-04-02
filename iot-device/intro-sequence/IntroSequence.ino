#include <M5Stack.h>
#include <SPIFFS.h>

#define IndicatorLeft 0xe8e4
#define IndicatorRight 0x2589
#define ConsoleColour 0x51d


void setup() {
  M5.begin(); 
  introLoadScreen(); 
}

void loop() {
  initialiseM5(); 
  if(M5.BtnA.wasPressed()){
    M5.Lcd.fillScreen(BLACK); 
    M5.update();
    M5.Lcd.fillTriangle(280, 10, 280, 200, 30, 100, IndicatorLeft);
    M5.Lcd.setTextColor(IndicatorLeft);
    M5.Lcd.setCursor(0, 215); 
    M5.Lcd.printf("<<<LEFT"); 
    M5.update(); 
    delay(6000);
    M5.Lcd.fillScreen(BLACK); 
    M5.update();
    
    M5.Lcd.fillCircle(160, 120, 80, ConsoleColour); 
  } else if (M5.BtnC.wasPressed()){
    M5.Lcd.fillScreen(BLACK); 
    M5.update();
    M5.Lcd.fillTriangle(50, 10, 50, 200, 300, 100, IndicatorRight);
    M5.Lcd.setTextColor(IndicatorRight);
    M5.Lcd.setCursor(17 0, 215);
    M5.Lcd.printf("RIGHT>>>"); 
    M5.update(); 
    delay(6000); 
    M5.Lcd.fillScreen(BLACK); 
    M5.update(); 
    
    M5.Lcd.fillCircle(160, 120, 80, ConsoleColour);
  } else if (M5.BtnB.wasPressed()){
    M5.Lcd.fillCircle(160, 120, 80, ConsoleColour); 
  }
  
  M5.update(); 
  
}

void introLoadScreen() 
{ 
  M5.Lcd.setBrightness(100); 
  SPIFFS.begin();
  
  if(!SPIFFS.begin(true)){
    Serial.println("SPIFFS Mount failed"); 
    return;
  } 
  
  M5.Lcd.fillScreen(BLACK); 
  M5.Lcd.drawPngFile(SPIFFS, "/cyclist.png", 0, 0);
  delay(2000); 
  
  M5.Lcd.fillScreen(BLACK); 
  
  M5.Lcd.setTextSize(3); 
  M5.Lcd.setTextColor(ConsoleColour);
  M5.Lcd.println("DEVELOPED BY\nDREAM TEAM\n"); 
  
  M5.Lcd.setTextColor(IndicatorRight);
  M5.Lcd.println("PROTECTING HEADS\nSINCE\nFEBRUARY 2020...");
  delay(4000);  
  
  M5.Lcd.fillScreen(BLACK); 
}


void initialiseM5()
{
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

   
