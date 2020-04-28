import java.util.*;

static class PolyLineEncoder{
  static public String encodePoints(JSONArray points){  
      String encoded = "";
      float prevLat = 0;
      float prevLon = 0;
      
      for(int i = 0; i < points.size(); i++){
          float lat = points.getJSONArray(i).getFloat(1);
          float lon = points.getJSONArray(i).getFloat(0);
          encoded += encodePoint(lat - prevLat);
          encoded += encodePoint(lon - prevLon);
          prevLat = lat;
          prevLon = lon;
      }
      return encoded;
  } 
    static private String encodePoint(double coord){
        String encodedCoordinate = "";
        boolean hasNext = true;
        coord *= 100000;
        int val = (int)round((float)coord);
        val <<= 1;
        if(coord < 0) val = ~val;
        while(hasNext){
          int next = (val >> 5);
          hasNext = (next > 0);
          int encVal = val & 0x1f;
          if(hasNext) encVal |= 0x20;
          encVal += 0x3f;
          val = next;
          encodedCoordinate += char(encVal);
        }
        return encodedCoordinate;
    }
  
}
