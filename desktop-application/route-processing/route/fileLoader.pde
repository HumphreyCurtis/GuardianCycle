public void getAllFromFile(){
  String jsonPath = sketchPath() + File.separator + "JSONs";
  String[] filenames = listFileNames(jsonPath);
  for(String file: filenames){
      JSONObject json = loadJSONObject(jsonPath + File.separator + file);
      try{
        handler.addRouteObject(calculator.createDataJson(json));
      } catch (InvalidDataException e){
        System.out.print(e);
      }
  }
  gui.updateRoutes();
}

String[] listFileNames(String dir){
  File directory = new File(dir);
  if (directory.isDirectory()) {
    return directory.list();
  } else {
    return null;
  }
  
}
