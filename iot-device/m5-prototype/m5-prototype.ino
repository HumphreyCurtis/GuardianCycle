
/*===M5 Stack, Indicator Libraries and Definitions===*/
#include <M5Stack.h>
#include <SPIFFS.h> /*Enable images*/

#define IndicatorLeft 0x51d 
#define IndicatorRight 0x2589
#define ConsoleColour 0xe8e4

/*=======LED Libraries and definitions=======*/
#include <Adafruit_GFX.h>
#include <Adafruit_IS31FL3731.h>
#include <Wire.h>

#define BRIGHT 255   //value 0-255 for brightness Set to medium
#define RECTON 055   // for emergency ON - sets brighness 0-255
#define RECTOFF 0    // for emergency off

Adafruit_IS31FL3731 matrix = Adafruit_IS31FL3731();

/*===Timer Libraries and definitions===*/
#include "utility/M5Timer.h"
#include "Timer.h"
M5Timer M5timer;


/*======WiFi Libraries and Definitions======*/
#include <WiFi.h>
#include <esp_wifi.h>
WiFiClient wifi_client;

#include <PubSubClient.h>
PubSubClient ps_client( wifi_client );

uint8_t guestMacAddress[6] = {0x2c, 0x59, 0x8a, 0x6d, 0xad, 0xd7};

// Wifi settings
const char* ssid = "UoB Guest";                 // Set name of Wifi Network
const char* password = "";                      // No password for UoB Guest

// MQTT Settings
const char* MQTT_clientname = "M5Stack"; // Make up a short name
const char* MQTT_sub_topic = "guardiancycle"; // pub/sub topics
const char* MQTT_pub_topic = "guardiancycle"; // You might want to create your own

// Please leave this alone - to connect to HiveMQ
const char* server = "broker.mqttdashboard.com";
const int port = 1883;



void setup() 
{
  M5.begin(); 
//  introLoadScreen(); 
//  fullWifiSetup(); 
  
  boolean startPressed = false; 
  while(!startPressed){
     startUp(); 
     if (M5.BtnB.wasPressed()){
        M5.Lcd.fillScreen(BLACK); 
        startPressed=true; 
     }
     M5.update();
  }

  setupLED();
  
}

void loop() 
{
  M5timer.run();
  initialiseM5(); 

//  if (!ps_client.connected()) {
//    reconnect();
//  }
//  ps_client.loop();
  
  if(M5.BtnA.wasPressed()){ /*Indicator Left Triggered*/
    indicatorLeft(); 
  } else if (M5.BtnC.wasPressed()){ /*Indicator Right Triggered*/
    indicatorRight(); 
  } else if (M5.BtnB.wasPressed()){
     timer();
  } else if (M5.BtnA.pressedFor(500)){ /*Emergency Signal Triggered*/
     emergencySequence(); 
  }
  
  M5.update(); 
}

void setupLED()
{
  Serial.println("ISSI manual animation test");
  
  if (! matrix.begin()) {
    Serial.println("IS31 not found");
    while (1);
  }
  
  Serial.println("IS31 Found!");
  matrix.setRotation(0);

  delay(500);
}

void fullWifiSetup()
{
  M5.Lcd.fillScreen(BLACK);
  M5.Lcd.setCursor( 10, 10 );
  M5.Lcd.setTextColor( WHITE );
  M5.Lcd.println("Reset, connecting...");
  Serial.begin(115200);
  delay(10);
  Serial.println("*** RESET ***\n");
  setupWifi();
  setupMQTT();
}

void setupMQTT() 
{
    ps_client.setServer(server, port);
    ps_client.setCallback(callback);
}

void setupWifi() 
{
    byte mac[6];
    Serial.println("Original MAC address: " + String(WiFi.macAddress()));
    esp_base_mac_addr_set(guestMacAddress);
    Serial.println("Borrowed MAC address: " + String(WiFi.macAddress()));

    Serial.println("Connecting to network: " + String(ssid));
    WiFi.begin(ssid );
    while (WiFi.status() != WL_CONNECTED) delay(500);
    Serial.println("IP address allocated: " + String(WiFi.localIP()));
}


void callback(char* topic, byte* payload, unsigned int length) 
{
  Serial.print("Message arrived [");
  Serial.print(topic);
  Serial.print("] ");

  String in_str = "";

  // Copy chars to a String for convenience.
  // Also prints to USB serial for debugging
  for (int i=0;i<length;i++) {
    in_str += (char)payload[i];
    Serial.print((char)payload[i]);
  }
  Serial.println();

  M5.Lcd.print(" << Rx: " );
  M5.Lcd.println( in_str );
}

