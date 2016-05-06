package top.casso.cas.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.jasig.cas.authentication.handler.DefaultPasswordEncoder;
import org.jasig.cas.authentication.handler.PasswordEncoder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import top.casso.cas.model.User;
import top.casso.cas.service.IUserService;
import top.casso.cas.vo.ImportVO;

@Component
public class ImportUserFromXLS {
	
	@Autowired
	private IUserService userService;
	
	private static PasswordEncoder passwordEncoder = new DefaultPasswordEncoder("SHA-256");
	
	private static Pattern idNoPattern = Pattern.compile("^[1-9]\\d{16}[\\d|x]$");
	private static Pattern emailPattern = Pattern.compile("^[\\w+]*@[\\w+\\.]+\\w+$");
	private static Pattern phonePattern = Pattern.compile("^1[3|4|5|7|8]\\d{9}$");
	
	public Map<String, Object> doImport(InputStream inputStream) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<User> correctUsers = new ArrayList<User>();
		List<ImportVO> errorUsers = new ArrayList<ImportVO>();
		try {
			//获取excel对象
			HSSFWorkbook xls = new HSSFWorkbook(inputStream);
			//获取excel文件中的第X个sheet
			HSSFSheet sheet = xls.getSheetAt(0);
			//获取总行数
			int rowNum = sheet.getLastRowNum();
			HSSFRow row = null;
			User user = null;
			ImportVO checkResult = null;
			
			//遍历行,封装User对象,调用方法插入数据库
			for (int i = 1; i <=rowNum; i++) {
				user = new User();
				row = sheet.getRow(i);
				
				user.setUserName(row.getCell(0) == null ? "" : row.getCell(0).toString());
				user.setName(row.getCell(1) == null ? "" : row.getCell(1).toString());
				user.setSex(row.getCell(2) == null ? "" : row.getCell(2).toString());
				//此处用password属性先接收年龄值,因为年龄是Integer型,此处还不做判断
				user.setPassword(row.getCell(3) == null ? "" : row.getCell(3).toString());
				user.setIdNo(row.getCell(4) == null ? "" : row.getCell(4).toString());
				user.setPhone(row.getCell(5) == null ? "" : row.getCell(5).toString());
				user.setEmail(row.getCell(6) == null ? "" : row.getCell(6).toString());
				user.setAddress(row.getCell(7) == null ? "" : row.getCell(7).toString());
				user.setDepartment(row.getCell(8) == null ? "" : row.getCell(8).toString());
				user.setTitle(row.getCell(9) == null ? "" : row.getCell(9).toString());
				user.setDescription(row.getCell(10) == null ? "" : row.getCell(10).toString());
				
				checkResult = checkUser(user);
				if(checkResult != null) {
					if(StringUtil.isNoE(user.getUserName())) {
						//如果用户名为空,则设置成@null@ + uuid的形式,前台判断,如果是以@null@开头,则显示空字符串
						user.setUserName("@null@" + UUIDGenerator.generateUUID());
					}
					errorUsers.add(checkResult);
				} else {
					user.setUuid(UUIDGenerator.generateUUID());
					//之前设置年龄到密码域中
					user.setAge(Integer.parseInt(user.getPassword()));
					//默认密码同用户名
					user.setPassword(passwordEncoder.encode(user.getUserName()));
					user.setState(User.IN_USE);
					correctUsers.add(user);
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		map.put("correctUsers", correctUsers);
		map.put("errorUsers", errorUsers);
		return map;
	}
	
	private ImportVO checkUser(User user) {
		List<String> list = new ArrayList<String>();
		if(StringUtil.isNoE(user.getUserName())) {
			list.add("用户名不能为空。");
		} else {
			User selected = userService.selectByUserName(user.getUserName());
			if(selected != null) {
				list.add("用户名 '" + user.getUserName() + "' 已经存在");
			}
		}
		
		if(StringUtil.isNoE(user.getName())) {
			list.add("姓名不能为空。");
		}
		
		if(!StringUtil.isNoE(user.getSex())) {
			if(!(user.getSex().equals("男") || user.getSex().equals("女"))) {
				list.add("性别只能是男或者女,错误值:" + user.getSex());
			}
		}
		
		//密码域存放的是年龄
		if(!StringUtil.isNoE(user.getPassword())) {
			try {
				int age = Integer.parseInt(user.getPassword());
				if(age < 0 || age > 100 ) {
					list.add("年龄范围应在0-100之间的数字,错误值:" + user.getPassword());
				}
			} catch (NumberFormatException e) {
				list.add("年龄范围应在0-100之间的数字,错误值:" + user.getPassword());
			}
		}
		
		if(!StringUtil.isNoE(user.getIdNo())) {
			if(!idNoPattern.matcher(user.getIdNo()).matches()) {
				list.add("身份证号格式错误,错误值:" + user.getIdNo());
			}
		}
		
		if(StringUtil.isNoE(user.getPhone())) {
			list.add("手机号不能为空");
		} else {
			if(!phonePattern.matcher(user.getPhone()).matches()) {
				list.add("手机号格式错误,错误值:" + user.getPhone());
			}
		}
		
		if(StringUtil.isNoE(user.getEmail())) {
			list.add("邮箱不能为空");
		} else {
			if(!emailPattern.matcher(user.getEmail()).matches()) {
				list.add("邮箱格式错误,错误值:" + user.getEmail());
			}
		}
		
		ImportVO importVO = null;
		if(list.size() > 0) {
			importVO = new ImportVO(user.getUserName(), list);
		}
		return importVO;
	}
	
}
