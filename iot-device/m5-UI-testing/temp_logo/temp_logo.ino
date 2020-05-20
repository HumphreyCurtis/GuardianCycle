#include <M5Stack.h>
#include <SPIFFS.h>

void setup() 
{
  // put your setup code here, to run once:
  M5.Power.begin(); 
  M5.begin(); 

  start(); 
}

void loop() 
{
  // put your main code here, to run repeatedly:

}

void start() 
{ 
  M5.Lcd.setBrightness(255); 
  SPIFFS.begin();
  
  if(!SPIFFS.begin(true)){
    Serial.println("SPIFFS Mount failed"); 
    return;
  } 
  
  M5.Lcd.fillScreen(BLACK); 
  M5.Lcd.drawPngFile(SPIFFS, "/cyclist.png", 0, 0);
  delay(5000); 

  M5.Lcd.fillScreen(BLACK); 
  M5.Lcd.print("DEVELOPED BY DREAM TEAM\n\n\n\n\n"); 
  M5.Lcd.print("PROTECTING HEADS SINCE FEBRUARY 2020\n\n\n");
  delay(5000);  
  M5.Lcd.fillScreen(RED); 
}
