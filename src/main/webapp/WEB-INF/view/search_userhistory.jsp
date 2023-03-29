<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.BookLendingList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"href="css/search_userhistory.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>利用者検索履歴一覧</title>
</head>
<body>

					<h2>モリジョビ図書館</h2>
	
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class ="container-fluid">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav">
      <li class="nav-item dropdown">
          <a class="nav-link active dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            管理者管理
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
            <li><a class="dropdown-item" href="RegisterFormServlet">管理者登録</a></li>
            <li><a class="dropdown-item" href="LogoutServlet">管理者ログアウト</a></li>
          </ul>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link active dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            図書管理
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
            <li><a class="dropdown-item" href="RegisterLibraryServlet">図書登録</a></li>
            <li><a class="dropdown-item" href="SearchServlet">図書検索</a></li>
            <li><a class="dropdown-item" href="UpdateLibraryServlet">新→旧更新</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="BookLendinListServlet">貸出中図書一覧</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="BookHistoryServlet">図書貸出履歴</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="BookMouthListServlet">口コミ一覧</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
<br><br>
<h3>図書貸出履歴</h3>
	<form action="UserHistoryServlet" method="post">
利用者検索　　<input type="text" name="surname">
<input type="submit" value="検索"><br>
</form>
	
	<table class="table table-dark table-hover">
		<thead>
    		<tr>
      			<th scope="col">図書名</th>
      			<th scope="col">ISBN</th>
      			<th scope="col">姓</th>
      			<th scope="col">名</th>
      			<th scope="col">メール</th>
      			<th scope="col">借用日</th>
      			<th scope="col">返却予定日</th>
      			<th scope="col">返却日</th>
    		</tr>
  		</thead>
		<%
		List<BookLendingList> bookhistoryList = (List<BookLendingList>)request.getAttribute("list");
		for(BookLendingList hh : bookhistoryList){
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
		<h3><a href="TopServlet">戻る</a></h3>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>