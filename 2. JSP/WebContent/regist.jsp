<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <title>regist</title>
  <link type="text/css" rel="stylesheet" href="css/regist.css"/>
  <script>
	function check()
	{
		if(!frm.id.value)
		{
			alert("아이디를 입력하세요");
			frm.id.focus();
			return false;
		}
		else if(frm.id.value.length < 4 || frm.id.value.length > 13)
		{
			alert("아이디는 4~13자로 작성해야 합니다. 다시 입력하세요.");
			frm.id.value="";
			frm.id.focus();
			return false;
		}
		if(!frm.pwd.value)
		{
			alert("비밀번호를 입력하세요.");
			frm.pwd.focus();
			return false;
		}
		else if(frm.pwd.value.length < 6 || frm.pwd.value.length > 20)
		{
			alert("비밀번호를 6~20자로 입력해 주세요.");
			frm.pwd.value="";
			frm.pwd.focus();
			return false;
		}
		else if(frm.pwd.value!=frm.pwd2.value)
		{
			alert("비밀번호가 일치하지 않습니다. 다시 입력하세요.");
			frm.pwd2.value="";
			frm.pwd2.focus();
			return false;
		}
	}
  </script>
 </head>
 <body>
   <div id=header>
	 <img src="images/main_logo.jpg" width=300 height=100>
   </div>
 <h2><b>프로필 입력</b></h2>
 <center>
 <hr>
  <form name="frm" action="registPro.jsp" method="post" onsubmit="return check()">
  <table>
   <tr>
   <th>아이디</th>
   <td>&nbsp;&nbsp;<input type="text" name="id" size="13" placeholder="&nbsp;아이디">
   <input type="button" value="중복확인" onclick="location.href='overLapPro.jsp?id='"></td>
   <td><b>영문소문자, 숫자 조합<br>6~13자 이내(-, _사용가능)</b></td>
   </tr>
   <tr>
   <th>비밀번호</th>
   <td>&nbsp;&nbsp;<input type="password" name="pwd" size="40" placeholder="&nbsp;비밀번호"></td>
   <td><b>영문, 숫자 조합 비밀번호 9~20자<br>특수문자 사용 가능</b></td>
   </tr>
   <tr>
   <th>비밀번호 확인</th>
   <td>&nbsp;&nbsp;<input type="password" name="pwd2" size="40" placeholder="&nbsp;비밀번호 확인"></td>
   </tr>
   <tr>
   <th>이름</th>
   <td>&nbsp;&nbsp;<input type="text" name="name" size="39" placeholder="&nbsp;이름"></td>
   </tr>
   <tr>
   <th>생년월일</th>
   <td>&nbsp;&nbsp;
	 <select name="year">
	 <option value="년도">년도</option>
	 <%for(int y=2018; y>=1980; y--) { //Data.prototype.getFullYear()%>
	 <option value="<%=y%>"><%=y %></option>
	 <%} %>
	 </select>년
	 
     <select name="month">
	 <option value="월">월</option>
	 <% int m;
	 for(m=1; m<=12; m++) { %>
     <option value="<%=m%>"><%=m %></option>
	 <%} %>
     </select>월
     
	 <select name="date">
	 <option value="일">일</option>
	 <%for(int d=1; d<=31; d++) { %>
     <option value="<%=d%>"><%=d %></option>
	 <%} %>
	 </select>일
   </tr>
   <tr>
   <th>성별</th>
   <td>&nbsp;&nbsp;<input type="radio" name="sex" value="남자">남자
   &nbsp;&nbsp;<input type="radio" name="sex" value="여자">여자</td>
   </tr>
   <tr>
   <th rowspan="2">휴대폰</th>
   <td>&nbsp;
    <select>
	<option>Korea(82)</option>
	</select>
   </td>
   </tr>
   <tr>
   <td>&nbsp;&nbsp;<input type="text" name="phoneNum" size="39" placeholder="&nbsp;휴대폰 번호(- 제외)">
   </td>
   </tr>
   <tr>
   <th>이메일</th>
   <td>&nbsp;&nbsp;<input type="text" name="email" size="39" placeholder="&nbsp;이메일"></td>
   </tr>
   </table>
  <hr>
  <div align="center"><input type="submit" value="등록"></div> 
  </form>
  </center>
 </body>
</html>