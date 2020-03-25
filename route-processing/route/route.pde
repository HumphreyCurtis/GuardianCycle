import mqtt.*;
import controlP5.*;
import org.gicentre.geomap.*;


ControlP5 cp5;
MQTTClient client;
Database data = new Database();
DataHandler handler = new DataHandler();
Gui gui;
Calculator calculator;

void setup() {
  setUpUserData();
  testAddRouteFromJson();
  testGui();

  /*testDB();
  testMap();*/
  size(2000, 2000); 
}

void draw() {
}

private void setUpUserData(){
  JSONObject userData = new JSONObject();
    userData.setInt("height", 178);
    userData.setInt("age", 7);
    userData.setInt("weight", 70);
    userData.setInt("gender", 0);
    calculator = new Calculator(userData);
}
