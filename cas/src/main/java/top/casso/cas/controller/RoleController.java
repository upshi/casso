package top.casso.cas.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import top.casso.cas.exception.RoleException;
import top.casso.cas.model.Role;
import top.casso.cas.model.User;
import top.casso.cas.service.IRoleService;
import top.casso.cas.service.IUserService;
import top.casso.cas.util.UUIDGenerator;

import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/services/role")
public class RoleController {
	
	@Autowired
	private IRoleService roleService;
	
	@Autowired
	private IUserService userService;
	
	@RequestMapping("/manage")
	public String toRoleManager(Model model, HttpSession session, @RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "4") int size) {
		PageInfo<Role> pageInfo = null;
		try {
			pageInfo = roleService.selectByConditionAndPaging(null, page, size);
		} catch (RoleException e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "error";
		}

		List<Role> roleList = pageInfo.getList();
		model.addAttribute("roleList", roleList);
		model.addAttribute("totals", pageInfo.getTotal());
		model.addAttribute("totalPages", pageInfo.getPages());
		model.addAttribute("pageIndex", page);
		model.addAttribute("url", "services/role/manage?");
		return "services/role/roleManage";
	}
	
	@RequestMapping("/search")
	public String search(Model model, @RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "4") int size, @RequestParam(defaultValue = "") String cName, @RequestParam(defaultValue = "") String eName) {
		Role role = new Role(null, cName, eName, null);
		PageInfo<Role> pageInfo = null;
		try {
			pageInfo = roleService.selectByConditionAndPaging(role, page, size);
		} catch (RoleException e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "error";
		}

		List<Role> roleList = pageInfo.getList();
		model.addAttribute("roleList", roleList);
		model.addAttribute("totals", pageInfo.getTotal());
		model.addAttribute("totalPages", pageInfo.getPages());
		model.addAttribute("pageIndex", page);
		model.addAttribute("url", "services/role/search?cName=" + cName + "&cName=" + eName + "&");
		return "services/role/roleManage";
	}
	
	@RequestMapping("/detail/{roleUuid}")
	public String roleDetail(@PathVariable(value = "roleUuid") String roleUuid, Model model) {
		Role role = null;
		try {
			role = roleService.selectByPrimaryKey(roleUuid);
		} catch (RoleException e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "error";
		}
		model.addAttribute("role", role);
		return "services/role/roleDetail";
	}
	
	@RequestMapping("/delete/{roleUuid}")
	@ResponseBody
	public Map<String, Object> roleDelte(@PathVariable(value = "roleUuid") String roleUuid) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			Role role = roleService.selectByPrimaryKey(roleUuid);
			//不允许删除ROLE_ADMIN和ROLE_USER
			if(role.geteName().equals("ROLE_ADMIN") || role.geteName().equals("ROLE_USER")) {
				map.put("result", "failure");
				return map;
			}
		} catch (RoleException e1) {
			e1.printStackTrace();
			map.put("result", "failure");
			return map;
		}
		try {
			roleService.deleteByPrimaryKey(roleUuid);
			map.put("result", "success");
		} catch (RoleException e) {
			e.printStackTrace();
			map.put("result", e.getMessage());
		}
		return map;
	}
	
	@RequestMapping("/toAddRole")
	public String toAddRole() {
		return "services/role/addRole";
	}
	
	@RequestMapping("/addRole")
	public String addRole(Role role, Model model) {
		if(role.geteName().isEmpty() || role.getcName().isEmpty()) {
			return "error";
		} else {
			role.setUuid(UUIDGenerator.generateUUID());
			try {
				roleService.insert(role);
				model.addAttribute("role", role);
				return "redirect:/services/role/detail/" + role.getUuid();
			} catch (RoleException e) {
				e.printStackTrace();
				model.addAttribute("msg", e.getMessage());
				return "error";
			}
		}
	}
	
	@RequestMapping("/toUpdate/{roleUuid}")
	public String toUpdate(@PathVariable(value = "roleUuid") String roleUuid, Model model) {
		Role role = null;
		try {
			role = roleService.selectByPrimaryKey(roleUuid);
			//不允许修改ROLE_ADMIN和ROLE_USER
			if(role.geteName().equals("ROLE_ADMIN") || role.geteName().equals("ROLE_USER")) {
				return "redirect:/services/role/manage";
			}
		} catch (RoleException e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "error";
		}
		model.addAttribute("role", role);
		return "services/role/updateRole";
	}
	
	@RequestMapping("/update")
	public String roleUpdate(Role role, Model model) {
		try {
			roleService.updateByPrimaryKey(role);
		} catch (RoleException e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "error";
		}
		
		//取出最新的资源的集合
		model.addAttribute("role", role);
		
		return "redirect:/services/role/detail/" + role.getUuid();
	}
	
	@RequestMapping("/checkRoleENameUnique/{eName}")
	@ResponseBody
	public Map<String, Object> checkRoleENameUnique(@PathVariable(value = "eName") String eName) {
		Map<String, Object> map = new HashMap<String, Object>();
		Role role = null;
		try {
			role = roleService.selectByEName(eName);
		} catch (RoleException e) {
			e.printStackTrace();
			map.put("result", "exist");
		}
		if(role != null) {
			map.put("result", "exist");
		} else {
			map.put("result", "inexistence");
		}
		return map;
	}
	
	@RequestMapping("/checkRoleCNameUnique/{cName}")
	@ResponseBody
	public Map<String, Object> checkRoleCNameUnique(@PathVariable(value = "cName") String cName) {
		Map<String, Object> map = new HashMap<String, Object>();
		Role role = null;
		try {
			role = roleService.selectByCName(cName);
		} catch (RoleException e) {
			e.printStackTrace();
			map.put("result", "exist");
		}
		if(role != null) {
			map.put("result", "exist");
		} else {
			map.put("result", "inexistence");
		}
		return map;
	}
	
	@RequestMapping("/toAllocateUser/{uuid}")
	public String toAllocateUser(@PathVariable(value = "uuid") String uuid, Model model) {
		Role role = null;
		try {
			role = roleService.selectByPrimaryKey(uuid);
		} catch (RoleException e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "error";
		}
		
		model.addAttribute("role", role);
		return "services/role/allocateUser";
	}
	
	@RequestMapping("/searchUsers")
	public String searchUsers(User user, String roleUuid, Model model) {
		//查角色信息
		Role role = null;
		try {
			role = roleService.selectByPrimaryKey(roleUuid);
		} catch (RoleException e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "error";
		}
		
		//根据条件查用户信息
		user.setUuid(roleUuid);//角色uuid保存在user的uuid中
		List<User> userList = userService.selectByConditionWithRoleUuid(user);
		
		model.addAttribute("role", role);
		model.addAttribute("userList", userList);
		
		return "services/role/allocateUser";
	}
	
}
 