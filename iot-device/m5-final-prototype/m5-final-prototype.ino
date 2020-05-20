/*******************************************************************************************
 *
 * Library includes.
 *
 ******************************************************************************************/
 
/*===M5 Stack, Indicator Libraries and Definitions===*/
// M5 Stack system.
#include <M5Stack.h>
#include <SPIFFS.h> /*Enable images*/

#define IndicatorLeft 0x51d 
#define IndicatorRight 0x2589
#define ConsoleColour 0xe8e4 

#define TEXTSIZE 2


/*=======LED Libraries and definitions=======*/
#include <Adafruit_GFX.h>
#include <Adafruit_IS31FL3731.h>
#include <Wire.h>

#define BRIGHT 255   //value 0-255 for brightness Set to medium
#define RECTON 055   // for emergency ON - sets brighness 0-255
#define RECTOFF 0    // for emergency off

Adafruit_IS31FL3731 matrix = Adafruit_IS31FL3731();


// M5 Stack Wifi connection.
#include <WiFi.h>
#include <esp_wifi.h>
WiFiClient wifi_client;

// PubSubClient external library.
#include <PubSubClient.h> /* Manipulated for longer strings */
PubSubClient ps_client( wifi_client );


// Extra, created by SEGP team
#include "Timer.h"



/*******************************************************************************************
 *
 * Global Variables
 *
 ******************************************************************************************/

uint8_t guestMacAddress[6] = {0x84, 0xad, 0x8d, 0xc6, 0x83, 0x9c}; // Network of mobile phone device 

// Wifi settings
const char* ssid = "Curtis_Network_2";                 // Set name of Wifi Network
const char* password = "CapeTown123";                      // No password for UoB Guest


// MQTT Settings
const char* MQTT_clientname = "M5Stack"; // Make up a short name
const char* MQTT_sub_topic = "guardiancycle"; // pub/sub topics
const char* MQTT_pub_topic = "guardiancycle"; // You might want to create your own

// Please leave this alone - to connect to HiveMQ
const char* server = "broker.mqttdashboard.com";
const int port = 1883;

Timer publishing_timer(2000);

/* Data to be sent */
String emergencyJSON = "lastCoord: [-2.5906169414520264, 51.45326480293432], name: John Doe, timeSent: 2020-03-04T18:25:43.511Z, isIncident: true}";
String journeyPolyline = "ov_yH|dzN??j@qVw@q@kNMVxHr@pFDpD`LxA"; 



/*******************************************************************************************
 *
 * Setup() and Loop()
 *
 ******************************************************************************************/

// Standard, one time setup function.
void setup() {
  
    M5.begin();
    M5.Power.begin();
    M5.Lcd.fillScreen(BLACK);
    M5.Lcd.setCursor( 10, 10 );
    M5.Lcd.setTextColor( WHITE );
    M5.Lcd.println("Reset, connecting...");

    Serial.println("*** RESET ***\n");
    connectButton();
    dispConnect();
    setupLED();
}


// Standard, iterative loop function (main)
void loop() {

  checkConnection(); 
  M5.BtnA.read(); 
  M5.BtnB.read();
  M5.BtnC.read(); 
 
  if (M5.BtnA.wasPressed()){ /* Indicator Left Triggered */
    M5.BtnA.read(); 
    indicatorLeft(); 
  } else if (M5.BtnC.wasPressed()){ /* Indicator Right Triggered */
    M5.BtnC.read(); 
    indicatorRight();
  } else if( M5.BtnB.wasPressed() ) {
      String new_string = journeyPolyline; 
      publishMessage( new_string ); /* Send journey data */
      M5.BtnB.read(); 
      M5.Lcd.fillScreen( BLACK );
      displayTitle( "Journey Data Sent" ); 
      delay(5000); 
  } else if (M5.BtnA.pressedFor(500)){ /*Emergency Signal Triggered*/
     String new_string = emergencyJSON; 
     publishMessage( new_string ); /* Send Emergency JSON */
     M5.BtnA.read(); 
     emergencySequence(); 
     displayTitle( "Emergency Data Sent" ); 
     delay(5000); 
  }

  
  if( M5.Lcd.getCursorY() > M5.Lcd.height() ) {
    M5.Lcd.fillScreen( BLACK );
    M5.Lcd.setCursor( 0, 10 );
  }

  initialiseM5();
  
}

/*  Render left indicator */
void indicatorLeft()
{
    M5.Lcd.fillScreen(BLACK); 
    digitalWrite(3, HIGH); 
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
      
    M5.Lcd.fillScreen(BLACK); 
}

/* Render right indicator */
void indicatorRight()
{
    M5.Lcd.fillScreen(BLACK); 
    digitalWrite(3, HIGH); 
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
    
    M5.Lcd.fillScreen(BLACK);
}

/* Initial testing on LED */
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

/* Sequence in case of emergency */
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
      
    M5.Lcd.fillScreen(BLACK); 
}

