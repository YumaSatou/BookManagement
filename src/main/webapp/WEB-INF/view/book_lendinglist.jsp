<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.BookLendingList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>検索結果</title>

</head>
<body>

	<h2>貸出中図書一覧</h2>
	<table border="1">
		<tr>
			<th>図書名</th>
			<th>ISBN</th>
			<th>姓</th>
			<th>名</th>
			<th>メール</th>
			<th>借用日</th>
			<th>返却予定日</th>
			<th></th>	
		</tr>
	
		<%
		List<BookLendingList> lendiglist = (List<BookLendingList>)request.getAttribute("lendiglist");
		for(BookLendingList ll : lendiglist){
		%>
		
		<tr>
			<form action="BookReturnServlet" method="post">
			<td ><%=ll.getBook_name() %></td>
			<td ><%=ll.getIsbn() %></td>
			<td ><%=ll.getSurname() %></td>
			<td ><%=ll.getName() %></td>
			<td ><%=ll.getMail() %></td>
			<td ><%=ll.getBorrow_date() %></td>
			<td ><%=ll.getDue_date() %></td>
			<td><input type="hidden" name="book_id" value="<%=ll.getBook_id() %>"><input type="hidden" name="user_id" value="<%=ll.getUser_id() %>"><input type="submit" value="返却"></td>
			</form>
		</tr>
		<%
		}
		%>
		</table>
		<h2><a href="TopServlet">戻る</a></h2>
		
</body>
</html>