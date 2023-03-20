package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ToshoExamDAO;
import dto.Tosho;
import dto.ToshoExam;

/**
 * Servlet implementation class RegisterCompanyExecuteServlet
 */
@WebServlet("/RegisterLibraryExecuteServlet")
public class RegisterLibraryExecuteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterLibraryExecuteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//処理の始めにログイン状態のチェックを行う。
		HttpSession session = request.getSession();
		Tosho admin_account = (Tosho)session.getAttribute("user");

		if(admin_account == null){
			//セッションの中身がnullであれば不正アクセスと判断し
			//ログイン画面へ戻る
			String view = "./";
			RequestDispatcher dispatcher = request.getRequestDispatcher(view);
			dispatcher.forward(request, response);
			return;
		}
		
		// 入力されたパラメータの取得
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String publisher = request.getParameter("publisher");
		String isbn = request.getParameter("isbn");
		String author = request.getParameter("author");
		String new_old = request.getParameter("new_old");
		String house = request.getParameter("house");
		
		
		
		
		// セッションからログインしているユーザのIDを取得
		//int id = account.getId();
		
		ToshoExam exam = new ToshoExam(-1, name, publisher, isbn, author, new_old, house);
		
		int result = ToshoExamDAO.registerEmploymentExam(exam);

		String view = "";
		if(result==0) {
			view = "WEB-INF/view/admin-register.jsp?error=1";
		} else {
			view = "WEB-INF/view/admin-register-result.jsp";
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
