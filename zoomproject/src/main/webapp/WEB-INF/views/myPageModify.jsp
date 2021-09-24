<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.min.js"></script>
	
<script type="text/javascript">	
		
</script>
<link rel="stylesheet" href="resources/css/Home.css?after"
	type="text/css" />
<link rel="stylesheet" href="resources/css/sb-admin-2.css"
	type="text/css" />
<script src="https://kit.fontawesome.com/8eb5905426.js"
	crossorigin="anonymous"></script>
<title>찾아ZOOM</title>
</head>
<script type="text/javascript">
/*
	$(function() {
		if(${msg ne null}){
			alert('${msg}');
		};
	});

	$(document).ready(function() {
		var result = '${msg}';

		if(result == 'SUCCESS'){
			alert("처리 완료");
			return false;
		}
	});
		
	
	function frmCheck() {   	
		if ($("#userPasswd").val() == null || $("#userPasswd").val() == "") {                                                                                                                                                                 
			alert("비밀번호를 입력해주세요.");                                                                                                                                                            
			$("#userPasswd").focus();                                                                                                                                                                         
			return false;                                                                                                                                                                                 
		} 
		
	}*/
	
function fnSubmit() {
	var email_rule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;//이메일 정규식
	var tel_rule = /(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/g; //전화번호 정규식

	if ($("#userName").val() == null || $("#userName").val() == "") {
		alert("이름을 입력해주세요.");
		$("#userName").focus();

		return false;
	}

	if ($("#userId").val() == null || $("#userId").val() == "") {
		alert("아이디를 입력해주세요.");
		$("#userId").focus();

		return false;
	}
	
	if ($("#userPhone").val() == null || $("#userPhone").val() == "") {
		alert("전화번호를 입력해주세요.");
		$("#userPhone").focus();

		return false;
	}

	if (!tel_rule.test($("#userPhone").val())) {
		alert("전화번호 형식에 맞게 입력해주세요.");
		return false;
	}

	if ($("#userEmail").val() == null || $("#userEmail").val() == "") {
		alert("이메일을 입력해주세요.");
		$("#userEmail").focus();

		return false;
	}

	if (!email_rule.test($("#userEmail").val())) {
		alert("이메일을 형식에 맞게 입력해주세요.");
		return false;
	}

	if ($("#userPasswd").val() == null || $("#userPasswd").val() == "") {
		alert("비밀번호를 입력해주세요.");
		$("#userPasswd").focus();

		return false;
	}

	if (confirm("회원 정보를 수정하겠습니까?")) {

		$("#myPageModify").submit();
		alert("수정 완료되었습니다.");

		return false;
	}
}
</script>
<body class="bg-gradient-primary">
	<!-- 헤더 -->
	<%@include file="../views/include/mainHeader.jsp"%>
	<!-- 메인 부분  -->
	<div class="container">

		<!-- Outer Row -->
		<div class="row justify-content-center">

			<div class="col-xl-10 col-lg-12 col-md-9">

				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<!-- Nested Row within Card Body -->
						<div class="row">
							<div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
							<div class="col-lg-6">
								<div class="p-5">
									<div class="text-center">
										<h1 class="h4 text-gray-900 mb-4">MyPage</h1>
									</div>
									<hr>
									<form id="myPageModify" action="update_myPage" method="post">
									<div class="form-group row">
										<div class="col-sm-4 mb-3 mb-sm-0">
											<label>이름</label>
										</div>
										<div class="col-sm-8 mb-3 mb-sm-0">
											<input type="text" class="form-control form-control-user"
												id="userName" name="userName" value="${member.userName }"
												required="required" />
										</div>
									</div>
									<div class="form-group row">
										<div class="col-sm-4 mb-3 mb-sm-0">
											<label>아이디</label>
										</div>
										<div class="col-sm-8 mb-3 mb-sm-0">
											<input type="text" class="form-control form-control-user"
												id="userId" name="userId" value="${member.userId }"
												required="required" />
										</div>
									</div>
									<div class="form-group row">
										<div class="col-sm-4 mb-3 mb-sm-0">
											<label>비밀번호</label>
										</div>
										<div class="col-sm-8 mb-3 mb-sm-0">
											<input type="password" class="form-control form-control-user"
												id="userPasswd" name="userPasswd" placeholder="password"
												required="required" />
										</div>
									</div>
									<div class="form-group row">
										<div class="col-sm-4 mb-3 mb-sm-0">
											<label>Phone</label>
										</div>
										<div class="col-sm-8 mb-3 mb-sm-0">
											<input type="text" class="form-control form-control-user"
												id="userPhone" name="userPhone" value="${member.userPhone }"
												required="required" />
										</div>
									</div>	
									<div class="form-group row">
										<div class="col-sm-4 mb-3 mb-sm-0">
											<label>email</label>
										</div>
										<div class="col-sm-8 mb-3 mb-sm-0">
											<input type="text" class="form-control form-control-user"
												id="userEmail" name="userEmail" value="${member.userEmail }"
												required="required" />
										</div>
									</div>
									<div class="form-group row">
										<div class="col-sm-4 mb-3 mb-sm-0">
											<label>가입 날짜</label>
										</div>
										<div class="col-sm-4 mb-3 mb-sm-0">
											${member.regiDate }
										</div>
									</div>
										<button class="btn btn-facebook btn-user btn-block" 
											type="submit" id="modify_btn" name="modify_btn" 
											onclick="fnSubmit(); return false;">수정 완료</button>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../views/include/mainFooter.jsp"%>
</body>
</html>
