<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html> 
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="css/bootstrap.css">
<script language="JavaScript" src="script.js"></script>
</head>
<body>  
<center>
<h4>글쓰기</h4>
<br>
<form action="inWritePro.jsp">
<input type="hidden" name="num">
<table width="500" border="1" cellspacing="0" cellpadding="0"  align="center">
   <tr>
    <th  width="70">작성자</th>
    <td> <input type="text" size="40" maxlength="50" name="id"></td>
  </tr>
  <tr>
    <th  width="70">제 목</th>
    <td  width="330">
       <input type="text" size="40" maxlength="50" name="title"></td>
  </tr>
  <tr>
    <th  width="70">내 용</th>
    <td  width="330" >
     <textarea name="content" rows="13" cols="40"></textarea> </td>
  </tr>
  <tr>
    <th  width="70">비밀번호</th>
    <td  width="330" >
     <input type="password" size="8" maxlength="12" name="pwd"> 
	 </td>
  </tr>
<tr>      
 <td colspan=2 align="center"> 
  <input type="submit" value="글쓰기">  
  <input type="reset" value="다시작성">
  <input type="button" value="목록보기" onClick="location.href=inboard.jsp">
</td>
</tr>
</table>    
<script src="js/jquery-.3.2.1.min.js"></script>
<script src="js/bootstrap.js"></script>
</form>
</body>
</html>