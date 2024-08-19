<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/demo.css" />
		<link rel="stylesheet" type="text/css" href="/resources/css/component.css" />
		<link href="/resources/css/test.css" rel="stylesheet" />
<title>Insert title here</title>
</head>
<body>
<div style="height:100px"></div>
<div align="center">
회원가입 페이지
<form role="form" action="/board/join" method="post">
	
	<table>
		<tr>
			<td>id  </td>
			<td><input type="text"  name="userid" id="userid"></td>
			<td><input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
			<!-- <td><a href="#" id="user_id_checkBtn">중복확인</a></td> -->
		</tr>
		<tr>
			<td>name  </td>
			<td><input type="text" name="username"></td>
		</tr>
		<tr>
			<td>pwd  </td>
			<td><input type="text" name="userpw"></td>
		</tr>
		<tr>
			<td><input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
				<button type="submit" class="button button3">회원가입</button></td>
			<td><button type="button" onclick="location.href='/board/test' " class="button button3">Cancel</button></td>
		</tr>
	</table>

</form>
</div>


</body>
</html>