private class Database{
  HashMap<Integer, JSONObject> data;
  Database(){
    data = new HashMap<Integer, JSONObject>();
  }
  private void addToDB(JSONObject obj){
    data.put(obj.getInt("id"), obj);
  }
  private JSONObject getJSONById(int id) throws NotInDatabaseException{
    JSONObject json = data.get(id);
    if(json == null){
      throw new NotInDatabaseException("JSON not in database\n");
    }
    return json; 
  }
}

public class DataHandler{
  ArrayList<Integer> idList;
  DataHandler(){
    idList = new ArrayList<Integer>();
  }  
  public void addJsonObject(JSONObject obj){
    if(obj == null) return;
    data.addToDB(obj);
    idList.add(obj.getInt("id"));
  }
  
  public Boolean JsonInDatabase(int id){
    try{
      data.getJSONById(id);
      return true;
    }
    catch(Exception e){
      return false; 
    }
  }  
  
  public Float getFloatAttrib(String attrib, int id){
    try{
      JSONObject json = data.getJSONById(id);
      return json.getFloat(attrib);
    }
    catch(RuntimeException e){
      System.err.println(attrib + " not in JSON file");
      return 0.0; 
    }
    catch(NotInDatabaseException e){
      System.err.println(e);
      return 0.0;
    }
  }
  
  public int getIntAttrib(String attrib, int id){
    try{
      JSONObject json = data.getJSONById(id);
      return json.getInt(attrib);
    }
    catch(RuntimeException e){
      System.err.println(attrib + " not in JSON file");
      return 0; 
    }
    catch(NotInDatabaseException e){
      System.err.println(e);
      return 0;
    }
  }
}
