<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
    <%@ page import="dto.UserList" %>
    <%@ page import="dto.Tosho" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理者画面</title>
</head>
<body>
	<%
	Tosho ac = (Tosho)session.getAttribute("user");
	%>
	
	<h2>モリジョビ図書館</h2>
	
	<h2>管理者管理</h2>
	<a href="RegisterFormServlet">管理者登録</a><br>
	<a href="LogoutServlet">ログアウト</a><br>
	<h2>図書管理</h2>
	<a href="RegisterLibraryServlet">図書登録</a><br>
	<a href="SearchServlet">図書検索</a><br>
	<a href="UpdateLibraryServlet">新→旧更新</a><br>
	<a href="">貸出中図書一覧</a><br>
	<a href="">図書貸出履歴</a><br>
	<a href="">口コミ一覧</a><br>
	
	<h2>検索結果</h2>
	<table border="1">
		<tr>
			<th>UserID</th>
			<th>メール</th>
			<th>姓</th>
			<th>名</th>
			<th>住所</th>
			<th></th>
			
		</tr>
	
		<%
		List<UserList> list = (List<UserList>)request.getAttribute("userlist");
		for(UserList uu : list){
		%>
		
		<tr>
			<form action="BookCartServlet" method="post">
			<td><%=uu.getUser_id() %></td>
			<td ><%=uu.getMail() %></td>
			<td ><%=uu.getSurname()%></td>
			<td><%=uu.getName() %></td>
			<td ><%=uu.getAddress()%></td>
			<td><input type="hidden" name="user_id" value="<%=uu.getUser_id() %>">
			<input type="hidden" name="mail" value="<%=uu.getMail() %>">
			<input type="hidden" name="surname" value="<%=uu.getSurname() %>">
			<input type="hidden" name="name" value="<%=uu.getName() %>">
			<input type="hidden" name="address" value="<%=uu.getAddress() %>">
			<input type="submit" value="貸出処理へ"></td>
			</form>
		</tr>
		<%
		}
		%>
		</table>
	
</body>
</html>