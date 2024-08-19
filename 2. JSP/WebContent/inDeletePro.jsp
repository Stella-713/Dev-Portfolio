<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "pro.*" %>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pwd = request.getParameter("pwd");
	InBoardDBBean dbPro = InBoardDBBean.getInstance();
	int check = dbPro.deleteArticle(num, pwd);
	
	if(check == 1) {	// 정상 삭제 라면
		response.sendRedirect("inBoard.jsp");
	}else{
%>
	<script>
		alert("비밀번호가 틀렸습니다! \n 다시 시도해 주세요!");
		history.back();
	</script>	
<%	
	}
%>