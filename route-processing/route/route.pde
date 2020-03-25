import mqtt.*;
import controlP5.*;

ControlP5 cp5;
MQTTClient client;
Database data = new Database();
DataHandler handler = new DataHandler();
Gui gui;

void setup() {
  testDB();
  testGui();
  size(2000, 1000); 
}

void draw() {
 background(0); 
}
