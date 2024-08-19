<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pro.*" %>
<%@ page import="java.sql.*" %>
    
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	
	LoginDBBean dbPro = LoginDBBean.getInstance();
	String Id = dbPro.IdFind(name, email);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ID 찾기</title>
<link type="text/css" rel="stylesheet" href="css/idFind.css"/>
 <link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
<form action="idFindPro.jsp" onsubmit="return check();" method="post" name="frm">
  <table>
  	<tr>
  	 <th> 이  름 : </th> <td> <input type="text" name="name"></td>
  	</tr>
  	<tr>
  	 <th> 이메일 : </th> <td> <input type="text" name="email"> </td>
  	</tr>
  	<tr>
  		<th> <input type="submit" value="찾기"> </th>
  	</tr>
  </table>
 </form>
회원님의 아이디는 : <%=Id%><br><br>
<form action="pwFind.jsp" method="post">
	<input type="submit" value = "PW찾기">
</form>
 <script src="js/jquery-.3.2.1.min.js"></script>
 <script src="js/bootstrap.js"></script>
</body>
</html>