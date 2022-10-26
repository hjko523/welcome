<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 등록 화면</title>

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
			
			// 전송 전 세팅
			type:"POST",  //전송타입
			data:formData,
			url:"boardWriteSave.do",
			dataType:"text", 	// return타입
			
			// 전송 후 세팅
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
<form id="frm">  <!-- ajax로 설정되어 있어서 name, method, action이 필요없다 -->
<!--  <form name="frm" id="frm" method="post" action="boardWriteSave.do"> -->
<table>
	<caption>게시판 등록</caption>
	<tr> <!-- 라벨은 커서의 움직임 등을 편의를 위해 사용가능한 기능 / 라벨의 for와 id가 일치해야 사용이 가능하다-->
		<th width="20%"><label for="title">제목</label></th>
		<td width="80%"><input type="text" name="title" id="title" class="input1"></td>
	</tr>
	<tr>
		<th>암호</th>
		<td><input type="password" name="pass" id="pass"></td>
	</tr>
	<tr>
		<th>글쓴이</th>
		<td><input type="text" name="name" id="name"></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea name="content" id="content" class="textarea"></textarea></td>
	</tr>
	<tr>
		<th colspan="2">
			<button type="submit" onclick="fn_submit();return false;">저장</button>
			<button type="reset">취소</button>
		</th>
		
	</tr>
</table>
</form>

</body>
</html>