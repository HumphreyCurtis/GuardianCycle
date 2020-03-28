private class Database{
  HashMap<Integer, JSONObject> data;
  JSONObject userData;
  Database(){
    data = new HashMap<Integer, JSONObject>();
    userData = null;
  }
  
  private void addToDB(JSONObject obj){
    data.put(obj.getInt("id"), obj);
  }
  
  private void setUserData(JSONObject userData){
     this.userData = userData; 
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
    if(obj.getInt("id", -1) == -1) throw new InvalidDataException("----Object doesn't contain ID----");
    if(obj.getInt("time", -1) == -1) throw new InvalidDataException("----Object doesn't contain Time information----");
    data.addToDB(obj);
    currentId++;
  }
  
  public void addUserData(JSONObject userData) throws InvalidDataException{
    /*Checks userData json contains all necessary info*/
    if(userData == null) throw new InvalidDataException("Data is null");
    if(userData.getInt("height", -1) == -1) throw new InvalidDataException("----User data doesn't contain height----");
    if(userData.getInt("age", -1) == -1) throw new InvalidDataException("----User data doesn't contain age----");
    if(userData.getInt("weight", -1) == -1) throw new InvalidDataException("----User data doesn't contain weight----");
    if(userData.getInt("gender", -1) == -1) throw new InvalidDataException("----User data doesn't contain gender----");
    data.setUserData(userData);
  }
  
  public JSONObject getUserData(){
    return data.userData; 
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
