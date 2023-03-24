<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="dto.* ,java.util.*"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.UserList" %>
<%
BookCart bookcart = (BookCart)session.getAttribute("bookcart");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>貸出候補画面</title>
</head>
<body>
	<%
	UserList user_account = (UserList)session.getAttribute("user_account");
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
	
	
	<p><%=user_account.getName() %>さんのカート</p>
	<form action="CartBookSearchServlet" method="post">
	図書検索　　図書名<input type="text" name="name"><br>
	<input type="submit" value="検索"><br>
	</form>
	
	
</body>
</html>