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
1. Distance travelled (in kilometres).
This is calculating by totalling the distance between each set of co-ordinates within the JSON file. The distance between each set of co-ordinates is calculating using the [Haversine formula.](https://stackoverflow.com/questions/27928/calculate-distance-between-two-latitude-longitude-points-haversine-formula)
2. Average speed (in kms/per hour based on time and distance travelled).

From this data and provided user data, an estimate of the amount of calories burned is then calculated. The calorie calculator follows the logic from the online calculator at [Keisan.](https://keisan.casio.com/exec/system/1350958587) 

The data is then fed back into the GUI where it is display alongside the respective route.

### MQTTHandler
This file contains mqtt callback functions, this is where mqtt messages are received and dealt with.

### Maps
This is a static class that can make a url from a routeData Json. It uses a polyline encoder to encode the coordinates into a shorter form. It builds an api request that is used to fetch a static maps image with a route line drawn onto the map.

## TODO
1. Confirm what JSON data needs to be displayed in the viewer
2. Add more gui features to the route objects and overall display such as App title and description.
