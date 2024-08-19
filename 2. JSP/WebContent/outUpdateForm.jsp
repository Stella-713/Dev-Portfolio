<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "pro.*" %>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	OutBoardDBBean dbPro = OutBoardDBBean.getInstance();
	OutBoardDataBean article = dbPro.getArticle(num);
%>
<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>
<body>  
<center><b>글수정</b>
<br>
<form action="outUpdatePro.jsp">
<table width="400" border="1" cellspacing="0" cellpadding="0"  align="center">
  <tr>
    <th  width="70" align="center">작성자</th>
    <td>
    	<input type="text" size="10" maxlength="10" name="id" value=<%=article.getId() %> >
		<input type="hidden" name="num" value=<%=article.getNum() %>></td>
  </tr>
  <tr>
    <th  width="70" align="center">제 목</th>
    <td align="left" width="330">
       <input type="text" size="40" maxlength="50" name="title" value=<%=article.getTitle() %>></td>
  </tr>
  <tr>
    <td  width="70" align="center" >내 용</td>
    <td align="left" width="330">
     <textarea name="content" rows="13" cols="40"><%=article.getContent() %></textarea></td>
  </tr>
  <tr>
    <td  width="70" align="center">비밀번호</td>
    <td align="left" width="330" >
     <input type="password" size="8" maxlength="12" name="pwd" value=<%=article.getPwd() %>>
     
	 </td>
  </tr>
  <tr>      
   <td colspan=2 align="center"> 
     <input type="submit" value="글수정" onClick="location.href='outUpdatePro.jsp'">  
     <input type="reset" value="다시작성">
     <input type="button" value="목록보기" onClick="location.href=outContent.jsp">
   </td>
 </tr>
 </table>
</form>
</body>
</html> 