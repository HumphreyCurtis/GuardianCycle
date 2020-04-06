public class Gui{
   ControlP5 cp5;
   ControlFont cf1, cf2, cf3;
   int currentPage, toDisplayPerPage;
   Gui(processing.core.PApplet main){
     cp5 = new ControlP5(main);
     cf1 = new ControlFont(createFont("UbuntuCondensed-Regular.ttf", 55));
     cf2 = new ControlFont(createFont("UbuntuCondensed-Regular.ttf", 30));
     cf3 = new ControlFont(createFont("UbuntuCondensed-Regular.ttf", 40));
     currentPage = 0;
     toDisplayPerPage = 3;
     addLabel("AppTitle", "GuardianCycle")
             .setPosition(10, 0)
             .setFont(cf1);     
     addButtons();
     }
     
   public void updateRoutes(){
     background(0);
     int x = 10, y = 80;
     for(int i = currentPage * toDisplayPerPage; i < (currentPage * toDisplayPerPage) + toDisplayPerPage; i++){
       if(handler.JsonInDatabase(i)){
         removeRoute(i);
         addRoute(i, x, y);
       }
       x += 405;
     }
   }
   
   public void changePage(int pageNumber){
      for(int i = currentPage * toDisplayPerPage; i < (currentPage * toDisplayPerPage) + toDisplayPerPage; i++){
         removeRoute(i);
      }
      currentPage = pageNumber;
      updateRoutes();
   }
   
   private void addButtons(){
     Bang left = cp5.addBang("left");
     Bang right = cp5.addBang("right");
     
     left.setPosition(20, height / 2)
     .setSize(50, 50)
     .setFont(cf2)
     .onPress(new CallbackListener() {
       public void controlEvent(CallbackEvent theEvent){
         buttonPressed(theEvent);
       }
     });
     
     right.setPosition(width - 120, height / 2)
     .setSize(50, 50)
     .setFont(cf2)
     .onPress(new CallbackListener() {
       public void controlEvent(CallbackEvent theEvent){
         buttonPressed(theEvent);
       }
     });
   }
   
   private void buttonPressed(CallbackEvent theEvent){
     if(theEvent.getController().getName().equals("left")){
         changePage(currentPage - 1);
     }
     else if(theEvent.getController().getName().equals("right")){
         changePage(currentPage + 1);
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
