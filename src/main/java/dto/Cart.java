package dto;

import java.io.Serializable;

public class Cart implements Serializable {
	int user_id;
	int book_id;
	String name;
	String isbn;
	String new_old;
	
	public Cart(int user_id, int book_id, String name, String isbn, String new_old) {
		super();
		this.user_id = user_id;
		this.book_id = book_id;
		this.name = name;
		this.isbn = isbn;
		this.new_old = new_old;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getNew_old() {
		return new_old;
	}

	public void setNew_old(String new_old) {
		this.new_old = new_old;
	}
	
	
	
}
