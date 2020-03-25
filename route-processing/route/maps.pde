<<<<<<< HEAD
static class Maps{
  static public String makeUrl(JSONObject routeData){
    String urlRoute = polyLineEncoder.encodePoints(routeData.getJSONArray("coordinates"));
    System.out.println(urlRoute);
    float[] min = getBound(routeData.getJSONArray("coordinates"), true);
    float[] max = getBound(routeData.getJSONArray("coordinates"), false);
    String api = "YOUR API HERE";
    String url = "https://maps.googleapis.com/maps/api/staticmap";
    url += "?center=" + (min[1] + max[1]) / 2  + "," + (min[0] + max[0]) / 2;
    url += "&zoom=17";
    url += "&size=600x600";
    url += "&path=color:0xff0000ff|weight:5|enc:" + urlRoute;
    url += "&key=" + api;
    
    System.out.println(url);
    return url;
  }
  
  static private float[] getBound(JSONArray coords, Boolean isMin){
    float[] coord = new float[2];
    coord[0] = coords.getJSONArray(0).getFloat(0);
    coord[1] = coords.getJSONArray(0).getFloat(1);
    for(int i = 1; i < coords.size(); i++){
      float lon = coords.getJSONArray(i).getFloat(0);
      float lat = coords.getJSONArray(i).getFloat(1);
      if(isMin){
        if(lon < coord[0]) coord[0] = lon; 
        if(lat < coord[1]) coord[1] = lat; 
      }
      else{
        if(lon > coord[0]) coord[0] = lon; 
        if(lat > coord[1]) coord[1] = lat; 
      }
    }
    return coord;
  }

  
}
=======
static class Maps{
  static public String makeUrl(JSONObject routeData){
    String urlRoute = polyLineEncoder.encodePoints(routeData.getJSONArray("coordinates"));
    System.out.println(urlRoute);
    float[] min = getBound(routeData.getJSONArray("coordinates"), true);
    float[] max = getBound(routeData.getJSONArray("coordinates"), false);
    String api = "YOUR API HERE";
    
    String url = "https://maps.googleapis.com/maps/api/staticmap";
    url += "?center=" + (min[1] + max[1]) / 2  + "," + (min[0] + max[0]) / 2;
    url += "&zoom=17";
    url += "&size=600x600";
    url += "&path=color:0xff0000ff|weight:5|enc:" + urlRoute;
    url += "&key=" + api;
    
    System.out.println(url);
    return url;
  }
  
  static private float[] getBound(JSONArray coords, Boolean isMin){
    float[] coord = new float[2];
    coord[0] = coords.getJSONArray(0).getFloat(0);
    coord[1] = coords.getJSONArray(0).getFloat(1);
    for(int i = 1; i < coords.size(); i++){
      float lon = coords.getJSONArray(i).getFloat(0);
      float lat = coords.getJSONArray(i).getFloat(1);
      if(isMin){
        if(lon < coord[0]) coord[0] = lon; 
        if(lat < coord[1]) coord[1] = lat; 
      }
      else{
        if(lon > coord[0]) coord[0] = lon; 
        if(lat > coord[1]) coord[1] = lat; 
      }
    }
    return coord;
  }

  
}
>>>>>>> 48bdabc28e6da824ecc218c3338d4547564f9d08
