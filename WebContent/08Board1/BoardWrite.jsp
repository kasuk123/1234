<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%-- 글작성 페이지 진입전 로그인 체크하기 --%>
<%
//글쓰기 페이지 진입 전 로그인 되었는지 확인
if(session.getAttribute("USER_ID")==null){
%>
   <script>
   /*
   만약 로그인 되지 않았다면 로그인 페이지로 이동시킨다.
   */
      alert("로그인 후 이용해주십시오.");
      location.href = "../06Session/Login.jsp";
   </script>   
<%
/*
JS코드보다 JSP코드가 우선순위가 높으므로 만약 if문 뒤에
JSP코드가 존재하면 위의 JS코드가 실행되지 않을 수 있다.
그러므로 if문을 벗어나지 못하도록 return을 걸어줘야한다.
*/
   return;
}
%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../common/boardHead.jsp" />
<body>
<div class="container">
   <div class="row">      
      <jsp:include page="../common/boardTop.jsp" />
   </div>
   <div class="row">      
      <jsp:include page="../common/boardLeft.jsp" />
      <div class="col-9 pt-3">
      <!-- ###게시판의 body부분 start###  -->      
         <h3>게시판 - <small>Write(글쓰기)</small></h3>
        
        <script>
        /*
           연습문제] 글쓰기 폼에 빈값이 있는경우 서버로 전송되지
              않도록 아래 validate()함수를 완성하시오.
              모든값이 입력되었다면 WriteProc.jsp로 
              submit 되어야 한다.
        */
        function checkValidate(fm){      
          if(fm.title.value==""){
             alert("제목을 입력하세요");
             fm.title.focus();
             return false;
          }
          if(fm.content.value==""){
             alert("내용을 입력하세요");
             fm.content.focus();
             return false;
          }
       }   
        </script>
        <div class="row mt-3 mr-1">
            <table class="table table-bordered table-striped">
            <form name="writeFrm" method="post" action="WriteProc.jsp" 
               onsubmit="return checkValidate(this);">
            <colgroup>
               <col width="20%"/>
               <col width="*"/>
            </colgroup>
            <tbody>
               <!-- <tr>
                  <th class="text-center align-middle">작성자</th>
                  <td>
                     <input type="text" class="form-control"   style="width:100px;"/>
                  </td>
               </tr>
               <tr>
                  <th class="text-center" 
                     style="vertical-align:middle;">패스워드</th>
                  <td>
                     <input type="password" class="form-control"
                        style="width:200px;"/>
                  </td>
               </tr> -->
               <tr>
                  <th class="text-center"
                     style="vertical-align:middle;">제목</th>
                  <td>
                     <input type="text" class="form-control" 
                        name="title" />
                  </td>
               </tr>
               <tr>
                  <th class="text-center"
                     style="vertical-align:middle;">내용</th>
                  <td>
                     <textarea rows="10" 
                        class="form-control" name="content"></textarea>
                  </td>
               </tr>
              <!--  <tr>
                  <th class="text-center"
                     style="vertical-align:middle;">첨부파일</th>
                  <td>
                     <input type="file" class="form-control" />
                  </td>
               </tr> -->
            </tbody>
            </table>
         </div>
         <div class="row mb-3">
            <div class="col text-right">
               <!-- 각종 버튼 부분 -->
               <button type="submit" class="btn btn-danger">전송하기</button>
               <button type="reset" class="btn btn-dark">Reset</button>
               <button type="button" class="btn btn-warning" onclick="location.href='BoardList.jsp';">리스트보기</button>
            </div>
            </form>
         </div>
         <!-- ###게시판의 body부분 end###  -->      
      </div>
   </div>
   <div class="row border border-dark border-bottom-0 border-right-0 border-left-0"></div>
   <jsp:include page="../common/boardBottom.jsp" />

</div>
</body>
</html>