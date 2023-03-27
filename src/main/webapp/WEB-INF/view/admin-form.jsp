<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="dto.Tosho" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新規管理者登録画面</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String errorCode = request.getParameter("error");
		if(errorCode != null && errorCode.equals("1")){
			Tosho ac = (Tosho)session.getAttribute("input_data");
	%>
		<p style="color:red">登録に失敗しました。</p>
		<h3>新規会員登録</h3>
		<form action="RegisterExecuteServlet" method="post">
			名前：<input type="text" name="name" value="<%=ac.getName()%>"><br>
			メール：<input type="email" name="email" value="<%=ac.getMail()%>"><br>
			パスワード：<input type="password" name="pw"><br>
			<input type="submit" value="登録"><br>
			<a href="TopServlet">戻る</a>
		</form>
	<%
		} else {
	%>
	<h3>新規会員登録</h3>
	<form action="RegisterExecuteServlet" method="post">
		名前：<input type="text" name="name"><br>
		メール：<input type="email" name="email"><br>
		パスワード：<input type="password" name="pw"><br>
		<input type="submit" value="登録"><br>
		<a href="TopServlet">戻る</a>
	</form>
	<%
		}
	%>
</body>
</html>