/* Waits for initialisation of start of journey */
void connectButton() {
  M5.Lcd.fillScreen(BLACK);
  M5.Lcd.setTextColor(WHITE,BLACK);
  M5.Lcd.setTextColor(GREEN, BLACK);
  M5.Lcd.setTextSize(TEXTSIZE);

  if(!SPIFFS.begin(true)){
    Serial.println("SPIFFS Mount Failed");
    return;
  }
// Awaits start journey button to be pressed
  displayTitle("START JOURNEY & CONNECT");
  M5.Lcd.println("\n\nPRESS & HOLD BUTTON C");
  while (!M5.BtnC.pressedFor(300)) {
    M5.Lcd.setCursor(10, 260);
    M5.Lcd.println("< CONNECT");
    M5.BtnC.read();
  }
  M5.Lcd.fillScreen(BLACK);
}


void displayTitle(String title) {
  //Creates header bar
  M5.Lcd.fillRect(0,0,350,35,0x39E7);
  //Prints Title
  M5.Lcd.setTextSize(TEXTSIZE);
  M5.Lcd.setCursor(30, 10);
  M5.Lcd.print(title);
}

void dispConnect(){
  M5.Lcd.fillScreen(BLACK);
  displayTitle("CONNECTING");
  
  // Print WIFI and MQTT details
  M5.Lcd.setTextSize(2);
  M5.Lcd.setCursor(0, 50);
  M5.Lcd.setTextColor(WHITE);
  M5.Lcd.printf("Wifi Network:\n  ");
  M5.Lcd.setTextColor(GREEN);
  M5.Lcd.println(ssid);

  M5.Lcd.setTextColor(WHITE);
  M5.Lcd.println("\nMQTT Topics:");
  M5.Lcd.printf(" -Sub: \n  ");
  M5.Lcd.setTextColor(GREEN);
  M5.Lcd.println(MQTT_sub_topic);
  M5.Lcd.setTextColor(WHITE);
  M5.Lcd.printf(" -Pub:\n  ");
  M5.Lcd.setTextColor(GREEN);
  M5.Lcd.println(MQTT_pub_topic);

  // Displays connected as false
  M5.Lcd.setCursor(10, 200);
  M5.Lcd.print("Connected: ");
  M5.Lcd.setTextColor(RED);
  M5.Lcd.println("FALSE");
  
  // Sets up WiFi and MQTT
  setupWifiWithPassword();
  setupMQTT();
  
  // Once Connected change to true
  M5.Lcd.setCursor(10, 200);
  M5.Lcd.setTextColor(GREEN);
  M5.Lcd.fillRect(10,200,240,40,BLACK);
  M5.Lcd.println("Conneted: TRUE");

  delay(2000);
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
  M5.Lcd.printf("END"); 

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


void checkConnection() {
  //Checks if m5stack is connected
  if (!ps_client.connected()) {
    reconnect();
  }
  ps_client.loop();
}



/*******************************************************************************************
 *
 * Helper functions after this...
 *
 ******************************************************************************************/


// Use this function to publish a message.  It currently
// checks for a connection, and checks for a zero length
// message.  Note, it doens't do anything if these fail.
//
// Note that, it publishes to MQTT_topic value
//
// Also, it doesn't seem to like a concatenated String
// to be passed in directly as an argument like:
// publishMessage( "my text" + millis() );
// So instead, pre-prepare a String variable, and then
// pass that.
void publishMessage( String message ) {

  if( ps_client.connected() ) {

    // Make sure the message isn't blank.
    if( message.length() > 0 ) {
      // Convert to char array
      char msg[ message.length() ];
      message.toCharArray( msg, message.length() );

      M5.Lcd.print(">> Tx: ");
      // Send
      ps_client.publish( MQTT_pub_topic, msg );
    }

  } else {
    Serial.println("Can't publish message: Not connected to MQTT :( ");

  }


}

// This is where we pick up messages from the MQTT broker.
// This function is called automatically when a message is
// received.
//
// Note that, it receives from MQTT_topic value.
//
// Note that, you will receive messages from yourself, if
// you publish a message, activating this function.

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



/*******************************************************************************************
 *
 *
 * You shouldn't need to change any code below this point!
 *
 *
 *
 ******************************************************************************************/


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

void setupWifiWithPassword() 
{

    byte mac[6];
    Serial.println("Original MAC address: " + String(WiFi.macAddress()));
    esp_base_mac_addr_set(guestMacAddress);
    Serial.println("Borrowed MAC address: " + String(WiFi.macAddress()));

    Serial.println("Connecting to network: " + String(ssid));
    WiFi.begin(ssid, password);

    while (WiFi.status() != WL_CONNECTED) delay(500);
    Serial.println("IP address allocated: " + String(WiFi.localIP()));

}

void reconnect() 
{

  // Loop until we're reconnected
  while (!ps_client.connected()) {

    Serial.print("Attempting MQTT connection...");

    // Attempt to connect
    // Sometimes a connection with HiveMQ is refused
    // because an old Client ID is not erased.  So to
    // get around this, we just generate new ID's
    // every time we need to reconnect.
    String new_id = generateID();

    Serial.print("connecting with ID ");
    Serial.println( new_id );

    char id_array[ (int)new_id.length() ];
    new_id.toCharArray(id_array, sizeof( id_array ) );

    if (ps_client.connect( id_array ) ) {
      Serial.println("connected");

      // Once connected, publish an announcement...
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
