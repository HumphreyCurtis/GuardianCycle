public void sendMessage(String message){
  client.publish("guardiancycle", message);
}

public void clientConnected() {
  println("client connected to broker");
}

public void connectionLost() {
  println("connection lost");
}

public void messageReceived(String topic, byte[] payload) {
  JSONObject geoJSON = parseJSONObject(new String(payload));
  if(!checkIncomingPayload(geoJSON)) return;
  saveJSONObject(geoJSON, dataDirectory + File.separator + str(random(3)) + ".json");
  JSONObject dataJSON = calculator.createDataJson(geoJSON);
  try{
     handler.addRouteObject(dataJSON);
     gui.updateRoutes();
  }
  catch(InvalidDataException e){
    System.out.println(e.getMessage()); 
  }
}

private boolean checkIncomingPayload(JSONObject obj){
  try{
   if(obj.isNull("coordinates")) throw new InvalidDataException("----Object doesn't contain coordinates----");
   if(obj.isNull("time")) throw new InvalidDataException("----Object doesn't contain coordinates----");
   if(obj.getJSONArray("coordinates").size() < 2) throw new InvalidDataException("----Not enough coordinate points----");
  }
  catch(Exception e){
    return false; 
  }
  return true;
}
