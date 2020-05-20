#include <M5Stack.h>
#include <SPIFFS.h>

#define IndicatorLeft 0xe8e4
#define IndicatorRight 0x2589
#define ConsoleColour 0x51d

#include <Adafruit_GFX.h>
#include <Adafruit_IS31FL3731.h>
#include <Wire.h>

#define BRIGHT 255   //value 0-255 for brightness Set to medium
#define RECTON 055   // for emergency ON - sets brighness 0-255
#define RECTOFF 0    // for emergency off

Adafruit_IS31FL3731 matrix = Adafruit_IS31FL3731();


void setup() {
  M5.begin(); 
//  introLoadScreen(); 
  Serial.println("ISSI manual animation test");
  if (! matrix.begin()) {
    Serial.println("IS31 not found");
    while (1);
  }
  Serial.println("IS31 Found!");
  matrix.setRotation(0);

  delay(500);
}

void loop() {
  initialiseM5(); 
  
  if(M5.BtnA.wasPressed()){ /*Indicator Left Triggered*/
    M5.Lcd.fillScreen(BLACK); 
    M5.update();
    leftIndicator();
    M5.update(); 
    M5.Lcd.fillScreen(BLACK); 
  } else if (M5.BtnC.wasPressed()){ /*Indicator Right Triggered*/
    M5.Lcd.fillScreen(BLACK); 
    //digitalWrite(3, HIGH); 
    M5.update();
    rightIndicator(); 
    M5.update(); 
//    delay(6000); 
    M5.Lcd.fillScreen(BLACK); 
  } else if (M5.BtnB.wasPressed()){
    M5.Lcd.fillCircle(160, 120, 80, ConsoleColour); 
    //digitalWrite(3, HIGH); 
  } else if (M5.BtnA.pressedFor(1000)){ /*Emergency Signal Triggered*/
    M5.Lcd.fillScreen(BLACK); 
    emergencyButton(); 
    M5.update(); 
    delay(6000);
    M5.Lcd.fillScreen(BLACK); 

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

void leftIndicator()
{
    M5.Lcd.fillTriangle(280, 10, 280, 200, 30, 100, IndicatorLeft);
    M5.Lcd.setTextColor(IndicatorLeft);
    M5.Lcd.setCursor(0, 215); 
    M5.Lcd.printf("<<<LEFT");
    
        for(int a = 0; a < 4; a++) /* Loop determines length of indicator */
      {
        matrix.drawPixel(4, 7, BRIGHT);
        matrix.drawPixel(5, 8, BRIGHT);
        matrix.drawPixel(3, 8, BRIGHT);
        matrix.drawPixel(12, 7, BRIGHT);
        matrix.drawPixel(8, 0, BRIGHT);
        delay(1000);
        matrix.drawPixel(4, 7, 0);
        matrix.drawPixel(5, 8, 0);
        matrix.drawPixel(3, 8, 0);
        matrix.drawPixel(12, 7, 0);
        matrix.drawPixel(8, 0, 0);
        delay(1000);
      }
}

void rightIndicator()
{
    M5.Lcd.fillTriangle(50, 10, 50, 200, 300, 100, IndicatorRight);
    M5.Lcd.setTextColor(IndicatorRight);
    M5.Lcd.setCursor(17, 215);
    M5.Lcd.printf("RIGHT>>>"); 
    
      for(int b = 0; b < 4; b++)
      {
        matrix.drawPixel(4, 7, BRIGHT);
        matrix.drawPixel(0, 7, BRIGHT);
        matrix.drawPixel(15, 7, BRIGHT);
        matrix.drawPixel(10, 7, BRIGHT);
        matrix.drawPixel(8, 0, BRIGHT);
        delay(1000);
        matrix.drawPixel(4, 7, 0);
        matrix.drawPixel(0, 7, 0);
        matrix.drawPixel(15, 7, 0);
        matrix.drawPixel(10, 7, 0);
        matrix.drawPixel(8, 0, 0);
        delay(1000);
      }
  
}

void emergencyButton()
{
    M5.Lcd.setTextColor(IndicatorLeft);
    M5.Lcd.setCursor(0, 215); 
    M5.Lcd.printf("!!!!EMERGENCY!!!!"); 

        for(int d = 0; d<4; d++)
       {
        matrix.fillRect(0, 0, 50, 50,  RECTON);
        delay(500);
        matrix.fillRect(0, 0, 50, 50, RECTOFF);
        delay(500); 
      }

}
   
