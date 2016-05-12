package top.casso.cas.util;

import java.io.IOException;
import java.util.Properties;

public class Constant {
	
	public static final String TGT_COOKIE_NAME;
	
	static {
		Properties props = new Properties();
		String path ="/config.properties";
		try {
			props.load(Constant.class.getResourceAsStream(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
		TGT_COOKIE_NAME = props.getProperty("TGT_COOKIE_NAME");
	}

}
