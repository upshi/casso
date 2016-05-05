package top.casso.cas.model;

/*
 * 同一个学生的同一类型(type)记录，最多只能有一条的status是有效的(1)
 * */
public class RandomParam {
	
	private Integer id;
	
	private String userName;
	
	/*随机参数字符串
	 * */
	private String p;		
	
	/*
	 * 类型 1:修改密码
	 * */
	private Integer type;	
	
	/*
	 * 状态  0无效,1有效
	 * */
	private Integer status;
	
	private String time;

	public RandomParam() {}

	public RandomParam(Integer id, String userName, String p, Integer type, Integer status, String time) {
		super();
		this.id = id;
		this.userName = userName;
		this.p = p;
		this.type = type;
		this.status = status;
		this.time = time;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getP() {
		return p;
	}

	public void setP(String p) {
		this.p = p;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	@Override
	public String toString() {
		return "RandomParam [id=" + id + ", userName=" + userName + ", p=" + p + ", type=" + type + ", status=" + status + ", time=" + time + "]";
	}

}
