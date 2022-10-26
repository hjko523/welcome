<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- jstl -->    
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>암호입력화면</title>

<script src="/myproject_new/script/jquery-1.12.4.js"> </script>
<script src="/myproject_new/script/jquery-ui.js"> </script>


</head>

<script>

$(function(){ //jquery의 시작문법
	
	$("#delBtn").click(function(){ // jquery의 버튼클릭 코드	
		
		// password 공백처리
		var pass = $("#pass").val();
		pass = $.trim(pass);
		if(pass == ""){
				alert("암호를 입력해주세요.");
				$("#pass").focus();
				return false;
		}
		
		var sendData = "unq=${unq}&pass=" + pass;
		
		// ajax
		$.ajax({			
			// 전송 전 세팅
			type:"POST",  //전송타입
			data:sendData, // json설정방식
			url:"boardDelete.do",
			dataType:"text", 	// return타입

			// 전송 후 세팅
			success: function(result){	// data : controller에서 전해준 매개변수  controller -> 1
				if(result == "1"){
					alert("삭제완료");
					location = "boardList.do";
				} 
				else if(result == "-1"){
					alert("암호가 일치하지 않습니다.");
				} 
				else {
					alert("삭제실패\n관리자에게 연락해주세요");
				}
			},
			error: function(){	// 시스템 에러
				alert("오류발생");
			} 		
		});
	}); 
});


</script>
<body>

<table>
	<tr>
		<th>암호입력</th>
		<td><input type="password" id="pass"></td>
		<td><button type="button" id="delBtn">삭제하기</button></td>
	</tr>

</table>

</body>
</html>