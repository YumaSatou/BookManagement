package dto;

public class ToshoExam {
	private int id;
	private String book_name;
	private String examDate;
	private String name;
	private String company;
	private int accountId;
	private int isbn;
	private String createdAt;
	
	public ToshoExam(int id, String book_name, String examDate, String name, String company, int accountId,int isbn, String createdAt) {
		super();
		this.id = id;
		this.book_name = book_name;
		this.examDate = examDate;
		this.name = name;
		this.company = company;
		this.accountId = accountId;
		this.isbn = isbn;
		this.createdAt = createdAt;
	}


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getBook_name() {
		return book_name;
	}

	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}

	public String getExamDate() {
		return examDate;
	}

	public void setExamDate(String examDate) {
		this.examDate = examDate;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}


	public int getAccountId() {
		return accountId;
	}

	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}

	public int getIsbn() {
		return isbn;
	}

	public void setIsbn(int isbn) {
		this.isbn = isbn;
	}

	public String getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}
}
