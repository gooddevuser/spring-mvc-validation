<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
	<title>Home</title>
	<style>
	.error { 
		color: red; 
		font-weight: bold; 
	}
	</style>
</head>
<body>
	<br /><br /><br />
	<div style="padding-left:20px">
		<h2>Spring MVC View Demo</h2>
		
		<h3><spring:message code="title_user_info" /></h3>
		<form action="/validation/demo/read-data-1" method="post">
			이름 : <input type="text" name="name" value="홍길동" /><br />
			전화 : <input type="text" name="phone" /><br />
			메일 : <input type="text" name="email" /><br />
			나이 : <input type="text" name="age" /><br />
			<input type="date" />
			<input type="submit" value="전송" />
		</form>
		
		<hr>
		
		<h3>
		<spring:message code="title_user_info" /> 2 
		(<spring:message code="subtitle_user_info" />)
		</h3>
		<form:form id="form2" action="/validation/demo/read-data-2" method="post" modelAttribute="person2">
			이름 : 
			<form:input type="text" path="name" />
			<form:errors path="name" cssClass="error" /><%-- BindingResult의 오류 메시지 출력 --%>
			<br />
			전화 : 
			<form:input type="text" path="phone" />
			<form:errors path="phone" cssClass="error" />
			<br />
			메일 : 
			<form:input type="text" path="email" />
			<form:errors path="email" cssClass="error" />
			<br />
			나이 : 
			<form:input type="text" path="age" />
			<form:errors path="age" cssClass="error" />
			<br />
			<input id="submit-btn2" type="submit" value="전송" />
		</form:form>
		
	</div>
	
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script type="text/javascript">
	$(function() {
		//$('#form2').on('submit', function(event) {
		$('#submit-btn2').on('click', function(event) {

			var valid = true;
			var message = "";

			var name = $('#form2 #name').val();
			/* if (name.length < 8 || name.length > 12) {
				valid = false;
				message += "이름은 8 ~ 12 사이의 영문자와 숫자 조합입니다."
			} */
			var name_re = /^[A-Za-z0-9]{8,12}$/;
			if (!name_re.test(name)) {
				valid = false;
				message += "[이름은 8 ~ 12 사이의 영문자와 숫자 조합입니다.]"
			}

			var email = $('#form2 #email').val();
			var email_re = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			if (!email_re.test(email)) {
				valid = false;
				if (message.length > 0) {
					message += "\r\n";
				}
				message += "[옳바른 이메일 형식이 아닙니다.]";
			}
			
			if (!valid) {
				event.preventDefault(); // 서버로 전송하는 작업 취소
				alert(message);
			}
		});
	});
	</script>
</body>
</html>













