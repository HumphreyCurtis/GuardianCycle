import mqtt.*;
import controlP5.*;

ControlP5 cp5;
MQTTClient client;
Database data = new Database();
DataHandler handler = new DataHandler();
Gui gui;
Calculator calculator;

void setup() {
  gui = new Gui(this);
  size(2000, 2000); 
  initCalcWithUserData();
  testDB();
  testAddRouteFromJson();
  testGui();
  initMqtt();  
  testMQTT();
}

void draw() {
}

private void initCalcWithUserData(){
    JSONObject userData = new JSONObject();
    userData.setInt("height", 178);
    userData.setInt("age", 7);
    userData.setInt("weight", 70);
    userData.setInt("gender", 0);
    calculator = new Calculator(userData);
}

private void initMqtt(){
    client = new MQTTClient(this);
    client.connect("mqtt://try:try@broker.hivemq.com", "processing_desktop" + str(random(3)));
    client.subscribe("guardiancycle");
}
