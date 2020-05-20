static class Maps{
  static public String makeUrl(JSONObject routeData){
    String urlRoute = PolyLineEncoder.encodePoints(routeData.getJSONArray("coordinates"));
    float[] min = getBound(routeData.getJSONArray("coordinates"), true);
    float[] max = getBound(routeData.getJSONArray("coordinates"), false);
    String api = "ENTER API HERE";
    if(api.equals("ENTER API HERE")) System.err.println("Please add your api key to maps.pde");
    String url = "https://maps.googleapis.com/maps/api/staticmap";
    url += "?center=" + (min[1] + max[1]) / 2  + "," + (min[0] + max[0]) / 2;
    url += "&zoom=16.5";
    url += "&size=400x400";
    url += "&path=color:0xff0000ff|weight:5|enc:" + urlRoute;
    url += "&key=" + api;
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
