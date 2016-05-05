package top.casso.cas.util;

public class RandomCodeUtil {
	
	public static int number4() {
		return (int)Math.round(Math.random()*8999+1000);
	}
	
	public static int number6() {
		return (int)Math.round(Math.random()*899999+1000);
	}
	
}