void reconnect() 
{
  while (!ps_client.connected()) {

    Serial.print("Attempting MQTT connection...");
    String new_id = generateID();

    Serial.print("connecting with ID ");
    Serial.println( new_id );

    char id_array[ (int)new_id.length() ];
    new_id.toCharArray(id_array, sizeof( id_array ) );

    if (ps_client.connect( id_array ) ) {
      Serial.println("connected");
      ps_client.publish( MQTT_pub_topic, "reconnected");
      // ... and resubscribe
      ps_client.subscribe( MQTT_sub_topic );
    } else {
      M5.Lcd.println(" - Coudn't connect to HiveMQ :(");
      M5.Lcd.println("   Trying again.");
      Serial.print("failed, rc=");
      Serial.print(ps_client.state());
      Serial.println(" try again in 5 seconds");
      // Wait 5 seconds before retrying
      delay(5000);
    }
  }
  M5.Lcd.println(" - Success!  Connected to HiveMQ\n\n");
}


String generateID() 
{

  String id_str = MQTT_clientname;
  id_str += random(0,9999);

  return id_str;
}


void startUp()
{
  M5.Lcd.setBrightness(100); 
  M5.Lcd.setTextSize(3); 
  M5.Lcd.setCursor(50, 215); 
  M5.Lcd.setTextColor(0xFFFF);
  M5.Lcd.printf("START JOURNEY"); 
}


void indicatorLeft()
{
    M5.Lcd.fillScreen(BLACK); 
    digitalWrite(3, HIGH); 
    M5.update();
    M5.Lcd.fillTriangle(280, 10, 280, 200, 30, 100, IndicatorLeft);
    M5.Lcd.setTextColor(IndicatorLeft);
    M5.Lcd.setCursor(0, 215); 
    M5.Lcd.printf("<<<LEFT"); 

    for (int a=0; a<4; a++) { /* Loop determines length of indicator ie. current loop = 3 blinks */
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
        delay(1000); /* Enable appropriate blinking with delay */
      }
      
    M5.update(); 
    M5.Lcd.fillScreen(BLACK); 
}


void indicatorRight()
{
    M5.Lcd.fillScreen(BLACK); 
    digitalWrite(3, HIGH); 
    M5.update();
    M5.Lcd.fillTriangle(50, 10, 50, 200, 300, 100, IndicatorRight);
    M5.Lcd.setTextColor(IndicatorRight);
    M5.Lcd.setCursor(17, 215);
    M5.Lcd.printf("RIGHT>>>"); 
    
      for (int b=0; b<4; b++)  {
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
    
    M5.update(); 
    M5.Lcd.fillScreen(BLACK);
}

void emergencySequence() 
{
    M5.Lcd.fillScreen(BLACK);
    digitalWrite(3, HIGH);
    M5.Lcd.setTextColor(ConsoleColour);
    M5.Lcd.setCursor(0, 215); 
    M5.Lcd.printf("!!!!EMERGENCY!!!!"); 
    
      for (int d=0; d<4; d++)  {
        matrix.fillRect(0, 0, 50, 50,  RECTON);
        delay(500);
        matrix.fillRect(0, 0, 50, 50, RECTOFF);
        delay(500); 
      }
      
    M5.update(); 
    M5.Lcd.fillScreen(BLACK); 
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

  M5.Lcd.setCursor(125, 215); 
  M5.Lcd.setTextColor(ConsoleColour); 
  M5.Lcd.printf("STOP"); 

  M5.Lcd.setCursor(222, 215); 
  M5.Lcd.setTextColor(IndicatorRight); 
  M5.Lcd.printf("RIGHT");
  
}

void timer()
{
    M5.Lcd.setTextColor(0xffff); 
    M5.Lcd.setCursor(10,10);
    M5.Lcd.setTextSize(3); 
    int seconds = millis()/1000;
    int minutes = seconds/60; 
    int hours = minutes/60; 
    M5.Lcd.print("Cycle Journey\n\n"); 
    M5.Lcd.printf("SECONDS: %d\n", seconds);
    M5.Lcd.printf("MINUTES: %d\n", minutes);
    M5.Lcd.printf("HOURS: %d", hours); 
    M5.update(); 
    delay(1000);  
    M5.Lcd.fillScreen(BLACK); 
}



   
