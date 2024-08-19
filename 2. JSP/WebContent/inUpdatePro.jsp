<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "pro.*" %>
<%
	request.setCharacterEncoding("utf-8");
%>
	
<jsp:useBean id="article" class="pro.InBoardDataBean">
	<jsp:setProperty name="article" property="*" />
</jsp:useBean>

<%
	InBoardDBBean dbPro = InBoardDBBean.getInstance();
	dbPro.updateArticle(article);
	response.sendRedirect("inBoard.jsp");
%>