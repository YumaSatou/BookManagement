package dao;

import java.net.URI;
import java.net.URISyntaxException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.ToshoExam;

public class ToshoExamDAO {
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
	
	public static int registerEmploymentExam(ToshoExam exam) {
		String sql = "INSERT INTO book VALUES(default, ?, ?, ?, ?, ?, ?)";
		int result = 0;
				
		try (
				Connection con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				){
			pstmt.setString(1, exam.getName());
			pstmt.setString(2, exam.getPublisher());
			pstmt.setInt(3, exam.getIsbn());
			pstmt.setString(4, exam.getAuthor());
			pstmt.setString(5, exam.getNew_old());
			pstmt.setString(6, exam.getHouse());
			
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
	// ログインしているユーザの全受験状況を取得
	public static List<ToshoExam> selectAlllibrary(){
		
		// 実行するSQL
		String sql = "SELECT * FROM book";
		
		// 返却用のListインスタンス
		List<ToshoExam> result = new ArrayList<>();
				
		try (
				Connection con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				){
			
			
			
			try (ResultSet rs = pstmt.executeQuery()){
				
				while(rs.next()) {
					int id = rs.getInt("id");
					String name = rs.getString("name");
					String publisher = rs.getString("publisher");
					int isbn = rs.getInt("isbn");
					String author = rs.getString("author");
					String new_old = rs.getString("new_old");
					String house = rs.getString("house");
					
					//int account_id = rs.getInt("account_id");
					
				

					ToshoExam exam = new ToshoExam(id, name, publisher, isbn, author, new_old, house);
					result.add(exam);
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}catch (URISyntaxException e) {
			e.printStackTrace();
		}

		// Listを返却する。0件の場合は空のListが返却される。
		return result;
	}

public static int deletelibrary(String isbn) {
		
		
		String sql = "DELETE FROM book WHERE isbn = ?";
		int result = 0;

		try (
				Connection con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);		// 構文解析
				){
			
			pstmt.setString(1, isbn);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (URISyntaxException e) {
			e.printStackTrace();
		} finally {
			System.out.println(result + "件削除しました。");
		}
		return result;
	}

	public static int updatelibrary(int before_ISBN, int isbn, String book_name,String name,String company) {
		String sql = "UPDATE library set isbn = ?,book_name = ?,name = ?,company = ? WHERE isbn = ?";
		int result = 0;
		
		try (
				Connection con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);		// 構文解析
				){
			pstmt.setInt(1,isbn);
			pstmt.setString(2, book_name);
			pstmt.setString(3, name);
			pstmt.setString(4, company);
			pstmt.setInt(5, before_ISBN);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (URISyntaxException e) {
			e.printStackTrace();
		} finally {
			System.out.println(result + "件編集しました。");
		}
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
					int isbn = rs.getInt("isbn");
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
		
// ログインしているユーザの全状況を取得
		public static List<ToshoExam> selectAlluser(){
			
			// 実行するSQL
			String sql = "SELECT * FROM user_management";
			
			// 返却用のListインスタンス
			List<ToshoExam> result = new ArrayList<>();
					
			try (
					Connection con = getConnection();
					PreparedStatement pstmt = con.prepareStatement(sql);
					){
				
				
				
				try (ResultSet rs = pstmt.executeQuery()){
					
					while(rs.next()) {
						int id = rs.getInt("id");
						String name = rs.getString("name");
						String publisher = rs.getString("publisher");
						int isbn = rs.getInt("isbn");
						String author = rs.getString("author");
						String new_old = rs.getString("new_old");
						String house = rs.getString("house");
						
						//int account_id = rs.getInt("account_id");
						
					

						ToshoExam user = new ToshoExam(id, name, publisher, isbn, author, new_old, house);
						result.add(user);
					}
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}catch (URISyntaxException e) {
				e.printStackTrace();
			}

			// Listを返却する。0件の場合は空のListが返却される。
			return result;
		}

}
