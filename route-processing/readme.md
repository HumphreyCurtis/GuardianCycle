# Route Viewer, Processing
## Main Classes
### Data
Database is split into database and handler classes. To access any data, a function must be used from the handler class. 
Error checking is done in the handler and database to make sure the accessed json and attribute exists.
  Current handler functions--
  
    public void addJsonObject(JSONObject obj);
    public Boolean JsonInDatabase(int id);
    public Float getFloatAttrib(String attrib, int id);
    public int getIntAttrib(String attrib, int id);
    
### Gui
Gui is handled using cp5, public functions listed below.-
	
	public void addRoute(int JsonId, int x, int y);
   
Addroute loops through every JsonId in the datahandler class, finds calorie, time and dist info, then adds labels for each.

### Calculator
Based on the route co-ordinates, calculates foremost:
1. Distance travelled.
2. Average speed (based on time and distance travelled).

From this data and provided user data, an estimate of the amount of calories burned is then calculated.

## TODO
1. Confirm what JSON data needs to be displayed in the viewer
2. Add more gui features to the route objects and overall display such as App title and description.
3. Include mqtt functionality.
