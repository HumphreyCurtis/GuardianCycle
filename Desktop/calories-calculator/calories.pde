void setup() {
  
  // Set the size of the application window.
  // All dimensions in processing are pixels
  size( 800, 800 );
  
  // Set the background to black (0).
  
  // Try other colours.  You can also use
  // html style hex (e.g. #00FF0A )
  // or RGB (e.g, 255,200,100 )
  background( 0 );
  
  int height = 178;
  int age = 27;
  int weight = 70;
  int time = 60;
  int gender = 0;
  
  double calories = caloriesCounted(height, age, weight, time, gender);
  print(calories);
  
}

double caloriesCounted(int height, int age, int weight, int time, int gender)
    {   
      
        double s;
        
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
            (bmr * 6.8) / 24 * time;
            
        return calories;
    } 
