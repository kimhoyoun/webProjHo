package support.feedback.model;

import java.util.Date;

public class FeedbackAnswerDTO {
	String id,  answer, question_id;
	Date reg_date;
	
	public FeedbackAnswerDTO() {
	}
	
	public FeedbackAnswerDTO(String answer, String question_id) {
		this.id = "Answer"+ System.currentTimeMillis();
		this.question_id = question_id;
		this.answer = answer;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getQuestion_id() {
		return question_id;
	}


	public void setQuestion_id(String question_id) {
		this.question_id = question_id;
	}


	public String getAnswer() {
		return answer;
	}


	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public Date getReg_date() {
		return reg_date;
	}


	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	@Override
	public String toString() {
		return "FaqDTO [id=" + id + ", question_id=" + question_id + ", answer=" + answer + "]";
	}
	
	
	
	
	
	
}
