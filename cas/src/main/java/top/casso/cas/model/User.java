package top.casso.cas.model;

public class User {
	
	public static final int DELETED = 0;
	public static final int LOCKED = 1;
	public static final int IN_USE = 2;
	
	private String uuid;
	private String userName;
	private String password;
	private String name;
	private String sex;
	private Integer age;
	private String idNo;
	private String phone;
	private String email;
	private String address;
	private String photo;
	private String eduBackground;//教育背景
	private String department;//部门
	private String title;//职务
	private String role;//角色
	private String description;
	private Integer state;//状态	
	
	public User() {}
	
	public User(String uuid, String userName, String password, String name, String sex, Integer age, String idNo, String phone, String email, String address, String photo, String eduBackground, String description, String department, String title, String role, Integer state) {
		super();
		this.uuid = uuid;
		this.userName = userName;
		this.password = password;
		this.name = name;
		this.sex = sex;
		this.age = age;
		this.idNo = idNo;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.photo = photo;
		this.eduBackground = eduBackground;
		this.description = description;
		this.department = department;
		this.title = title;
		this.role = role;
		this.state = state;
	}
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public String getIdNo() {
		return idNo;
	}
	public void setIdNo(String idNo) {
		this.idNo = idNo;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getEduBackground() {
		return eduBackground;
	}
	public void setEduBackground(String eduBackground) {
		this.eduBackground = eduBackground;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}

	public String toString() {
		return "User [uuid=" + uuid + ", userName=" + userName + ", password=" + password + ", name=" + name + ", sex=" + sex + ", age=" + age + ", idNo=" + idNo + ", phone=" + phone + ", email=" + email + ", address=" + address + ", photo=" + photo + ", eduBackground=" + eduBackground + ", description=" + description + ", department=" + department + ", title=" + title + ", role=" + role + ", state=" + state + "]";
	}

}
