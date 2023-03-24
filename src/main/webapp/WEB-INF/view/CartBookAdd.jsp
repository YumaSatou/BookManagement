<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.ToshoExam" %>
<%@ page import="dto.UserList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新→旧更新</title>

</head>
<body>
	<%
	UserList user_account = (UserList)session.getAttribute("user_account");
	%>

	<h2>検索結果</h2>
	<table border="1">
		<tr>
			<th>ID</th>
			<th>図書名</th>
			<th>新旧</th>
			<th></th>
			
		</tr>
	
		<%
		List<ToshoExam> CartBookAddList = (List<ToshoExam>)request.getAttribute("list");
		for(ToshoExam aa : CartBookAddList){
		%>
		
		<tr>
			<form action="CartBookAddServlet" method="post">
			<td><%=aa.getId() %></td>
			<td ><%=aa.getName() %></td>
			<td><%=aa.getIsbn() %></td>
			<td><input type="hidden" name="id" value="<%=aa.getId() %>">
			<input type="hidden" name="name" value="<%=aa.getName() %>">
			<input type="hidden" name="isbn" value="<%=aa.getIsbn() %>">
			<input type="hidden" name="user_id" value="<%=user_account.getUser_id() %>">
			<input type="submit" value="カート追加"></td>
			</form>
		</tr>
		<%
		}
		%>
		</table>
		<h2><a href="TopServlet">戻る</a></h2>
		
</body>
</html>