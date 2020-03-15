import static processing.core.PApplet.*;

void setup() {
  
  // Set the size of the application window.
  // All dimensions in processing are pixels
  
  size( 800, 800 );
  background( 0 );
  
  double[][] arrayCords = {  {-2.5906169414520264, 51.45326480293432},
                             {-2.5890183448791504, 51.45262965662454},
                             {-2.588406801223755, 51.4523421664424}
                                  };
  
  int length = arrayCords.length;
  
  double dist = calcDistance(length, arrayCords);
  print(dist);
  
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
