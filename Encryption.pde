 //Koden er skrevet af el_dippo fra websiden: https://forum.processing.org/one/topic/encrypt-a-string.html
  import java.security.*;

class Encryption {
  String cipher=null;
  String bytesToHex(byte[] b) {
    char hexDigit[] = {
      '0', '1', '2', '3', '4', '5', '6', '7', 
      '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'
    };
    StringBuffer buf = new StringBuffer();
    for (int j=0; j<b.length; j++) {
      buf.append(hexDigit[(b[j] >>4) & 0x0f]);
      buf.append(hexDigit[b[j] & 0x0f]);
    }
    return buf.toString();
  }

  Encryption() {

  }
  
  String encrypt(String input) {
        try {
      MessageDigest md = MessageDigest.getInstance("MD5");
      md.update(input.getBytes()); //storing the password in md object as bytes
      byte[] output = md.digest(); //producing the 128 bit output using the md5 algorithm
      cipher= bytesToHex(output); //converting the bytes to string and storing in cipher String
    }
    catch (Exception e) {
      System.out.println("Exception: "+e);
    }
    return cipher;
  }
}
