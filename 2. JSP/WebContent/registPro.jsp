<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "pro.*" %>

<%	
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="article" class="pro.UserDataBean">
	<jsp:setProperty name="article" property="*" />
</jsp:useBean>

<%
	if(Integer.parseInt(article.getMonth()) < 10)
	{
		article.setMonth("0"+article.getMonth());
	}

	if(Integer.parseInt(article.getDate()) < 10)
	{
		article.setDate("0"+article.getDate());
	}
	
	String birth = article.getYear() + article.getMonth() + article.getDate();
	int age = 2019 - Integer.parseInt(article.getYear());
	article.setBirth(birth);
	article.setAge(age);
	
	UserDBBean dbPro = UserDBBean.getInstance();
	dbPro.insertArticle(article);
%>

<script>
		alert("회원가입성공!");
		response.sendRedirect("index.jsp");
</script>	
		