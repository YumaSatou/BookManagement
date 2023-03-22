package dto;

public class UserList {
	private int user_id;
	private String mail;
	private String surname;
	private String name;
	private String address;
	
	public UserList(int user_id, String mail, String surname, String name, String address) {
		super();
		this.user_id = user_id;
		this.mail = mail;
		this.surname = surname;
		this.name = name;
		this.address = address;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	

}
