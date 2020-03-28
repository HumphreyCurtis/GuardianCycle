public void sendMessage(JSONObject message){
  client.publish("guardiancycle", message.toString());
}

public void clientConnected() {
  println("client connected to broker");
}

public void connectionLost() {
  println("connection lost");
}

public void messageReceived(String topic, byte[] payload) {
  JSONObject geoJSON = parseJSONObject(new String(payload));
  JSONObject dataJSON = calculator.createDataJson(geoJSON);
  try{
     handler.addRouteObject(dataJSON);
     gui.updateRoutes();
  }
  catch(InvalidDataException e){
    System.out.println(e.getMessage()); 
  }
}
