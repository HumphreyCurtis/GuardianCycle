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
  size(1600, 800); 
  /*Add user data in this function*/
  initCalcWithUserData(new JSONObject());
  testDB();
  testAddRouteFromJson();
  initMqtt();  
  testMQTT();
  testGui();
}

void draw() {
}

private void initCalcWithUserData(JSONObject userData){

    try{
    calculator = new Calculator(userData);
    }
    catch(InvalidDataException e){
      /*Sets calculator using default values*/
      JSONObject defaultData = new JSONObject();
      defaultData.setInt("height", 178);
      defaultData.setInt("age", 7);
      defaultData.setInt("weight", 70);
      defaultData.setInt("gender", 0);
      try{calculator = new Calculator(defaultData);} catch(Exception neverCalled){}
      System.err.print(e.getMessage());
      System.err.println("Setting to defaultValues");
    }
}

private void initMqtt(){
    client = new MQTTClient(this);
    client.connect("mqtt://try:try@broker.hivemq.com", "processing_desktop" + str(random(3)));
    client.subscribe("guardiancycle");
}
