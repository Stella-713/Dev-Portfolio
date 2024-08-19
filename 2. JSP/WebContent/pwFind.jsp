<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PW 찾기</title>
<link type="text/css" rel="stylesheet" href="css/login.css"/>
 <link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
<center>
<div id=center>
<form action="pwFindPro.jsp" onsubmit="return check();" method="post" name="frm">
  <table>
  	<tr>
  	 <td rowspan=6 bgcolor="pink" width=250></td>
  	 <th> 아이디 : </th> <td> <input type="text" name="id"> <td rowspan=3>
  	 <td rowspan=6 bgcolor="pink" width=250></td>
  	</tr>
  	<tr>
  	 <th> 이  름 : </th> <td> <input type="text" name="name">
  	</tr>
  	<tr>
  	 <th> 이메일 : </th> <td> <input type="text" name="email"> </td>
  	</tr>
  	<tr>
  		<th>새로운 비밀번호 : </th> <td><input type="text" name=pwd1></td>
  	</tr>
	<tr>
  		<th>비밀번호 확인 : </th> <td><input type="text" name=pwd2></td>
  	</tr>
  	<tr>
  		<th rowspan=2><a class="btn btn-default pull-right" href="pwFindPro.jsp">변경</a></th>
  	</tr>
  </table>
 </form>
</div>
</center>
 <script src="js/jquery-.3.2.1.min.js"></script>
 <script src="js/bootstrap.js"></script>
</body>
</html>