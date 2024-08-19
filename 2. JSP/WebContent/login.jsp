<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <title>login</title>
  <link rel="stylesheet" href="css/bootstrap.css">
  <link type="text/css" rel="stylesheet" href="css/login.css"/>
  <script>
	function check()
	{
		if(!frm.id.value)
		{
			alert("아이디를 입력하세요");
			frm.id.focus();
			return false; //return true;는 데이터를 넘길 때
		}
		if(!frm.pw.value)
		{
			alert("비밀번호를 입력하세요");
			frm.pw.focus();
			return false; //return true;는 데이터를 넘길 때
		}
		return true;
	}
  </script>
 </head>
 <body>
 <center>
 <div id=center>
 <form action="loginPro.jsp" onsubmit="return check();" method="post" name="frm">
  <table height=100>
  	<tr>
  	 <td rowspan=3 bgcolor="pink" width=250>
  	 <th> &nbsp;&nbsp;I D :&nbsp; </th> <td> <input type="text" name="id"> </td> 
  	 <td rowspan=2><a class="btn btn-default btn-lg pull-right" href="loginPro.jsp">로그인</a></td>
  	 <td rowspan=3 bgcolor="pink" width=250>
  	</tr>
  	<tr>
  	 <th> &nbsp;PW : &nbsp;</th> <td> <input type="password" name="pwd"> </td>
  	</tr>
  	<tr>
  	 <td colspan=3 align=center> <a href=idFind.jsp>I D</a>/<a href=pwFind.jsp>P W 찾기</a> </td>
  	</tr>
  	<tr width=300>
  	 <td rowspan=3 bgcolor="pink"></td>
  	</tr>
  </table>
 </form>
 </div>
 </center>
 <script src="js/jquery-.3.2.1.min.js"></script>
 <script src="js/bootstrap.js"></script>
 </body>
</html>