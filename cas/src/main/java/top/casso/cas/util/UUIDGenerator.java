package top.casso.cas.util;

import java.util.UUID;

public class UUIDGenerator {  
    public UUIDGenerator() {  
    }  
  
    public static String generateUUID(){
        return UUID.randomUUID().toString().replace("-", "");
    }
    public static void main(String[] args) {
    	System.out.println(UUIDGenerator.generateUUID());
	}
}  
