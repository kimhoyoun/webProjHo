package support.notice.model;

import java.util.Date;

public class NoticeDTO {
	int no;
	String notice_id, notice_title, notice_content, notice_filter;
	Date reg_date;
	
	public NoticeDTO() {
	}
	
	
	public NoticeDTO(String notice_title, String notice_filter, String notice_content) {
		this.notice_id = "notice"+ System.currentTimeMillis();
		this.notice_title = notice_title;
		this.notice_filter = notice_filter;
		this.notice_content = notice_content;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getNotice_id() {
		return notice_id;
	}
	public void setNotice_id(String notice_id) {
		this.notice_id = notice_id;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public String getNotice_filter() {
		return notice_filter;
	}
	public void setNotice_filter(String notice_filter) {
		this.notice_filter = notice_filter;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	@Override
	public String toString() {
		return "NoticeDTO [no=" + no + ", notice_id=" + notice_id + ", notice_title=" + notice_title
				+ ", notice_content=" + notice_content + ", notice_filter=" + notice_filter + ", reg_date=" + reg_date
				+ "]";
	}
	
	
	
	
}
