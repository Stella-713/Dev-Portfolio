<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "pro.*" %>
<%
	String id = request.getParameter("id");
	LoginDBBean dbPro = LoginDBBean.getInstance();
	int check = dbPro.OverLapCheck(id);
	
	if(check == -1)
	{
		%>
		<script>
		alert("사용가능한 아이디입니다.");
		response.sendRedirect("regist.jsp");
		</script>	
		<%
	}
	else if(check == 1)
	{
		%>
		<script>
		alert("사용불가능한 아이디입니다.");
		response.sendRedirect("regist.jsp");
		</script>	
		<%
	}
%>