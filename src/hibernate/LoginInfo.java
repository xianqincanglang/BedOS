package hibernate;
// Generated 2015-12-7 18:32:22 by Hibernate Tools 3.4.0.CR1

/**
 * LoginInfo generated by hbm2java
 */
public class LoginInfo implements java.io.Serializable {

	private Integer id;
	private String loginId;
	private String loginPwd;
	private String isAdmin;

	public LoginInfo() {
	}

	public LoginInfo(String loginId, String loginPwd, String isAdmin) {
		this.loginId = loginId;
		this.loginPwd = loginPwd;
		this.isAdmin = isAdmin;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getLoginId() {
		return this.loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public String getLoginPwd() {
		return this.loginPwd;
	}

	public void setLoginPwd(String loginPwd) {
		this.loginPwd = loginPwd;
	}

	public String getIsAdmin() {
		return this.isAdmin;
	}

	public void setIsAdmin(String isAdmin) {
		this.isAdmin = isAdmin;
	}

}