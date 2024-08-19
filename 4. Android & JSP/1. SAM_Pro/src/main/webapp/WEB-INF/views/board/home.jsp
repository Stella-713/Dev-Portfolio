<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
   <head>
      <meta charset="UTF-8" />
      <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
      <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
      <title>SAM_Pro</title>
      <meta name="description" content="Blueprint: On Scroll Effect Layout" />
      <meta name="keywords" content="on scroll, effect, slide in, layout, template, transition, javascript" />
      <meta name="author" content="Codrops" />
      <link rel="shortcut icon" href="../favicon.ico">
      <link rel="stylesheet" type="text/css" href="/resources/css/demo.css" />
      <link rel="stylesheet" type="text/css" href="/resources/css/component.css" />
      <link href="/resources/css/test.css" rel="stylesheet" />
      <script src="/resources/js/modernizr.custom.js"></script>
      
      <script src="https://code.jquery.com/jquery-latest.js"></script> 
 
    <style>
        
 
   </style>
   </head>
      
<style>
   /* 
   #header {
      width : 100%;
        height : 100%;
        background-color : red;  
        float : center;
   }
   
   #body {
      
      width : 100%;
      height : 1300px;
      background-color : black;
   }
    */
   #footer {
   
      width: 100%;
      height : 140px;
      background-color : red;
   
   }
   
</style>

<body>


   <div class="container">
         <header class="clearfix">   
            <h1>SAM_Pro</h1>
            
            <nav>
              
         
            <ul class="access-menu">
         <li>
            <a href="#" style="width:100%;" align="center">Login & Join</a>
            <ul class="access-submenu">
               <li><a href="#" id="modal1" class="myModal1">Login</a></li>
               <li><a href="#" id="modal2" class="myModal2">Join</a></li>
               
            </ul>
         </li>
         </ul>           
            

            </nav>
         </header>
         
         <div id="cbp-so-scroller" class="cbp-so-scroller">
            <section class="cbp-so-section" style="background: #fff; color:#000">
               <article class="cbp-so-side cbp-so-side-left">
                  <h2>소개</h2>
                  <p>자녀 또는 본인의 스마트폰 앱 사용기록을 <br> 확인할 수 있습니다.
               </article>
               <figure class="cbp-so-side cbp-so-side-right">
                  <img src="/resources/images/intro.JPG" alt="img01">
               </figure>
            </section>
            <section class="cbp-so-section">
               <figure class="cbp-so-side cbp-so-side-left">
                  <img src="/resources/images/human.png" alt="img01">
               </figure>
               <article class="cbp-so-side cbp-so-side-right">
                  <h2>대상</h2>
                  <p>누구든지 쉽게 스마트폰 사용량을 알아 볼 수 있습니다.</p>
               </article>
            </section>
            <section class="cbp-so-section" style="background: #fff; color:#000">
               <article class="cbp-so-side cbp-so-side-left">
                  <h2>기능</h2>
                  <p>CPU와 메모리의 사용량을 확인하여<br>비이상적으로 많이 소모하는 앱에 대해 <br>알림을 보낼 수 있습니다.</p>
               </article>
               <figure class="cbp-so-side cbp-so-side-right">
                  <img src="/resources/images/dev.png" alt="img01">
               </figure>
            </section>
            <section class="cbp-so-section">
               <article align="center">
                  <h2>Developer information</h2>
                  <p>Seojung Kim, Seunghee Park, Chaelin Lee<br> asdf1234@gmail.com</p>
               </article>
            </section>
         </div>
      </div>
      
      
      <div id="myModal1" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
               <table style="width: 100%">
               <form action="/login" method='post'>
                  <tr>
                     <td><input class="form-control" type="text" name="username" placeholder="아이디"></td>
                  </tr>
                  <tr>
                     <td><input class="form-control" type="password" name="password" placeholder="비밀번호"></td>
                  </tr>
                  <tr>
                     <td><button class="button button3" type="submit">로그인</button>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/></td>
                     <td>
                     </form>
                     </td>
                  </tr>
            </table> 
            <div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" onClick="close_pop();">
                <span class="pop_bt" style="font-size: 13pt;" >
                     닫기
                </span>
            </div>
      </div>
 
    </div>
    <!-- -------------------------------------------------------------------- -->
    <div id="myModal2" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
         <form role="form" action="/board/join" method="post" name="join" onsubmit="return check()">
   
         <table style="width: 100%">
            <tr>
               <td style="font-family: 'dotum'">회원가입</td>
            </tr>
            <tr>
               <td><input type="text" class="form-control" name="userid" id="userid" placeholder="아이디"></td>
               <td><input type="button" onClick="idCheck()" value="중복확인"></td>
            </tr>
            <tr>
               <td><input type="text" class="form-control" name="username" placeholder="이름"></td>
            </tr>
            <tr>
               <td><input type="password" class="form-control" name="userpw" placeholder="비밀번호"></td>
            </tr>
            <tr>
               <td><input type="text" class="form-control" name="phoneNum" placeholder="핸드폰번호"></td>
            </tr>
            <tr>
               <td><input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
                  <input type="submit" name="submit" class="button button3" value="가입"></td>
            </tr>
         </table>
      
      </form>
            <div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" onClick="close_pop();">
                <span class="pop_bt" style="font-size: 13pt;" >
                     닫기
                </span>
            </div>
      </div>
 
    </div>

      <script src="/resources/js/classie.js"></script>
      <script src="/resources/js/cbpScroller.js"></script>
      <script src="/resources/js/drop.js"></script>
      <script>
         new cbpScroller( document.getElementById( 'cbp-so-scroller' ) );
      </script>
   
   <script type="text/javascript">
      
      $(function(){
          $("#modal1").click(function(){
             $('#myModal1').show();
          })
      })
      
      $(function(){
          $("#modal2").click(function(){
             $('#myModal2').show();
          })
      })
   
        //팝업 Close 기능
        function close_pop(flag) {
             $('#myModal1').hide();
             $('#myModal2').hide();
        };
        
        function check(){
           if(!document.join.userid.value){
              alert("아이디를 입력하세요");
              join.userid.focus();
              return false;
           }
           if(!document.join.username.value){
              alert("이름를 입력하세요");
              join.username.focus();
              return false;
           }
           if(!document.join.userpw.value){
              alert("비밀번호를 입력하세요");
              join.userpw.focus();
              return false;
           }if(!document.join.phoneNum.value){
              alert("핸드폰 번호를 입력하세요");
              join.phoneNum.focus();
              return false;
           }
           return true;
        }
        
        function idCheck(){
           var form1 = document.join;
           if(!form1.userid.value){
              form1.userid.focus();
              return false;
           }
           var popupX = (window.screen.width / 2) - (200 / 2);
           var popupY= (window.screen.height / 2) - (300 / 2);
           var user_id=form1.userid.value;
           var url = "/board/idCheck?id="+user_id;
           window.open(url,"idCheck","toolbar=no, location=no, status=no, menubar=no, scrollbar=no, resizable=no, width=300, height=180, left="+ popupX +" , top="+ popupY);
           return;
        }
        
      </script>

   </body>
</html>