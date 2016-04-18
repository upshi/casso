package top.casso.cas.model;


public class UserRole {
	
	private String uuid;
	
	private User user;
	
	private Role role;

	public UserRole() {}

	public UserRole(String uuid, User user, Role role) {
		super();
		this.uuid = uuid;
		this.user = user;
		this.role = role;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public String toString() {
		return "UserRole [uuid=" + uuid + ", user=" + user + ", role=" + role + "]";
	}
	
}