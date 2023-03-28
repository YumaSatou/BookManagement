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
<form action="UserHistoryServlet" method="post">
利用者検索　　<input type="text" name="surname"><br>
<input type="submit" value="検索"><br>
</form>
	<h2>図書貸出履歴</h2>
	<table border="1">
		<tr>
			<th>図書名</th>
			<th>ISBN</th>
			<th>姓</th>
			<th>名</th>
			<th>メール</th>
			<th>借用日</th>
			<th>返却予定日</th>
			<th>返却日</th>	
		</tr>
	
		<%
		List<BookLendingList> historyList = (List<BookLendingList>)request.getAttribute("bookhistoryList");
		for(BookLendingList hh : historyList){
		%>
		
		<tr>
			<td ><%=hh.getBook_name() %></td>
			<td ><%=hh.getIsbn() %></td>
			<td ><%=hh.getSurname() %></td>
			<td ><%=hh.getName() %></td>
			<td ><%=hh.getMail() %></td>
			<td ><%=hh.getBorrow_date() %></td>
			<td ><%=hh.getDue_date() %></td>
			<td ><%=hh.getReturn_date() %></td>
		</tr>
		<%
		}
		%>
		</table>
		<h2><a href="TopServlet">戻る</a></h2>
		
</body>
</html>