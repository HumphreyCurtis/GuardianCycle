void testDB(){
    int numJSONs = handler.currentId;
    JSONObject obj = new JSONObject();
    obj.setInt("id", 0);
    obj.setInt("time", 50);// minutes
    try{
      handler.addRouteObject(obj);
    }
    catch(InvalidDataException e){
      assert(e.getMessage().equals("----Route doesn't contain Calories information----"));
    }
    /*Will print message saying JSON not in database*/
    assert(handler.getFloatAttrib("calories", 0) == 0.0);
    JSONObject obj2 = new JSONObject();
    obj2.setInt("id", 0);
    obj2.setFloat("calories", 500);
    obj2.setInt("time", 50);
    obj2.setFloat("dist", 50);
    obj2.setFloat("speed", 80);
    try{
      handler.addRouteObject(obj2);
    }
    catch(InvalidDataException e){
      System.out.println(e.getMessage()); 
    }
    assert(handler.getFloatAttrib("calories", 0) == 500);    
    assert(handler.getIntAttrib("id", 0) == 0);   
    assert(numJSONs == (handler.currentId - 1));
}

void testAddRouteFromJson(){
    int numJSONs = handler.currentId;
    JSONObject geojson = loadJSONObject("data/test.geojson");
    JSONObject data = calculator.createDataJson(geojson);
    try{
      handler.addRouteObject(data);
    }
    catch(InvalidDataException e){
      System.out.println(e.getMessage()); 
    }
    geojson = loadJSONObject("data/test2.geojson");
    data = calculator.createDataJson(geojson);
    try{
      handler.addRouteObject(data);
    }
    catch(InvalidDataException e){
      System.out.println(e.getMessage()); 
    }
    assert(numJSONs == (handler.currentId - 2));
}

void testGui(){
    gui.updateRoutes();
    JSONObject geojson = loadJSONObject("data/test2.geojson");
    JSONObject data = calculator.createDataJson(geojson);
    try{
      handler.addRouteObject(data);
    }
    catch(InvalidDataException e){
      System.out.println(e.getMessage()); 
    }
    gui.updateRoutes();
}

void testMQTT(){
    JSONObject geoJSON = loadJSONObject("data/test.geojson");
    sendMessage(geoJSON.toString());
}
