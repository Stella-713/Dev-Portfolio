<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pro.*" %>
<%
	InBoardDBBean dbPro = InBoardDBBean.getInstance();
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	InBoardDataBean article = dbPro.getArticle(num);
	int ref = article.getRef();
	int re_step = article.getRe_step();
	int re_level = article.getRe_level();
%>
<html> 
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body>  
<center><b>글내용 보기</b>
<br>
<form>
<table width="500" border="1" cellspacing="0" cellpadding="0" align="center">  
  <tr height="30">
    <td align="center" width="125">글번호</td>
    <td align="center" width="125" align="center"><%=article.getNum()%></td>
    <td align="center" width="125">조회수</td>
    <td align="center" width="125" align="center"><%=article.getReadNum() %></td>
  </tr>
  <tr height="30">
    <td align="center" width="125">작성자</td>
    <td align="center" width="125" align="center"><%=article.getId() %></td>
    <td align="center" width="125">작성일</td>
    <td align="center" width="125" align="center"><%=article.getReg_date() %></td>
  </tr>
  <tr height="30">
    <td align="center" width="125">글제목</td>
    <td align="center" width="375" align="center" colspan="3"><%=article.getTitle() %></td>
  </tr>
  <tr>
    <td align="center" width="125">글내용</td>
    <td align="left" width="375" colspan="3"><%=article.getContent() %></td>
  </tr>
  <tr height="30">      
    <td colspan="4" align="center" > 
      <a class="btn btn-default" href="inUpdateForm.jsp?num=<%=article.getNum()%>">수 정</a>
	   &nbsp;&nbsp;&nbsp;&nbsp;
	  <a class="btn btn-default" href="inDeleteForm.jsp?num=<%=article.getNum()%>">삭 제</a>
	   &nbsp;&nbsp;&nbsp;&nbsp;
      <a class="btn btn-default" href="inWriteForm.jsp?num=<%=article.getNum()%>">답 글</a>
	   &nbsp;&nbsp;&nbsp;&nbsp;
      <a class="btn btn-default" href="inboard.jsp">목 록</a>
    </td>
  </tr>
</table>    
</form>      
</body>
</html>