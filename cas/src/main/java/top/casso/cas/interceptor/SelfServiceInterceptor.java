package top.casso.cas.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jasig.cas.authentication.principal.Principal;
import org.jasig.cas.ticket.TicketGrantingTicket;
import org.jasig.cas.ticket.registry.DefaultTicketRegistry;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import top.casso.cas.model.User;
import top.casso.cas.service.IUserService;
import top.casso.cas.util.Constant;

public class SelfServiceInterceptor implements HandlerInterceptor {
	
	@Autowired
	private IUserService userService;
	
	//票据注册服务，所有的票据都由它管理，在ticketRegistry.xml文件中声明
	@Autowired
	private DefaultTicketRegistry ticketRegistry;
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		Cookie[] cookies = request.getCookies();
		//从cookie里取得tgtId
		String tgtId = null;
		for(Cookie c : cookies) {
			if(c.getName().equals(Constant.TGT_COOKIE_NAME)) {
				tgtId = c.getValue();
				break;
			}
		}
		
		//根据tgtId获取TGT
		TicketGrantingTicket tgt = (TicketGrantingTicket) ticketRegistry.getTicket(tgtId);
		
		if(tgt == null) {
			String path = request.getContextPath();
			String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
			response.sendRedirect(basePath + "login");
			return false;
		}
		
		//根据TGT获取authentication里的principal
		Principal principal = tgt.getAuthentication().getPrincipal();
		//获取登录用户的用户名
		String userName = principal.getId();
		
		User selfUser = userService.selectByUserName(userName);
		request.setAttribute("slefUser", selfUser);
		return true;
	}

	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		
	}

	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
		
	}

}
