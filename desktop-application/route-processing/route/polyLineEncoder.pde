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
        coord *= 100000;
        int val = (int)round((float)coord);
        val <<= 1;
        boolean hasNext = true;
        if(coord < 0) val = ~val;
        while(hasNext){
          int val2 = (val >> 5);
          hasNext = (val2 > 0);
          int encodedValue = val & 0x1f;
          if(hasNext) encodedValue |= 0x20;
          encodedValue += 0x3f;
          val = val2;
          encodedCoordinate += char(encodedValue);
        }
        return encodedCoordinate;
    }
  
}
