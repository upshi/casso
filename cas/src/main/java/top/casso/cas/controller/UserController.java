package top.casso.cas.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import top.casso.cas.exception.UserException;
import top.casso.cas.exception.UserRoleException;
import top.casso.cas.model.Role;
import top.casso.cas.model.User;
import top.casso.cas.model.UserRole;
import top.casso.cas.service.IRoleService;
import top.casso.cas.service.IUserRoleService;
import top.casso.cas.service.IUserService;
import top.casso.cas.util.UUIDGenerator;
import top.casso.cas.vo.UserRoleVO;

import com.alibaba.fastjson.util.Base64;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/services/user")
public class UserController {

	@Autowired
	private IUserService userService;
	
	@Autowired
	private IRoleService roleService;

	@Autowired
	private IUserRoleService userRoleService;

	private static BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

	@RequestMapping("/manage")
	public String userManager(HttpServletRequest request, Model model, @RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "4") int size) {
		PageInfo<User> pageInfo = null;
		try {
			pageInfo = userService.selectByConditionAndPaging(null, page, size);
		} catch (UserException e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "error";
		}

		List<User> userList = pageInfo.getList();
		model.addAttribute("userList", userList);
		model.addAttribute("totals", pageInfo.getTotal());
		model.addAttribute("totalPages", pageInfo.getPages());
		model.addAttribute("pageIndex", page);
		model.addAttribute("url", "services/user/manage?");
		return "services/user/userManage";
	}

	@RequestMapping("/search")
	public String search(Model model, @RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "4") int size, 
									  @RequestParam(defaultValue = "") String userName, @RequestParam(defaultValue = "") String name,
									  @RequestParam(defaultValue = "") String sex, @RequestParam(defaultValue = "") String phone,
									  @RequestParam(defaultValue = "") String department ) {
		User user = new User();
		user.setUserName(userName);
		user.setName(name);
		user.setSex(sex);
		user.setPhone(phone);
		user.setDepartment(department);
		
		PageInfo<User> pageInfo = null;
		try {
			pageInfo = userService.selectByConditionAndPaging(user, page, size);
		} catch (UserException e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "error";
		}

		List<User> userList = pageInfo.getList();
		model.addAttribute("userList", userList);
		model.addAttribute("totals", pageInfo.getTotal());
		model.addAttribute("totalPages", pageInfo.getPages());
		model.addAttribute("pageIndex", page);
		model.addAttribute("url", "services/user/manage?userName=" + userName + 
														"&name=" + name + 
														"&sex=" + sex +
														"&phone=" + phone +
														"&department=" + department + "&");
		return "services/user/userManage";
	}

	@RequestMapping("/toAdd")
	public String toAddUser(Model model) {
		return "services/user/addUser";
	}

	@RequestMapping("/addUser")
	public String addUser(User user, Model model) {
		user.setUuid(UUIDGenerator.generateUUID());
		// Base64解码得到原始密码
		String rawPassword = new String(Base64.decodeFast(user.getPassword()));
		// BCrypt加密密码
		String encodedPassword = passwordEncoder.encode(rawPassword);
		user.setPassword(encodedPassword);
		user.setState(User.IN_USE);
		
		try {
			userService.insert(user);
		} catch (UserException e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "error";
		}

		model.addAttribute("user", user);
		return "redirect:/services/user/detail/" + user.getUuid();
	}

	@RequestMapping("/delete/{userUuid}")
	@ResponseBody
	public Map<String, Object> userDelte(@PathVariable(value = "userUuid") String userUuid) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			userService.deleteByPrimaryKey(userUuid);
			map.put("result", "success");
		} catch (UserException e) {
			e.printStackTrace();
			map.put("result", e.getMessage());
		}
		return map;
	}

	@RequestMapping("/detail/{userUuid}")
	public String userDetail(@PathVariable(value = "userUuid") String userUuid, Model model) {
		User user = new User();
		try {
			user = userService.selectByPrimaryKey(userUuid);
		} catch (UserException e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "error";
		}

		List<UserRole> userRoles = null;
		try {
			userRoles = userRoleService.selectRolesByUserUuid(user.getUuid());
		} catch (UserRoleException e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "error";
		}

		model.addAttribute("user", user);
		model.addAttribute("userRoles", userRoles);
		return "services/user/userDetail";
	}

	@RequestMapping("/toUpdate/{userUuid}")
	public String toUpdate(@PathVariable(value = "userUuid") String userUuid, Model model) {
		User user = new User();
		try {
			user = userService.selectByPrimaryKey(userUuid);
		} catch (UserException e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "error";
		}
		model.addAttribute("user", user);
		return "services/user/updateUser";
	}

	@RequestMapping("/update")
	public String update(User user, Model model) {
		User old_user = null;
		try {
			old_user = userService.selectByPrimaryKey(user.getUuid());
		} catch (UserException e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "error";
		}
		old_user.setName(user.getName());
		old_user.setSex(user.getSex());
		old_user.setAge(user.getAge());
		old_user.setIdNo(user.getIdNo());
		old_user.setPhone(user.getPhone());
		old_user.setEmail(user.getEmail());
		old_user.setAddress(user.getAddress());
		old_user.setEduBackground(user.getEduBackground());
		old_user.setDepartment(user.getDepartment());
		old_user.setTitle(user.getTitle());
		old_user.setDescription(user.getDescription());
		
		try {
			userService.updateByPrimaryKeySelective(old_user);
		} catch (UserException e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "error";
		}
		
		model.addAttribute("user", old_user);
		return "redirect:/services/user/detail/" + user.getUuid();
	}

	@RequestMapping("/toAllocateRole/{userUuid}")
	public String toAllocateResource(@PathVariable(value = "userUuid") String userUuid, Model model) {
		User user = null;
		try {
			user = userService.selectByPrimaryKey(userUuid);
		} catch (UserException e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "error";
		}

		// 取出所有角色
		List<Role> allRole = roleService.selectAll();
		// 取出该用户已经拥有的角色
		List<UserRole> userRoles = null;
		try {
			userRoles = userRoleService.selectRolesByUserUuid(userUuid);
		} catch (UserRoleException e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "error";
		}
		// 把所有角色放在map中以便快速定位
		HashMap<String, Role> map = new HashMap<String, Role>();
		for (Role r : allRole) {
			map.put(r.getUuid(), r);
		}
		// 遍历已有角色的集合,在所有角色的map中取出该角色,设置该角色的description为和allocateRole.jsp上约定的
		// %SELECTED%@,来表明该角色已经是该用户拥有的。
		for (UserRole ur : userRoles) {
			Role role = map.get(ur.getRole().getUuid());
			role.setDescription("%SELECTED%@");
			map.put(ur.getRole().getUuid(), role);
		}

		Collection<Role> roleList = map.values();
		model.addAttribute("user", user);
		model.addAttribute("roleList", roleList);

		return "user/allocateRole";
	}

	@RequestMapping("/allocateRole")
	public String allocateResource(String userUuid, String[] roleUuid, Model model) {
		User user = null;
		try {
			user = userService.selectByPrimaryKey(userUuid);
		} catch (UserException e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "error";
		}
		// 新的角色的UUID的Set集合
		HashSet<String> newRoleSet = new HashSet<String>(Arrays.asList(roleUuid));
		// 取出该用户已经拥有的角色
		List<UserRole> userRoles = null;
		try {
			userRoles = userRoleService.selectRolesByUserUuid(userUuid);
		} catch (UserRoleException e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "error";
		}

		// 遍历已有角色的集合,把角色UUID构建Set集合
		HashSet<String> oldRoleSet = new HashSet<String>();
		for (UserRole ur : userRoles) {
			oldRoleSet.add(ur.getRole().getUuid());
		}

		// 取新角色Set与原有角色Set的交集，初始化交集为原有的角色集合
		HashSet<String> mixedRoleSet = new HashSet<String>(oldRoleSet);
		mixedRoleSet.retainAll(newRoleSet);

		// 新角色Set减去交集部分,得到新增的角色
		newRoleSet.removeAll(mixedRoleSet);
		List<UserRoleVO> newUserRoleList = new ArrayList<UserRoleVO>();
		UserRoleVO urVo = null;
		for (String str : newRoleSet) {
			urVo = new UserRoleVO(UUIDGenerator.generateUUID(), userUuid, str);
			newUserRoleList.add(urVo);
		}
		if (newUserRoleList.size() > 0) {
			//userRoleService.insertBatchByUserRoleVO(newUserRoleList);
		}

		// 原有资源Set减去交集部分,得到删除的资源
		oldRoleSet.removeAll(mixedRoleSet);
		List<String> deleteUserRoleList = new ArrayList<String>();
		for (String str : oldRoleSet) {
			for (UserRole ur : userRoles) {
				if (ur.getRole().getUuid().equals(str)) {
					deleteUserRoleList.add(ur.getUuid());
				}
			}
		}
		if (deleteUserRoleList.size() > 0) {
			//userRoleService.deleteBatchByUuid(deleteUserRoleList);
		}

		// 查询最新的用户角色信息
		try {
			userRoles = userRoleService.selectRolesByUserUuid(userUuid);
		} catch (UserRoleException e) {
			e.printStackTrace();
			model.addAttribute("msg", e.getMessage());
			return "error";
		}

		model.addAttribute("user", user);
		model.addAttribute("userRoles", userRoles);

		return "user/userDetail";
	}

	@RequestMapping("/checkUsernameUnique/{userName}")
	@ResponseBody
	public Map<String, Object> checkUsernameUnique(@PathVariable(value = "userName") String userName) {
		Map<String, Object> map = new HashMap<String, Object>();
		User user = null;
		try {
			user = userService.selectByPrimaryKey(userName);
		} catch (UserException e) {
			e.printStackTrace();
			map.put("result", "exist");
		}
		if (user != null) {
			map.put("result", "exist");
		} else {
			map.put("result", "inexistence");
		}
		return map;
	}
}