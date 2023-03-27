package dto;

public class ToshoExam {
	private int id;
	private String name;
	private String publisher;
	private int isbn;
	private String author;
	private String new_old;
	private String house;
	
	
	
	public ToshoExam(int id, String name, String publisher, int isbn, String author, String new_old, String house) {
		super();
		this.id = id;
		this.name = name;
		this.publisher = publisher;
		this.isbn = isbn;
		this.author = author;
		this.new_old = new_old;
		this.house = house;
	}



	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getPublisher() {
		return publisher;
	}



	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}



	public int getIsbn() {
		return isbn;
	}



	public void setIsbn(int isbn) {
		this.isbn = isbn;
	}



	public String getAuthor() {
		return author;
	}



	public void setAuthor(String author) {
		this.author = author;
	}



	public String getNew_old() {
		return new_old;
	}



	public void setNew_old(String new_old) {
		this.new_old = new_old;
	}



	public String getHouse() {
		return house;
	}



	public void setHouse(String house) {
		this.house = house;
	}

}