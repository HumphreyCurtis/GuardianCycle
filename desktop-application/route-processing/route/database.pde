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
  int currentId;
  DataHandler(){
    currentId = 0;
  }  
  
  public void addRouteObject(JSONObject obj) throws InvalidDataException{
    if(obj == null) return;
    if(obj.isNull("id")) throw new InvalidDataException("----Route doesn't contain ID----");
    if(obj.isNull("time")) throw new InvalidDataException("----Route doesn't contain Time information----");
    if(obj.isNull("calories")) throw new InvalidDataException("----Route doesn't contain Calories information----");
    if(obj.isNull("dist")) throw new InvalidDataException("----Route doesn't contain Distance information----");
    data.addToDB(obj);
    currentId++;
  }
  
  public int getNextId(){
    return currentId; 
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
  public String getStringAttrib(String attrib, int id){
    try{
      JSONObject json = data.getJSONById(id);
      return json.getString(attrib);
    }
    catch(RuntimeException e){
      System.err.println(attrib + " not in JSON file");
      return ""; 
    }
    catch(NotInDatabaseException e){
      System.err.println(e);
      return "";
    }
  }
}
