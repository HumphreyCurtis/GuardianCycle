void testDB(){
    JSONObject obj = new JSONObject();
    obj.setInt("id", 0);
    obj.setInt("time", 50);// minutes
    handler.addJsonObject(obj);
    assert(handler.getFloatAttrib("calories", 0) == 0.0);
    
    JSONObject obj2 = new JSONObject();
    obj2.setInt("id", 1);
    obj2.setFloat("calories", 500);
    obj2.setInt("time", 50);
    obj2.setFloat("dist", 50);
    handler.addJsonObject(obj2);
    assert(handler.getFloatAttrib("calories", 1) == 500);    
    assert(handler.getIntAttrib("id", 1) == 1);    
}

void testGui(){
    gui = new Gui(this);
    int x = 0;
    int y = 0;
    for(int i: handler.idList){
      gui.addRoute(i, x, y);
      x += 250;
    }
}
