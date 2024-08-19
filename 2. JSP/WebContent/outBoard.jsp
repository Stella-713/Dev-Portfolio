<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "pro.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%
	int pageSize = 10; // 페이지당 글갯수
	int pageBlock = 5; // 블럭당 페이지수
	String pageNum = request.getParameter("pageNum");
	
	if(pageNum == null)
	{
		pageNum = "1";
	}
	
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * pageSize + 1;
	int endRow = currentPage * pageSize;

	OutBoardDBBean dbPro = OutBoardDBBean.getInstance();
	List<OutBoardDataBean> articleList = dbPro.getArticles(startRow, pageSize);
	int count = dbPro.getArticleCount();
	int number = count - (currentPage - 1)*pageSize;
	
	//if (articleList != null) {
%>

<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>국내</title>
 <link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
 <div class="container">
  <table class="table table-striped">
  	<thead>
  	<tr>
  	 <th>번호</th>
  	 <th>제목</th>
  	 <th>작성자</th>
  	 <th>날짜</th>
  	 <th>조회수</th>
  	</tr>
  	</thead>
  	<tbody>
<% 
	for(int i=0; i<articleList.size(); i++){
		OutBoardDataBean article = articleList.get(i);
%>   
	<tr>
    <td><%=article.getNum() %></td>
    <td>
   	<a href="outContent.jsp?num=<%=article.getNum()%>&pageNum=<%=currentPage%>">
      <%=article.getTitle() %>
    </a>
    </td>
    <td><%=article.getId() %></td>
    <td><%=article.getReg_date() %></td>
    <td><%=article.getReadNum() %></td>
    </tr>
<% } %>  
  	</tbody>
  </table>
 <hr>
 <a class="btn btn-default pull-right" href="outWriteForm.jsp">글쓰기</a>
 
 <div class="text-center">
  <ul class="pagination">
   <li><a href="#">1</a></li>
   <li><a href="#">2</a></li>
   <li><a href="#">3</a></li>
   <li><a href="#">4</a></li>
   <li><a href="#">5</a></li>
  </ul>
 </div>
 </div>
 <script src="js/jquery-.3.2.1.min.js"></script>
 <script src="js/bootstrap.js"></script>
</body>
</html>