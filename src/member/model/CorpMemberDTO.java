package member.model;

public class CorpMemberDTO {
	
	private String pid, pw, nick_name, corp_name, email, corp_address, manager_name;
	private int manager_num, grade;
	private Long corp_regnum;
	
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getNick_name() {
		return nick_name;
	}
	public void setNick_name(String nick_name) {
		this.nick_name = nick_name;
	}
	public String getCorp_name() {
		return corp_name;
	}
	public void setCorp_name(String corp_name) {
		this.corp_name = corp_name;
	}
	public String getCorp_email() {
		return email;
	}
	public void setCorp_email(String corp_email) {
		this.email = corp_email;
	}
	public String getCorp_address() {
		return corp_address;
	}
	public void setCorp_address(String corp_address) {
		this.corp_address = corp_address;
	}
	public String getManager_name() {
		return manager_name;
	}
	public void setManager_name(String manager_name) {
		this.manager_name = manager_name;
	}
	public int getManager_num() {
		return manager_num;
	}
	public void setManager_num(int manager_num) {
		this.manager_num = manager_num;
	}
	public Long getCorp_regnum() {
		return corp_regnum;
	}
	public void setCorp_regnum(Long corp_regnum) {
		this.corp_regnum = corp_regnum;
	}
	@Override
	public String toString() {
		return "CorpMemberDTO [pid=" + pid + ", pw=" + pw + ", nick_name=" + nick_name + ", corp_name=" + corp_name
				+ ", corp_email=" + email + ", corp_address=" + corp_address + ", manager_name=" + manager_name
				+ ", manager_num=" + manager_num + ", grade=" + grade + ", corp_regnum=" + corp_regnum + "]";
	}
	
}
