<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="pro.*" %>
<%@ page import="java.sql.*" %>

<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	LoginDBBean dbPro = LoginDBBean.getInstance();
	int check = dbPro.LoginCheck(id,pwd);
	int adcheck = dbPro.AdminCheck(id, pwd);
	
	if(adcheck == 1)
	{
		response.sendRedirect("Admin/adminMain.jsp");
	}
	
	else{
		if(check == 1)
		{
			session.setAttribute("sessionId", id);
			%>
			<script>
				alert("로그인 성공!!");
			</script>
			<%
			response.sendRedirect("index2.jsp");
		}
		else
		{
			%>
			<script>
				alert("로그인 실패!! 다시입력하세용");
			</script>
			<%
			response.sendRedirect("login.jsp");
		}	
	}
%>