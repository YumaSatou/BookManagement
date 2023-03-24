package dto;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class BookCart implements Serializable {
	private List<Cart>list;

	public BookCart() {
		super();
		list = new ArrayList<>();
	}

	public List<Cart> getList() {
		return list;
	}

	public void setList(List<Cart> list) {
		this.list = list;
	}
	
	
}
