package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.BookCart;
import dto.Cart;
import dto.CartLogic;

/**
 * Servlet implementation class CartBookAddServlet
 */
@WebServlet("/CartBookAddServlet")
public class CartBookAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartBookAddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String view = "WEB-INF/view/BookCart2.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
				request.setCharacterEncoding("UTF-8");
				
				String book_id = request.getParameter("id");
				String name = request.getParameter("name");
				String isbn = request.getParameter("isbn");
				String user_id = request.getParameter("user_id");
		    	
		    	int book_id2 = Integer.parseInt(book_id);
		    	int user_id2 = Integer.parseInt(user_id);
				
				// セッションスコープのインスタンス取得
				HttpSession session = request.getSession();
				BookCart bookcart=(BookCart)session.getAttribute("bookcart");
				//int cartcont = (int)session.getAttribute("cartcont");
				
				
				if(bookcart == null) {
					bookcart = new BookCart();
				} 
				Cart cart = new Cart(user_id2, book_id2,name, isbn);
				CartLogic logic= new CartLogic();
				logic.execute(bookcart, cart);
				session.setAttribute("bookcart", bookcart );
				
				doGet(request, response);
	}

}
