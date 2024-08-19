<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ID 찾기</title>
<link type="text/css" rel="stylesheet" href="css/login.css"/>
 <link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
<center>
<div id=center>
<form action="idFindPro.jsp" onsubmit="return check();" method="post" name="frm">
  <table>
  	<tr>
  	 <td rowspan=3 bgcolor="pink" width=250></td>
  	 <th> &nbsp;이  &nbsp;&nbsp;&nbsp;름 : &nbsp;</th> <td> <input type="text" name="name"></td>
  	 <th rowspan=2><a class="btn btn-default btn-lg pull-right" href="idFindPro.jsp">찾기</a></th>
  	 <td rowspan=3 bgcolor="pink" width=250></td>
  	</tr>
  	<tr>
  	 <th> &nbsp;이메일 : &nbsp;</th> <td> <input type="text" name="email"> </td>
  	</tr>
  </table>
 </form>
</div>
</center>
 <script src="js/jquery-.3.2.1.min.js"></script>
 <script src="js/bootstrap.js"></script>
</body>
</html>