package top.casso.cas.vo;

import java.util.List;

public class ImportVO {

	private String userName;
	
	private List<String> errors;

	public ImportVO() {}

	public ImportVO(String userName, List<String> errors) {
		this.userName = userName;
		this.errors = errors;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public List<String> getErrors() {
		return errors;
	}

	public void setErrors(List<String> errors) {
		this.errors = errors;
	}

	public String toString() {
		return "ImportVO [userName=" + userName + ", errors=" + errors + "]";
	}
}
