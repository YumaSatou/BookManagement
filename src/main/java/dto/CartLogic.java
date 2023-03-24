package dto;

public class CartLogic {
	public void execute(BookCart bookcart, Cart cart) {
		bookcart.getList().add(cart);
	}
	
	}
