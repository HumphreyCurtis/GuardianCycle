public class Gui{
   ControlP5 cp5;
   ControlFont cf1, cf2;

   Gui(processing.core.PApplet main){
     cp5 = new ControlP5(main);
     cf1 = new ControlFont(createFont("Arial", 46));
     cf2 = new ControlFont(createFont("Arial", 64));
     addLabel("AppTitle", "GuardianCycle")
             .setPosition(0, 0)
             .setFont(cf2);
   }
   
   public void updateRoutes(){
     int x = 0;
     int y = 200;
     for(int i = 0; i < handler.currentId; i++){
       gui.addRoute(i, x, y);
       y += 800;
     }
   }
   
   public void addRoute(int JsonId, int x, int y){
     int yOffSet = 60;
     try{
       Textlabel title = addLabel("Title "+ JsonId + 1, "Route " + (JsonId + 1));
       title.setPosition(x, y);
       String url = handler.getStringAttrib("url", JsonId);
       if(url != null){
         PImage map = loadImage(url, "png");
         image(map, x + 600, y);
       }
       Textlabel calories = addLabel("Calories " + JsonId, "Calories - " + handler.getFloatAttrib("calories", JsonId).toString()); 
       calories.setPosition(x, y += yOffSet);
       Textlabel time = addLabel("Time "+ JsonId, "Time - " + handler.getIntAttrib("time", JsonId)); 
       time.setPosition(x, y += yOffSet);
       Textlabel dist = addLabel("Distance "+ JsonId, "Distance - " + handler.getFloatAttrib("dist", JsonId)); 
       dist.setPosition(x, y += yOffSet);
       Textlabel speed = addLabel("speed "+ JsonId, "kMh - " + handler.getFloatAttrib("speed", JsonId)); 
       speed.setPosition(x, y += yOffSet);
       }
       catch(Exception e){
          System.err.println(e.getMessage()); 
       }
   }
   
   private Textlabel addLabel(String labelName, String text){
     Textlabel l = cp5.addTextlabel(labelName)
                      .setText(text)
                      .setColor(255)
                      .setFont(cf1);   
     return l;
   }

 }
