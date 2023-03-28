package dto;

public class UserMouth {
	private int mouth_id;
	private String book_name;
	private String surname;
	private String word_mouth;
	private int assessment;
	private String created_at;
	
	public UserMouth(int mouth_id, String book_name, String surname, String word_mouth, int assessment,
			String created_at) {
		super();
		this.mouth_id = mouth_id;
		this.book_name = book_name;
		this.surname = surname;
		this.word_mouth = word_mouth;
		this.assessment = assessment;
		this.created_at = created_at;
	}

	public int getMouth_id() {
		return mouth_id;
	}

	public void setMouth_id(int mouth_id) {
		this.mouth_id = mouth_id;
	}

	public String getBook_name() {
		return book_name;
	}

	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public String getWord_mouth() {
		return word_mouth;
	}

	public void setWord_mouth(String word_mouth) {
		this.word_mouth = word_mouth;
	}

	public int getAssessment() {
		return assessment;
	}

	public void setAssessment(int assessment) {
		this.assessment = assessment;
	}

	public String getCreated_at() {
		return created_at;
	}

	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}
	
	
	
}
