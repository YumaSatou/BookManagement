<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.BookLendingList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"href="css/book_lendinglist.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>検索結果</title>

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
          <a class="nav-link active" aria-current="page" href="BookHistoryServlet">図書貸出履歴</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="BookMouthListServlet">口コミ一覧</a>
        </li>
      </ul>
    </div>
  </div>
</nav><br>

														
	<h3>貸出中図書一覧</h3>								<form action="UserLendingServlet" method="post">	
														利用者名  <input type="text" name="surname">
														<input type="submit" value="検索"><br><br>
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
            <th></th>
			      <th></th>	
    		</tr>
  		</thead>
	
		<%
		List<BookLendingList> lendiglist = (List<BookLendingList>)request.getAttribute("lendiglist");
		for(BookLendingList ll : lendiglist){
		%>
		
		<tr>
			<td ><%=ll.getBook_name() %></td>
			<td ><%=ll.getIsbn() %></td>
			<td ><%=ll.getSurname() %></td>
			<td ><%=ll.getName() %></td>
			<td ><%=ll.getMail() %></td>
			<td ><%=ll.getBorrow_date() %></td>
			<td ><%=ll.getDue_date() %></td>
			<td>
				<form action="BookReturnServlet" method="post">
					<input type="hidden" name="book_id" value="<%=ll.getBook_id() %>">
					<input type="hidden" name="user_id" value="<%=ll.getUser_id() %>">
					<input type="submit" value="返却">
				</form>
			</td>
			<td>
				<form action="MailServlet" method="post">
					<input type="hidden" name="mail" value="<%=ll.getMail() %>">
					<input type="hidden" name="due_date" value="<%=ll.getDue_date() %>">
					<input type="submit" value="催促メール送信">
				</form>
			</td>
			
		</tr>
		<%
		}
		%>
		</table>
		<h3><a href="TopServlet">戻る</a></h3>
		
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>