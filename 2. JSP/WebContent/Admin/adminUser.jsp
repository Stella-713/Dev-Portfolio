<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%//회원정보를 보여주는 테이블%>
<%@ page import = "java.sql.*"%>
<%@ page import = "java.util.*" %>
<%@ page import = "pro.*" %>

<%
	UserDBBean dbPro = UserDBBean.getInstance();
	List<UserDataBean> articleList = dbPro.getArticles();
%>
<center>
<h1>회원정보 리스트</h1>
<hr>
<table border=1>
	<tr>
		<td>아이디</td>
		<td>이름</td>
		<td>성별</td>
		<td>생년월일</td>
		<td>나이</td>
		<td>핸드폰번호</td>
		<td>이메일</td>
	</tr>
<% 
	for(int i=0; i<articleList.size(); i++){
		UserDataBean article = articleList.get(i);
%>   
	<tr>
		<td><%=article.getId() %></td>
		<td><%=article.getName() %></td>
		<td><%=article.getSex() %></td>
		<td><%=article.getBirth() %></td>
		<td><%=article.getAge()%></td>
		<td><%=article.getPhoneNum()%></td>
		<td><%=article.getEmail()%></td>
		<td>
			<a href="memberUpdateForm.jsp?userId=<%=article.getId()%>">수정</a>
			<input type="button" onClick="location.href='memberDelete.jsp?userId=<%=article.getId() %>'" value="삭제">
		</td>
	</tr>
<%} %> 
</table>
<hr>
<a href="index.jsp">메인화면으로...</a>
</center>