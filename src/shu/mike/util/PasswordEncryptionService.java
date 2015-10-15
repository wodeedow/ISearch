package shu.mike.util;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.KeySpec;
import java.util.Arrays;
import java.util.Date;

import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
 
public class PasswordEncryptionService {
	public static String bytesToHexString(byte[] src){   
	    StringBuilder stringBuilder = new StringBuilder("");   
	    if (src == null || src.length <= 0) {   
	        return null;   
	    }   
	    for (int i = 0; i < src.length; i++) {   
	        int v = src[i] & 0xFF;   
	        String hv = Integer.toHexString(v);   
	        if (hv.length() < 2) {   
	            stringBuilder.append(0);   
	        }   
	        stringBuilder.append(hv);   
	    }   
	    return stringBuilder.toString();   
	}   
	 public static byte[] hexStringToBytes(String hexString) {
	       if (hexString == null || hexString.equals("")) {
	           return null;
	       }
	       hexString = hexString.toUpperCase();
	       int length = hexString.length() / 2;
	       char[] hexChars = hexString.toCharArray();
	       byte[] d = new byte[length];
	       for (int i = 0; i < length; i++) {
	           int pos = i * 2;
	           d[i] = (byte) (charToByte(hexChars[pos]) << 4 | charToByte(hexChars[pos + 1]));
	       }
	       return d;
	   }
	 private static byte charToByte(char c) {
	       return (byte) "0123456789ABCDEF".indexOf(c);
	   }
 
 public static boolean authenticate(String attemptedPassword, byte[] encryptedPassword, byte[] salt)
   throws NoSuchAlgorithmException, InvalidKeySpecException {
  // Encrypt the clear-text password using the same salt that was used to
  // encrypt the original password
  byte[] encryptedAttemptedPassword = getEncryptedPassword(attemptedPassword, salt);
 
  // Authentication succeeds if encrypted password that the user entered
  // is equal to the stored hash
  return Arrays.equals(encryptedPassword, encryptedAttemptedPassword);
 }
 
 public static  byte[] getEncryptedPassword(String password, byte[] salt)
   throws NoSuchAlgorithmException, InvalidKeySpecException {
  // PBKDF2 with SHA-1 as the hashing algorithm. Note that the NIST
  // specifically names SHA-1 as an acceptable hashing algorithm for PBKDF2
  String algorithm = "PBKDF2WithHmacSHA1";
  // SHA-1 generates 160 bit hashes, so that's what makes sense here
  int derivedKeyLength = 160;
  // Pick an iteration count that works for you. The NIST recommends at
  // least 1,000 iterations:
  // http://csrc.nist.gov/publications/nistpubs/800-132/nist-sp800-132.pdf
  // iOS 4.x reportedly uses 10,000:
  // http://blog.crackpassword.com/2010/09/smartphone-forensics-cracking-blackberry-backup-passwords/
  int iterations = 20000;
 
  KeySpec spec = new PBEKeySpec(password.toCharArray(), salt, iterations, derivedKeyLength);
 
  SecretKeyFactory f = SecretKeyFactory.getInstance(algorithm);
 
  return f.generateSecret(spec).getEncoded();
 }
 
 public static byte[] generateSalt() throws NoSuchAlgorithmException {
  // VERY important to use SecureRandom instead of just Random
  SecureRandom random = SecureRandom.getInstance("SHA1PRNG");
 
  // Generate a 8 byte (64 bit) salt as recommended by RSA PKCS5
  byte[] salt = new byte[8];
  random.nextBytes(salt);
 
  return salt;
 }
 public static  String generateValidateCode(String userName) throws NoSuchAlgorithmException, InvalidKeySpecException
	{
		StringBuilder sb=new StringBuilder();
		sb.append(new Date().toString());
		sb.append(userName);
		byte[] salt= PasswordEncryptionService.generateSalt();
		byte[] validateCode=PasswordEncryptionService.getEncryptedPassword(sb.toString(), salt);
		return  PasswordEncryptionService.bytesToHexString(validateCode); 
	}
}