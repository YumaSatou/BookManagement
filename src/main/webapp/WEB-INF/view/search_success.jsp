<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.ToshoExam" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>検索結果</title>

</head>
<body>

	<h2>検索結果</h2>
	<table border="1">
		<tr>
			<th>ID</th>
			<th>図書名</th>
			<th>出版社</th>
			<th>ISBN</th>
			<th>著者</th>
			<th>新旧</th>
			
		</tr>
	
		<%
		List<ToshoExam> list = (List<ToshoExam>)request.getAttribute("list");
		for(ToshoExam ee : list){
		%>
		
		<tr>
			<td><%=ee.getId() %></td>
			<td ><%=ee.getName() %></td>
			<td ><%=ee.getPublisher()%></td>
			<td><%=ee.getIsbn() %></td>
			<td ><%=ee.getAuthor()%></td>
			<td><%=ee.getNew_old() %></td>
			<td>削除</td>
		</tr>
		<%
		}
		%>
		</table>
		<h2><a href="TopServlet">戻る</a></h2>
		
</body>
</html>