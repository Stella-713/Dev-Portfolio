<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>

<%@ page import="javax.sql.*,java.sql.*,javax.naming.*" %>


<%
request.setCharacterEncoding("UTF-8");
String f_id=(String)request.getParameter("id");
int check=-1;

PreparedStatement pstmt=null;
String str="";
ResultSet rs = null;

Connection conn=null;
try{
	String jdbcUrl="jdbc:log4jdbc:oracle:thin:@localhost:1521:xe";
	String dbId="test";
	String dbPass="1234";
	Class.forName("net.sf.log4jdbc.sql.jdbcapi.DriverSpy");
	conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
	
	String sql = "select userid from tbl_member where userid='"+f_id+"'";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	if(rs.next()){
		check=1;
	}else{
		check=0;
	}
}catch (Exception e){
	System.out.println(e.getMessage());
}


if(check==1)
{
	f_id=(String)request.getParameter("id");
	String html="/board/idCheck?id="+f_id;
	%>
	<b><font color="red"> <%=f_id%> </font>는 이미 사용중인 아이디입니다.</b>
	<form name="checkForm" method="get" onsubmit="return idCheck()">
		<b>다른 아이디를 선택하세요. </b> <br/> <br/>
		<input type="text" name="id">
		<input type="submit" value="ID중복확인">
	</form>
<%
}
else
{
%><center>
	<b>입력하신 <font color="red"><%=f_id%></font>는 <br/>
	사용하실 수 있는 ID입니다.<br>
	<input type="button" value="닫기" onclick="setid()"></center>
<%
}
%>
<script language="javascript">

	function setid()
	{
		opener.document.join.userid.value="<%=f_id%>";
		window.self.close();
	}
	
	function idCheck(){
    	var form1 = document.checkForm;
    	if(!form1.id.value){
    		form1.id.focus();
    		return false;
    	}
    	return true;
    }
</script>