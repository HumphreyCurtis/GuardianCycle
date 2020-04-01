import static processing.core.PApplet.*;

void setup() {
  
  // Set the size of the application window.
  // All dimensions in processing are pixels
  
  size( 800, 800 );
  background( 0 );
  
  double[][] arrayCords = {  {-2.5890183448791504, 51.45262965662454},
                             {-2.5890183448791504, 51.45262965662454},
                             {-3.5890183448791504, 51.45262965662454}
                                  };
  
  int length = arrayCords.length;
  
  int height = 178;
  int age = 27;
  int weight = 70;
  int time = 60;
  int gender = 0;
  
  
  double dist = calcDistance(length, arrayCords);
  double calories = caloriesCounted(height, age, weight, time, gender, dist);
  print("Calories burned: \t\t" + calories + "\n");
  
 
  print("Total distance travelled: \t" +  dist  + "\n");
  
  print("Km per Hour: \t\t" +  (dist / (time/60)));
  
}

double caloriesCounted(int height, int age, int weight, int time, int gender, double distance)
    {   
      
        double mph = distance/(time/60);
        double mets = calcMets(mph); 

        float s;
        if(gender == 1) {
            s = 5;
        }     
        else {
              s = -161;
        }
        time = time / 60;
        
        double bmr = 
            (10 * weight) +
            (6.25 * height) - 
            (5 * age) + s;
        
        double calories = 
            (bmr * mets) / 24 * time;
        return calories;
    }
    
    double calcMets(double mph)
    {
      if(mph < 10.0){
        return 4.0;
      }
      
      if(mph > 10.0 && mph < 12.0){
        return 6.8;
      }
      
      if(mph > 12.0 && mph < 14.0){
        return 10.0;
      }
      
      if(mph > 16.0 && mph < 20.0){
        return 12.0;
      }
      
      if(mph > 20.0){
        return 15.8;
      }
      
      return 6.8;
    }
     
double calcDistance(int length, double[][] arr)
    {          
        double sum = 0;
        
        int i; int j;
        
        for (i = 0; i < length-1; i++)
        {                                    
            j = i+1;
            double d = getDistanceFromLatLonInKm(arr[i][0], 
                                              arr[i][1],
                                              arr[j][0],
                                              arr[j][1]);
            
            sum = d+sum;
        }
      
        return sum;
    }
    
double getDistanceFromLatLonInKm(double lat1, double lon1, double lat2, double lon2) {
          double R = 6371; // Radius of the earth in km
          double dLat = deg2rad(lat2-lat1);  // deg2rad below
          double dLon = deg2rad(lon2-lon1); 
          double a = 
            Math.sin(dLat/2) * Math.sin(dLat/2) +
            Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * 
            Math.sin(dLon/2) * Math.sin(dLon/2)
            ; 
          double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a)); 
          double d = R * c; // Distance in km
          return d;
     }

double deg2rad(double deg) {
      return deg * (Math.PI/180);
    }
