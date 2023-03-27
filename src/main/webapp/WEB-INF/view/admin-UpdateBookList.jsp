<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.ToshoExam" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新→旧更新</title>

</head>
<body>

	<h2>更新図書一覧</h2>
	<table border="1">
		<tr>
			<th>ID</th>
			<th>図書名</th>
			<th>新旧</th>
			<th></th>
			
		</tr>
	
		<%
		List<ToshoExam> UpdateBookList = (List<ToshoExam>)request.getAttribute("UpdateBookList");
		for(ToshoExam ee : UpdateBookList){
		%>
		
		<tr>
			<form action="UpdateNewOldServlet" method="post">
			<td><%=ee.getId() %></td>
			<td ><%=ee.getName() %></td>
			<td><%=ee.getNew_old() %></td>
			<td><input type="hidden" name="name" value="<%=ee.getIsbn() %>"><input type="submit" value="更新"></td>
			</form>
		</tr>
		<%
		}
		%>
		</table>
		<h2><a href="TopServlet">戻る</a></h2>
		
</body>