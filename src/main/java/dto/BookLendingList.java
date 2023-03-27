package dto;

public class BookLendingList {
	private String book_name;
	private String isbn;
	private String surname;
	private String name;
	private String mail;
	private String borrow_date;
	private String due_date;
	private int user_id;
	private int book_id;
	private String return_date;
	
	public BookLendingList(String book_name, String isbn, String surname, String name, String mail, String borrow_date,
			String due_date, int user_id, int book_id, String return_date) {
		super();
		this.book_name = book_name;
		this.isbn = isbn;
		this.surname = surname;
		this.name = name;
		this.mail = mail;
		this.borrow_date = borrow_date;
		this.due_date = due_date;
		this.user_id = user_id;
		this.book_id = book_id;
		this.return_date = return_date;
	}

	public String getBook_name() {
		return book_name;
	}

	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getBorrow_date() {
		return borrow_date;
	}

	public void setBorrow_date(String borrow_date) {
		this.borrow_date = borrow_date;
	}

	public String getDue_date() {
		return due_date;
	}

	public void setDue_date(String due_date) {
		this.due_date = due_date;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getBook_id() {
		return book_id;
	}

	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}

	public String getReturn_date() {
		return return_date;
	}

	public void setReturn_date(String return_date) {
		this.return_date = return_date;
	}
	
	
	
}
