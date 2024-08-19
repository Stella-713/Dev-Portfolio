<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>main</title>
	<link type="text/css" rel="stylesheet" href="css/index.css"/>
</head>
<body>
	<div id=header>
		<img src="images/main_logo.jpg" width=300 height=100>
	</div>
	  <nav id=login>
		<ul>
		  <li><a href="login.jsp">login</a></li>&emsp;&emsp;
		  <li><a href="regist.jsp">regist</a></li>
		</ul>
	  </nav>
	<center>
	<div id = content>
	<table>
		<tr>
			<th class=in><a href="inmain.jsp"><img src="images/train.png" width=550 height=550><br><br>국내</a></th>
			<th class=out><a href="outmain.jsp"><img src="images/airplane.png" width=550 height=550><br><br>해외</a></th>
		</tr>
	</table>
	</div>
	</center>
</body>
</html>