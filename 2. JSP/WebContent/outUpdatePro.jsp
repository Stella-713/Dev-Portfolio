<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "pro.*" %>
<%
	request.setCharacterEncoding("utf-8");
%>
	
<jsp:useBean id="article" class="pro.OutBoardDataBean">
	<jsp:setProperty name="article" property="*" />
</jsp:useBean>

<%
	OutBoardDBBean dbPro = OutBoardDBBean.getInstance();
	dbPro.updateArticle(article);
	response.sendRedirect("outBoard.jsp");
%>