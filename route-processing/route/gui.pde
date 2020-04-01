public class Gui{
   ControlP5 cp5;
   ControlFont cf1, cf2;

   Gui(processing.core.PApplet main){
     cp5 = new ControlP5(main);
     cf1 = new ControlFont(createFont("Arial", 64));
     cf2 = new ControlFont(createFont("Arial", 46));
     addLabel("AppTitle", "GuardianCycle")
             .setPosition(0, 0)
             .setFont(cf1);
   }
   
   public void updateRoutes(){
     int x = 100, y = 100;
     for(int i = 0; i < handler.currentId; i++){
       removeRoute(i);
       addRoute(i, x, y);
       y +=400;
     }
   }
   
   private void addRoute(int JsonId, int x, int y){
     int yOffSet = 60;
     try{
       addLabel("Title " + JsonId, "Route " + JsonId)
       .setPosition(x, y);
       String url = handler.getStringAttrib("url", JsonId);
       if(url != null){
         PImage map = loadImage(url, "png");
         image(map, x + 600, y);
       }
       addLabel("Calories " + JsonId, "Calories - " + handler.getFloatAttrib("calories", JsonId))
       .setPosition(x, y += yOffSet);
       addLabel("Time "+ JsonId, "Time - " + handler.getIntAttrib("time", JsonId))
       .setPosition(x, y += yOffSet);
       addLabel("Distance "+ JsonId, "Distance - " + handler.getFloatAttrib("dist", JsonId))
       .setPosition(x, y += yOffSet);
       addLabel("Speed "+ JsonId, "kMh - " + handler.getFloatAttrib("speed", JsonId))
       .setPosition(x, y += yOffSet);
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

 }
