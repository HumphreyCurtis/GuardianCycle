import java.util.*;

static class polyLineEncoder{
  static public String encodePoints(JSONArray points){  
      String encoded = "";
      float prevLat = 0;
      float prevLon = 0;
      for(int i = 0; i < points.size(); i++){
          float lat = points.getJSONArray(i).getFloat(1);
          float lon = points.getJSONArray(i).getFloat(0);
          encoded += encodeSinglePoint(lat - prevLat);
          encoded += encodeSinglePoint(lon - prevLon);
          prevLat = lat;
          prevLon = lon;
      }
      return encoded;
  }
    static private String encodeSinglePoint(double coordinate){
      StringBuilder encodedCoordinate = new StringBuilder();
      boolean hasNext;

      coordinate *= 100000;
      int value = (int) coordinate;
      value <<= 1;
      if(coordinate < 0) value = ~value;  

      do {
        int next = (value >> 5);
        hasNext = (next > 0);
        int encVal = value & 0x1f;
        if(hasNext) encVal |= 0x20;
        encVal += 0x3f;
        value = next;
        encodedCoordinate.append((char)(encVal));
      } while (hasNext);

      return encodedCoordinate.toString();
    }
    
    static private String encodePoint(float point){
       String encoded = "";
       return encoded;
    }
  
  
  /*static private String encodeSinglePoint(double point){
      Boolean isNegative = false;
      if(point < 0){
       isNegative = true; 
      }
      point *= 100000;
      int rounded = (int) point;
      System.out.println(Integer.toBinaryString(rounded));
      rounded = rounded << 1; 
      String bits = Integer.toBinaryString(rounded);
      System.out.println(bits);
     String flipped;
      if(isNegative){
        flipped = flipBits(bits);
      }
      else{
        flipped = bits;
      }
      System.out.println(flipped);
      ArrayList<String> chunks = splitIntoChunks(flipped);
       System.out.println(chunks);
     Collections.reverse(chunks);
      System.out.println(chunks);
      orEachValue(chunks);
      String values = getIntValue(chunks);
      System.out.println(values);
      return values;
  }
  
  static private String flipBits(String toFlip){
    String str = "";
    for(Character bit: toFlip.toCharArray()){
       if(bit == '1'){
          str += 0; 
       }
       else{
          str += 1; 
       }
    }
    return str;
  }
  
  static private ArrayList<String> splitIntoChunks(String toSplit){
    ArrayList<String> chunks = new ArrayList<String>();
    int j = 1;
    String chunk = "";
    for(int i = toSplit.length() - 1; i >= 0; i--){
       chunk = toSplit.charAt(i) + chunk;
       if((j % 5) == 0){
          chunks.add(0, chunk); 
          chunk = "";
       }
       j++;
    }
    chunks.add(0, chunk);
    return chunks;
  }
  
  static private void orEachValue(ArrayList<String> chunks){
    for(int i = 0; i < chunks.size(); i++){
        String chunk = chunks.get(i);
        if(i == chunks.size() - 1){
           chunk = '0' + chunk; 
        }
        else{
            chunk = '1' + chunk;
        }
        chunks.set(i, chunk);
    }
  }
  
  static private String getIntValue(ArrayList<String> chunks){
   String values = "";
   for(String str: chunks){
       Integer val = Integer.parseInt(str, 2) + 63;
       values += (char) val.intValue();
    }
    return values;
  }*/
}
