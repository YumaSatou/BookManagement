package dao;

import java.net.URI;
import java.net.URISyntaxException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import dto.BookLendingList;
import dto.Tosho;
import dto.ToshoExam;
import util.GenerateHashedPw;
import util.GenerateSalt;

public class ToshoDAO {

	private static Connection getConnection() throws URISyntaxException, SQLException {
		try {
			Class.forName("org.postgresql.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	    URI dbUri = new URI(System.getenv("DATABASE_URL"));

	    String username = dbUri.getUserInfo().split(":")[0];
	    String password = dbUri.getUserInfo().split(":")[1];
	    String dbUrl = "jdbc:postgresql://" + dbUri.getHost() + ':' + dbUri.getPort() + dbUri.getPath();

	    return DriverManager.getConnection(dbUrl, username, password);
	}
	
	public static int registerAccount(Tosho admin_account) {
		String sql = "INSERT INTO admin_management VALUES(default, ?, ?, ?, ?)";
		int result = 0;
		
		// ランダムなソルトの取得(今回は32桁で実装)
		String salt = GenerateSalt.getSalt(32);
		
		// 取得したソルトを使って平文PWをハッシュ
		String hashedPw = GenerateHashedPw.getSafetyPassword(admin_account.getPassword(), salt);
		
		try (
				Connection con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				){
			pstmt.setString(1, admin_account.getName());
			pstmt.setString(2, admin_account.getMail());
			pstmt.setString(3, salt);
			pstmt.setString(4, hashedPw);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (URISyntaxException e) {
			e.printStackTrace();
		} finally {
			System.out.println(result + "件更新しました。");
		}
		return result;
	}
	
	// メールアドレスを元にソルトを取得
	public static String getSalt(String mail) {
		String sql = "SELECT salt FROM admin_management WHERE mail = ?";
		
		try (
				Connection con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				){
			pstmt.setString(1, mail);

			try (ResultSet rs = pstmt.executeQuery()){
				
				if(rs.next()) {
					String salt = rs.getString("salt");
					return salt;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (URISyntaxException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	// ログイン処理
	public static Tosho login(String mail, String hashedPw) {
		String sql = "SELECT * FROM admin_management WHERE mail = ? AND password = ?";
		
		try (
				Connection con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				){
			pstmt.setString(1, mail);
			pstmt.setString(2, hashedPw);

			try (ResultSet rs = pstmt.executeQuery()){
				
				if(rs.next()) {
					int id = rs.getInt("id");
					String name = rs.getString("name");
					String salt = rs.getString("salt");
					
					
					return new Tosho(id, name, mail, salt, null, null);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (URISyntaxException e) {
			e.printStackTrace();
		}
		return null;
	}
	public static List<ToshoExam> selectNewBooklibrary() {
		
		// 返却用変数
		List<ToshoExam> result = new ArrayList<>();

		String sql = "SELECT * FROM book where new_old = '新' ";
		
		try (
				Connection con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				){
			try (ResultSet rs = pstmt.executeQuery()){
				while(rs.next()) {
					
					int id = rs.getInt("id");
					String name = rs.getString("name");
					String publisher = rs.getString("publisher");
					String isbn = rs.getString("isbn");
					String author = rs.getString("author");
					String new_old = rs.getString("new_old");
					String house = rs.getString("house");
					//int account_id = rs.getInt("account_id");
					//String salt = rs.getString("salt");
					//String password = rs.getString("password");
					
					ToshoExam Ac = new ToshoExam(id, name, publisher, isbn, author, new_old, house);
					
					result.add(Ac);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (URISyntaxException e) {
			e.printStackTrace();
		}

		// Listを返却する。0件の場合は空のListが返却される。
		return result;
	}
	
	public static List<ToshoExam> selectAllBook(String name) {
		
		// 返却用変数
		List<ToshoExam> result = new ArrayList<>();

		String sql = "SELECT * FROM book WHERE name like ?";
		
		try (
				Connection con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				){
			pstmt.setString(1, "%"+name+"%");
			try (ResultSet rs = pstmt.executeQuery()){
				
				while(rs.next()) {
					int id = rs.getInt("id");
					String book_name = rs.getString("name");
					String publisher = rs.getString("publisher");
					String isbn = rs.getString("isbn");
					String author = rs.getString("author");
					String new_old = rs.getString("new_old");
					String house = rs.getString("house");
					//int account_id = rs.getInt("account_id");
					//String salt = rs.getString("salt");
					//String password = rs.getString("password");
					
					ToshoExam Ac = new ToshoExam(id, book_name, publisher, isbn, author, new_old, house);
					
					result.add(Ac);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (URISyntaxException e) {
			e.printStackTrace();
		}

		// Listを返却する。0件の場合は空のListが返却される。
		return result;
   }
	
	public static int updateBook(String new_old, String isbn) {
		String sql = "UPDATE book SET new_old=? WHERE isbn=?";
		
		int result = 0;

		try (
				Connection con = getConnection();	// DB接続
				PreparedStatement pstmt = con.prepareStatement(sql);			// 構文解析
				){
			
			Date date = new Date();
			Calendar cal = Calendar.getInstance();
			
			pstmt.setString(1,new_old);
			pstmt.setString(2,isbn);
			
			// SQLの実行(戻り値は更新件数)
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (URISyntaxException e) {
			e.printStackTrace();
		} finally {
			System.out.println(result + "件更新しました。");
		}
		return result;
	}
	
	public static List<BookLendingList> BookLendingList() {
		
		// 返却用変数
		List<BookLendingList> result = new ArrayList<>();

		String sql = "select book.name as book_name, book.isbn,\r\n"
				+ "user_management.surname, user_management.name, user_management.mail,\r\n"
				+ "TO_CHAR(book_lending.borrow_date, 'YYYY/MM/DD HH24:MI') as borrow_date, \r\n"
				+ "book_lending.due_date, book_lending.user_id, book_lending.book_id, book_lending.return_date\r\n"
				+ "from ( book_lending inner join user_management on book_lending.user_id = user_management.user_id )\r\n"
				+ "inner join book on book_lending.book_id = book.id where return_date is null order by borrow_date desc;";
		
		try (
				Connection con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				){
		
			try (ResultSet rs = pstmt.executeQuery()){
				
				while(rs.next()) {
					String book_name = rs.getString("book_name");
					String isbn = rs.getString("isbn");
					String surname = rs.getString("surname");
					String name = rs.getString("name");
					String mail = rs.getString("mail");
					String borrow_date = rs.getString("borrow_date");
					String due_date = rs.getString("due_date");
					int user_id = rs.getInt("user_id");
					int book_id = rs.getInt("book_id");
					String return_date = rs.getString("return_date");
					
					BookLendingList list = new BookLendingList(book_name, isbn, surname, name, mail, borrow_date, due_date, user_id, book_id, return_date);
					
					result.add(list);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (URISyntaxException e) {
			e.printStackTrace();
		}

		// Listを返却する。0件の場合は空のListが返却される。
		return result;
   }
	
	public static int returnBook(int user_id, int book_id) {

		// 発行するSQL
		// ? はプレースホルダといいます。
		// 後の処理で ? に値を埋め込みます。(SQLインジェクション対策)
		String sql = "UPDATE book_lending SET return_date=current_timestamp WHERE return_date is null and user_id=? and book_id=? ";
		
		// 更新件数を格納する変数
		int result = 0;

		try (
				Connection con = getConnection();	// DB接続
				PreparedStatement pstmt = con.prepareStatement(sql);			// 構文解析
				){
			
			// プレースホルダに値を設定(型によってメソッドが違います。)
			// 第1引数：何番目の ? に設定するか(1から数える)
			// 第2引数：設定する値
			
			pstmt.setInt(1,user_id);
			pstmt.setInt(2,book_id);
			
			// SQLの実行(戻り値は更新件数)
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (URISyntaxException e) {
			e.printStackTrace();
		} finally {
			System.out.println(result + "件更新しました。");
		}
		return result;
	}
	
		public static List<BookLendingList> BookHistoryList() {
		
		// 返却用変数
		List<BookLendingList> result = new ArrayList<>();

		String sql = "select book.name as book_name, book.isbn,\r\n"
				+ "user_management.surname, user_management.name, user_management.mail,\r\n"
				+ "TO_CHAR(book_lending.borrow_date, 'YYYY/MM/DD HH24:MI') as borrow_date, \r\n"
				+ "TO_CHAR(book_lending.return_date, 'YYYY/MM/DD HH24:MI') as return_date, \r\n"
				+ "book_lending.due_date, book_lending.user_id, book_lending.book_id \r\n"
				+ "from ( book_lending inner join user_management on book_lending.user_id = user_management.user_id )\r\n"
				+ "inner join book on book_lending.book_id = book.id where return_date is not null order by return_date desc;";
		
		try (
				Connection con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				){
		
			try (ResultSet rs = pstmt.executeQuery()){
				
				while(rs.next()) {
					String book_name = rs.getString("book_name");
					String isbn = rs.getString("isbn");
					String surname = rs.getString("surname");
					String name = rs.getString("name");
					String mail = rs.getString("mail");
					String borrow_date = rs.getString("borrow_date");
					String due_date = rs.getString("due_date");
					int user_id = rs.getInt("user_id");
					int book_id = rs.getInt("book_id");
					String return_date = rs.getString("return_date");
					
					BookLendingList list = new BookLendingList(book_name, isbn, surname, name, mail, borrow_date, due_date, user_id, book_id, return_date);
					
					result.add(list);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (URISyntaxException e) {
			e.printStackTrace();
		}

		// Listを返却する。0件の場合は空のListが返却される。
		return result;
   }
		
		public static List<BookLendingList> selectAllUser(String surname) {
			
			// 返却用変数
			List<BookLendingList> result = new ArrayList<>();

			String sql = "select book.name as book_name, book.isbn,\r\n"
					+ "user_management.surname, user_management.name, user_management.mail,\r\n"
					+ "TO_CHAR(book_lending.borrow_date, 'YYYY/MM/DD HH24:MI') as borrow_date, \r\n"
					+ "book_lending.due_date, book_lending.user_id, book_lending.book_id, book_lending.return_date\r\n"
					+ "from ( book_lending inner join user_management on book_lending.user_id = user_management.user_id )\r\n"
					+ "inner join book on book_lending.book_id = book.id where return_date is null and surname like ?;";
			
			try (
					Connection con = getConnection();
					PreparedStatement pstmt = con.prepareStatement(sql);
					){
				pstmt.setString(1, "%"+surname+"%");
				try (ResultSet rs = pstmt.executeQuery()){
					
					while(rs.next()) {
						String book_name = rs.getString("book_name");
						String isbn = rs.getString("isbn");
						String suruser = rs.getString("surname");
						String name = rs.getString("name");
						String mail = rs.getString("mail");
						String borrow_date = rs.getString("borrow_date");
						String due_date = rs.getString("due_date");
						int user_id = rs.getInt("user_id");
						int book_id = rs.getInt("book_id");
						String return_date = rs.getString("return_date");
						
						BookLendingList Ac = new BookLendingList(book_name, isbn, suruser, name, mail, borrow_date, due_date, user_id, book_id, return_date);
						
						result.add(Ac);
					}
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (URISyntaxException e) {
				e.printStackTrace();
			}

			// Listを返却する。0件の場合は空のListが返却される。
			return result;
	   }
		
		public static List<BookLendingList> SelectAllBookHistory(String surname) {
			// 返却用変数
			List<BookLendingList> result = new ArrayList<>();

			String sql = "select book.name as book_name, book.isbn,\r\n"
					+ "user_management.surname, user_management.name, user_management.mail,\r\n"
					+ "TO_CHAR(book_lending.borrow_date, 'YYYY/MM/DD HH24:MI') as borrow_date, \r\n"
					+ "TO_CHAR(book_lending.return_date, 'YYYY/MM/DD HH24:MI') as return_date, \r\n"
					+ "book_lending.due_date, book_lending.user_id, book_lending.book_id \r\n"
					+ "from ( book_lending inner join user_management on book_lending.user_id = user_management.user_id )\r\n"
					+ "inner join book on book_lending.book_id = book.id where return_date is not null and surname like ?;";
			
			try (
					Connection con = getConnection();
					PreparedStatement pstmt = con.prepareStatement(sql);
					){
				pstmt.setString(1, "%"+surname+"%");
				try (ResultSet rs = pstmt.executeQuery()){
					
					while(rs.next()) {
						String book_name = rs.getString("book_name");
						String isbn = rs.getString("isbn");
						String suruser = rs.getString("surname");
						String name = rs.getString("name");
						String mail = rs.getString("mail");
						String borrow_date = rs.getString("borrow_date");
						String due_date = rs.getString("due_date");
						int user_id = rs.getInt("user_id");
						int book_id = rs.getInt("book_id");
						String return_date = rs.getString("return_date");
						
						BookLendingList Ac = new BookLendingList(book_name, isbn, suruser, name, mail, borrow_date, due_date, user_id, book_id, return_date);
						
						result.add(Ac);
					}
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (URISyntaxException e) {
				e.printStackTrace();
			}

			// Listを返却する。0件の場合は空のListが返却される。
			return result;
	   }
}