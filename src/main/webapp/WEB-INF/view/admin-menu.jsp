<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<a href="BookLendinListServlet">貸出中図書一覧</a><br>
	<a href="BookHistoryServlet">図書貸出履歴</a><br>
	<a href="">口コミ一覧</a><br>
	
	<form action="SearchUserServlet" method="post">
	<p>貸出はこちら</p>
	ユーザー名　　<input type="text" name="surname"><br>
	<input type="submit" value="検索"><br>
	</form>
	
</body>
</html>