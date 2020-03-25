void testDB(){
    JSONObject obj = new JSONObject();
    obj.setInt("id", 0);
    obj.setInt("time", 50);// minutes
    try{
      handler.addRouteObject(obj);
    }
    catch(InvalidDataException e){
      System.out.println(e.getMessage()); 
    }
    assert(handler.getFloatAttrib("calories", 0) == 0.0);
    
    JSONObject obj2 = new JSONObject();
    obj2.setInt("id", 1);
    obj2.setFloat("calories", 500);
    obj2.setInt("time", 50);
    obj2.setFloat("dist", 50);
    try{
      handler.addRouteObject(obj2);
    }
    catch(InvalidDataException e){
      System.out.println(e.getMessage()); 
    }
    assert(handler.getFloatAttrib("calories", 1) == 500);    
    assert(handler.getIntAttrib("id", 1) == 1);    

}

void testAddRouteFromJson(){
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
}


void testGui(){
    gui = new Gui(this);
    int x = 0;
    int y = 200;
    for(int i = 0; i < handler.idList.size(); i++){
      gui.addRoute(i, x, y);
      y += 800;
    }
}

void testMap(){
  JSONObject geojson = loadJSONObject("data/test.geojson");
  polyLineEncoder.encodePoints(geojson.getJSONArray("coordinates"));
}
