<%@page import="model.BbsDAO"%>
<%@page import="model.BbsDTO"%>
<%@page import="util.JavascriptUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 파일명 : DeleteProc.jsp --%>
<%@ include file="../common/isLogin.jsp" %>
<%
//한글처리 안해도 됨
//request.setCharacterEncoding("UTF-8");

String num = request.getParameter("num");

BbsDTO dto = new BbsDTO();
BbsDAO dao = new BbsDAO(application);

//작성자 본인 확인을 위해 기존 게시물의 내용을 가져온다. 
dto = dao.selectView(num);
//세션영역에 저장된 로그인 아이디를 String으로 가져온다. 
String session_id = session.getAttribute("USER_ID").toString();//방법1
//String session_id = (String)session.getAttribute("USER_ID");//방법2
int affected = 0;

//세션영역과 DB상의 작성자가 동일한지 확인하여 true일때는 삭제처리(작성자본인확인)
if(session_id.equals(dto.getId())){
	dto.setNum(num);//dto에 일련번호를 저장한 후 ...
	affected = dao.delete(dto);//delete 메소드 호출
}
else{
	//false일때는 경고창으로 알림후 뒤로가기 처리
	//작성자 본인이 아닌경우...
	JavascriptUtil.jsAlertBack("본인만 삭제가능합니다.", out);
	return;	
}

if(affected==1){
	/*
	삭제이후에는 기존 게시물이 사라지므로 리스트로 이동해서
	삭제된 내역을 확인한다.
	*/
	JavascriptUtil.jsAlertLocation("삭제되었습니다", 
		"BoardList.jsp", out);	
}
else{
	out.println(JavascriptUtil.jsAlertBack("삭제실패하였습니다"));
}
%>


