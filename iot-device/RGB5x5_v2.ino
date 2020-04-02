// *******************************************************************************************
// ***                Arduino RGB Matrix test for Software Engineering Group               ***
// *******************************************************************************************

// Wiring Matrix to Arduino SDA --> A4  SDL -->A5


//         ******runs through left, right, break, emergency test patterns******

// ******will need each pattern to be connected to a button - see comments in code******
//               ******orientated with wiring at bottom of panel******


//  ****** note Matrix is mapped in a strange way so some of this code is hacky ******
// ****** contacting vendor to see if we can get a better map of the matrix ******

#include <Adafruit_GFX.h>
#include <Adafruit_IS31FL3731.h>
#include <Wire.h>

#define BRIGHT 126   //value 0-255 for brightness Set to medium
#define RECTON 055   // for emergency ON - sets brighness 0-255
#define RECTOFF 0    // for emergency off

Adafruit_IS31FL3731 matrix = Adafruit_IS31FL3731();


void setup() {
  // put your setup code here, to run once:
Serial.println("ISSI manual animation test");
  if (! matrix.begin()) {
    Serial.println("IS31 not found");
    while (1);
  }
  Serial.println("IS31 Found!");

 //
 matrix.setRotation(0);

  delay(500);
}

void loop() {
  // put your main code here, to run repeatedly:
  
    // this code indicates LEFT TURN, needs to go with M% Button press code
    
      for(int a = 0; a<4; a++)
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

      // this code indicates RIGHT TURN, needs to go with M5 Button press code
      for(int b = 0; b<4; b++)
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


      // this code turns BREAK light ON for 3 secons
      // this is horrible due to library used - will try find better solution
     
      {
        // top row (row 1)
        matrix.drawPixel(6, 7, BRIGHT);
        matrix.drawPixel(5, 7, BRIGHT);
        matrix.drawPixel(4, 7, BRIGHT);
        matrix.drawPixel(3, 7, BRIGHT);
        matrix.drawPixel(2, 7, BRIGHT);
        // row 2 
        matrix.drawPixel(4, 8, BRIGHT);
        matrix.drawPixel(5, 8, BRIGHT);
        matrix.drawPixel(6, 8, BRIGHT);
        matrix.drawPixel(0, 7, BRIGHT);
        matrix.drawPixel(1, 7, BRIGHT);
        // row 3
        matrix.drawPixel(3, 8, BRIGHT);
        matrix.drawPixel(2, 8, BRIGHT);
        matrix.drawPixel(1, 8, BRIGHT);
        matrix.drawPixel(0, 8, BRIGHT);
        matrix.drawPixel(15, 7, BRIGHT);
        // row 4
        matrix.drawPixel(13, 7, BRIGHT);
        matrix.drawPixel(12, 7, BRIGHT);
        matrix.drawPixel(11, 7, BRIGHT);
        matrix.drawPixel(10, 7, BRIGHT);
        matrix.drawPixel(9, 7, BRIGHT);
        // row 5
        matrix.drawPixel(14, 7, BRIGHT);
        matrix.drawPixel(15, 0, BRIGHT);
        matrix.drawPixel(8, 0, BRIGHT);
        matrix.drawPixel(9, 0, BRIGHT);
        matrix.drawPixel(10, 0, BRIGHT);
        delay (3000);

        matrix.fillRect(0, 0, 50, 50, RECTOFF);  //using this to clear beaklight
        delay(500); 
      }
    

      
      // this code flashes white EMERGENCY light
      for(int d = 0; d<4; d++)
      {
        matrix.fillRect(0, 0, 50, 50,  RECTON);
        delay(500);
        matrix.fillRect(0, 0, 50, 50, RECTOFF);
        delay(500); 
      }
       
}
