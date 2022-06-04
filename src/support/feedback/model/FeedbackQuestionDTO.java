package support.feedback.model;

import java.util.Date;

public class FeedbackQuestionDTO {
	String id, title, question, filter, user_id;
	Date reg_date;
	
	public FeedbackQuestionDTO() {
	}
	
	
	public FeedbackQuestionDTO(String title, String question, String filter, String user_id) {
		this.id = "Question"+ System.currentTimeMillis();
		this.title = title;
		this.question = question;
		this.filter = filter;
		this.user_id = user_id;
	}

	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}




	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getQuestion() {
		return question;
	}


	public void setQuestion(String question) {
		this.question = question;
	}

	public String getFilter() {
		return filter;
	}
	
	
	public void setFilter(String filter) {
		this.filter = filter;
	}


	public String getUser_id() {
		return user_id;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public Date getReg_date() {
		return reg_date;
	}


	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}


	@Override
	public String toString() {
		return "FeedbackQuestionDTO [id=" + id + ", title=" + title + ", question=" + question + ", filter=" + filter
				+ ", user_id=" + user_id + "]";
	}





	
	
	
	
	
	
}
