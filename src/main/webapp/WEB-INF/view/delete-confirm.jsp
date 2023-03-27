<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.ToshoExam" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>確認画面</title>
</head>
<body>
		<%
		ToshoExam Tosho = (ToshoExam)session.getAttribute("input_data");
		%>
		
		
		<h2>本当に削除しますか？</h2>
		
		<a href="RegisterdeleteServlet">OK</a><br>
		
</body>
</html>