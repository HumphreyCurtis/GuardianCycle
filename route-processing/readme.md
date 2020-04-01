# Route Viewer, Processing
## Main Classes
### Data
Database is split into database and handler classes. To access any data, a function must be used from the handler class.
Error checking is done in the handler and database to make sure the accessed json and attribute exists.
  Current handler functions--

    public void addRouteObject(JSONObject obj);
    Checks JSON contains all necessary fields then adds to database.

    public void addUserData(JSONObject userData);
    Again checks fields are valid then updates the user data in the database.

    public int getNextId();
    Gets next valid id from the database, maybe change ids to strings?

    public Boolean JsonInDatabase(int id);
    public Float getFloatAttrib(String attrib, int id);
    public int getIntAttrib(String attrib, int id);
    public String getStringAttrib(String attrib, int id);
### Gui
Gui is handled using cp5, public functions listed below.-

    public void updateRoutes();

updateRoutes removes all routes displayed currently then adds them back, spacing them apart in the y axis by a predefined amount.
Needs to be changed to wrap when the edge of the screen is reached. Or only load 5 or so at a time.
### Calculator
Based on the route co-ordinates, calculates foremost:
1. Distance travelled.
2. Average speed (based on time and distance travelled).

From this data and provided user data, an estimate of the amount of calories burned is then calculated.
### MQTTHandler
This file contains mqtt callback functions, this is where mqtt messages are received and dealt with.

### Maps
This is a static class that can make a url from a routeData Json. It uses a polyline encoder to encode the coordinates into a shorter form. It builds an api request that is used to fetch a static maps image with a route line drawn onto the map.

## TODO
1. Confirm what JSON data needs to be displayed in the viewer
2. Add more gui features to the route objects and overall display such as App title and description.
