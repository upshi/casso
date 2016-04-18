package top.casso.cas.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/services/user")
public class UserController {

	
	@RequestMapping("/a")
	public String aa() {
		return "redirect:/a.jsp";
	}
	
	public static void main(String[] args) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		Set<Entry<String,Object>> entrySet = map.entrySet();
		
		for(Entry<String,Object> entry : entrySet) {
			entry.getValue();
		}
	}
	
}
