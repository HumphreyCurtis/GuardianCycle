public class Gui{
   ControlP5 cp5J;
   ControlFont cf1;

   Gui(processing.core.PApplet main){
     cp5 = new ControlP5(main);
     cf1 = new ControlFont(createFont("Arial", 32));
   }
   public void addRoute(int JsonId, int x, int y){
     if(handler.JsonInDatabase(JsonId)){
       Textlabel title = addLabel("Title "+ JsonId, "Route " + JsonId);
       title.setPosition(x, y);
       Textlabel calories = addLabel("Calories " + JsonId, "Calories - " + handler.getFloatAttrib("calories", JsonId).toString()); 
       calories.setPosition(x, y + 40);
       Textlabel time = addLabel("Time "+ JsonId, "Time - " + handler.getIntAttrib("time", JsonId)); 
       time.setPosition(x, y + 80);
       Textlabel dist = addLabel("Distance "+ JsonId, "Distance - " + handler.getIntAttrib("dist", JsonId)); 
       dist.setPosition(x, y + 120);
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
