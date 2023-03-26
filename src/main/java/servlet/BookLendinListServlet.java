package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ToshoDAO;
import dto.BookLendingList;
/**
 * Servlet implementation class BookLendinListServlet
 */
@WebServlet("/BookLendinListServlet")
public class BookLendinListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookLendinListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		List<BookLendingList> booklendingList = ToshoDAO.BookLendingList();
		
		int result = 0;
		
		// 取得したリストをリクエストスコープに保管(JSPに渡すため)
		request.setAttribute("lendiglist",booklendingList);
		
		String view = "";
		if(result==0) {
			view = "WEB-INF/view/book_lendinglist.jsp";

		}else {
			view = "WEB-INF/view/search_fail.jsp";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
