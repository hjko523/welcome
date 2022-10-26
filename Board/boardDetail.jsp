<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
        <!-- jstl -->    
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"      uri="http://java.sun.com/jsp/jstl/functions" %>

<%-- <%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%> 
  이 세줄은 딱히 필요하지 않다--%>
  
<%-- 
 <!-- 내용에서 줄바꿈을 허용 - jstl문법  (이 경우에는 해당 변수를 ${boardVO.content}가 아니라 ${content}로 설정한다) -->
  <% pageContext.setAttribute("newline", "\n"); %>
  <c:set var="content" value="${fn:replace(boardVO.content,newline,'<br>') }" />
 --%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세 화면</title>

<script src="/myproject_new/script/jquery-1.12.4.js"> </script>
<script src="/myproject_new/script/jquery-ui.js"> </script>


</head>

<style>
body {
	font-size:9pt;
}
button {
	font-size:9pt;
}

table {
	width:600px;
	border-collapse:collapse;
	}
th,td {
	border:1px solid #cccccc;
	padding:3px;
}
.input1 {
	width:98%;
}
.textarea {
	width:98%;
	height:70px;
}
</style>

<script>
	function fn_submit() {
		
		// trim() : 앞뒤 공백 제거, java,jsp
		
		// jqeury문법
		if($.trim($("#title").val()) == ""){
			alert("제목을 입력해주세요!");
			$("#title").focus();
			return false;
		}
		
		$("#title").val($.trim($("#title").val())); // 앞뒤공백 제거 
		
		if($.trim($("#pass").val()) == ""){
			alert("암호를 입력해주세요!");
			$("#pass").focus();
			return false;
		}
		
		$("#pass").val($.trim($("#pass").val())); // 앞뒤공백 제거 
		
		/* 	// 자바스크립트 문법
		if(document.frm.title.value == ""){			
			alert("제목을 입력해주세요!");
			document.frm.title.focus();
			return false;
		}
		
		if(document.frm.pass.value == ""){			
			alert("암호를 입력해주세요!");
			document.frm.pass.focus();
			return false;
		}
		 */
		// document.frm.submit(); // 동기전송방식
		 
		
	 	var formData = $("#frm").serialize(); // 폼 그자체를 뜻함
		// ajax : 비동기 전송방식을 가진 jquery의 함수
		$.ajax({			
			
			type:"POST",  //전송타입
			data:formData,
			url:"boardWriteSave.do",
			dataType:"text", 	// return타입
			success: function(data){	// data : controller에서 전해준 매개변수  controller -> "ok" or "fail"
				if(data == "ok"){
					alert("저장완료");
					location = "boardList.do";
				} else {
					alert("저장실패");
				}
			},
			error: function(){	// 시스템 에러
				alert("오류발생");
			}
		});   
	
	}
</script>


<body>

<form id="frm"> 
<table>
	<caption>게시판 상세</caption>
	<tr> 
		<th width="20%">제목</th>
		<td width="80%">${boardVO.title }</td>
	</tr>
	
	<tr>
		<th>글쓴이</th>
		<td>${boardVO.name }</td>
	</tr>
	<tr>
		<th>내용</th>
		<td height="50%">${boardVO.content }</td>
	</tr>
	
	<tr>

		<th>등록일</th>
		<td>${boardVO.rdate }</td>
	</tr>
	<tr>
		<th colspan="2">
			<button type="button" onclick="location='boardList.do'">목록</button>
			<button type="button" onclick="location='boardModifyWrite.do?unq=${boardVO.unq}'">수정</button>
			<button type="button" onclick="location='passWrite.do?unq=${boardVO.unq}'">삭제</button>
		</th>
		
	</tr>
</table>
</form>

</body>
</html>