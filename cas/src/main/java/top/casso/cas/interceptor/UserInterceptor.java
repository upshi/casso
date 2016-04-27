package top.casso.cas.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import top.casso.cas.service.IUserService;

public class UserInterceptor implements HandlerInterceptor {
	
	@Autowired
	private IUserService userService;
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		if(request.getSession().getAttribute("loginUser") == null) {
			//获取当前登录的用户
			Authentication authentication = (Authentication) SecurityContextHolder.getContext().getAuthentication();
			
			if(authentication != null) {
				User user = (User) authentication.getPrincipal();
				top.casso.cas.model.User loginUser = userService.selectByUserName(user.getUsername());
				if(loginUser != null) {
					request.getSession().setAttribute("loginUser", loginUser);
					return true;
				}
			} 
			return false;
		}
		return true;
	}

	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		
	}

	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
		
	}

}
