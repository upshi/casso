package top.casso.cas;

import org.jasig.cas.authentication.handler.DefaultPasswordEncoder;
import org.jasig.cas.authentication.handler.PasswordEncoder;

public class Test {
	
	public static void main(String[] args) {
		PasswordEncoder passwordEncoder = new DefaultPasswordEncoder("SHA-256");
		System.out.println(passwordEncoder.encode("111111"));
	}

}
