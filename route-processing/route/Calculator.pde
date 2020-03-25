public class Calculator{
  JSONObject userData;
  
  Calculator(JSONObject userData){
   this.userData = userData; 
  }
  
 public JSONObject createDataJson(JSONObject routeData){
   JSONObject routeStats = new JSONObject();
   routeStats.setInt("id", handler.getNextId())
             .setFloat("calories", caloriesCounted(routeData))
             .setFloat("dist", calcDistance(routeData))
             .setFloat("time", routeData.getFloat("time"))
             .setFloat("speed", (routeStats.getFloat("dist") / (routeData.getFloat("time") / 60)))
             .setString("url", Maps.makeUrl(routeData));
   return routeStats;
 }

 private float caloriesCounted(JSONObject routeData)
    {   
      
        int height = userData.getInt("height");
        int age = userData.getInt("age");
        int weight = userData.getInt("weight");
        int gender = userData.getInt("gender");
        
        float time = routeData.getFloat("time");
        float s;
        if(gender == 1) {
            s = 5;
        }     
        else {
              s = -161;
        }
        time = time / 60;
        
        float bmr = 
            (10 * weight) +
            (6.25 * height) - 
            (5 * age) + s;
        
        float calories = 
            (bmr * 6.8) / 24 * time;
        return calories;
    }
    
    float calcDistance(JSONObject routeData)
    {          
        JSONArray coords = routeData.getJSONArray("coordinates");
        int length = coords.size();
        float sum = 0;
        
        int i; int j;
        
        for (i = 0; i < length-1; i++)
        {                                    
            j = i+1;
            float d = getDistanceFromLatLonInKm(coords.getJSONArray(i).getFloat(0), 
                                              coords.getJSONArray(i).getFloat(1),
                                              coords.getJSONArray(j).getFloat(0),
                                              coords.getJSONArray(j).getFloat(1));
            
            sum = d+sum;
        }
      System.out.println(sum);
        return sum;
    }
    
    float getDistanceFromLatLonInKm(float lat1, float lon1, float lat2, float lon2) {
          float R = 6371; // Radius of the earth in km
          double dLat = deg2rad(lat2-lat1);  // deg2rad below
          double dLon = deg2rad(lon2-lon1); 
          double a = 
            Math.sin(dLat/2) * Math.sin(dLat/2) +
            Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * 
            Math.sin(dLon/2) * Math.sin(dLon/2)
            ; 
          double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a)); 
          float d = (float) (R * c); // Distance in km
          return d;
     }
     double deg2rad(double deg) {
      return deg * (Math.PI/180);
    }
}
