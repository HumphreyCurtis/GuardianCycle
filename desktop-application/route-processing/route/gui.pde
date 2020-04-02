public class Gui{
   ControlP5 cp5;
   ControlFont cf1, cf2, cf3;

   Gui(processing.core.PApplet main){
     cp5 = new ControlP5(main);
     cf1 = new ControlFont(createFont("UbuntuCondensed-Regular.ttf", 55));
     cf2 = new ControlFont(createFont("UbuntuCondensed-Regular.ttf", 30));
     cf3 = new ControlFont(createFont("UbuntuCondensed-Regular.ttf", 40));
          
     addLabel("AppTitle", "GuardianCycle")
             .setPosition(10, 0)
             .setFont(cf1);
     }
   
   public void updateRoutes(){
     int x = 10, y = 80;
     
     for(int i = 0; i < handler.currentId; i++){
       removeRoute(i);
       addRoute(i, x, y);
       x += 405;
     }
   }

   private void addRoute(int JsonId, int x, int y){
     int yOffSet = 50;
     int textSetY = y+410;
     try{
       addTitle("Title " + JsonId, "Route " + (JsonId + 1))
       .setPosition(x, textSetY);
       
       String url = handler.getStringAttrib("url", JsonId);
       if(url != null){
         PImage map = loadImage(url, "png");
         image(map, x, y);
       }
       
       addLabel("Calories " + JsonId, "Calories - " + handler.getFloatAttrib("calories", JsonId))
       .setPosition(x, textSetY += yOffSet);
       
       addLabel("Time "+ JsonId, "Time - " + handler.getIntAttrib("time", JsonId))
       .setPosition(x, textSetY += yOffSet);
       
       addLabel("Distance "+ JsonId, "Distance - " + handler.getFloatAttrib("dist", JsonId))
       .setPosition(x, textSetY += yOffSet);
       
       addLabel("Speed "+ JsonId, "kMh - " + handler.getFloatAttrib("speed", JsonId))
       .setPosition(x, textSetY += yOffSet);
       }
       catch(Exception e){
          System.err.println(e.getMessage()); 
       }
   }
   
   private void removeRoute(int id){
       String[] labels = {"Title", "Calories", "Time", "Distance", "Speed"};
       for(String label: labels){
          cp5.remove(label + " " + id);
       }
   }
   
   private Textlabel addLabel(String labelName, String text){
     Textlabel l = cp5.addTextlabel(labelName)
                      .setText(text)
                      .setColor(255)
                      .setFont(cf2);
     return l;
   }
   
   private Textlabel addTitle(String labelName, String text){
     Textlabel l = cp5.addTextlabel(labelName)
                      .setText(text)
                      .setColor(255)
                      .setFont(cf3);
     return l;
   }
  

 }
