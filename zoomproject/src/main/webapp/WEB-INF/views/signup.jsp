<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script>

	//비밀번호 확인
	$(function(){
			$('#userPasswd2').blur(function(){
			   if($('#userPasswd').val() != $('#userPasswd2').val()){
			    	if($('#userPasswd2').val()!=''){
			    		alert("비밀번호가 일치하지 않습니다.");
			    	    $('#userPasswd2').val('');
			          $('#userPasswd2').focus();
			       }
			    }
			})  	   
		});
	
	//아이디 중복체크
	function duplicate() {

		var userId = $("#userId").val();

		var submitObj = new Object();
		submitObj.userId = userId;

		$.ajax({
			url : "getIdCnt",
			type : "POST",
			contentType : "application/json;charset=UTF-8",
			data : JSON.stringify(submitObj),
			dataType : "json",
			async : false
		}).done(function(resMap) {
			if (resMap.res == "ok") {
				if (resMap.idCnt == 0) {
					alert("사용할 수 있는 아이디입니다.");
					$("#userId_yn").val("Y");
				} else {
					alert("사용할 수 없는 아이디입니다. 아이디를 다시 선택해주세요.");
					$("#userId_yn").val("N");
				}
			}
		}).fail(function(e) {
			alert("등록 시도에 실패하였습니다." + e);
		}).always(function() {
			pass = false;
		});
	}

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

		if ($("#userId_yn").val() != 'Y') {
			alert("아이디 중복체크를 눌러주세요.");
			$("#userId_yn").focus();

			return false;
		}

		if ($("#userPhone").val() == null || $("#userPhone").val() == "") {
			alert("전화번호를 입력해주세요.");
			$("#userPhone").focus();

			return false;
		}

		if (!tel_rule.test($("#userPhone").val())) {
			alert("전화번호 형식에 맞게 입력해주세요.");
			$("#userPhone").focus();
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

		if (confirm("회원가입하시겠습니까?")) {

			$("#createForm").submit();
			alert("회원가입이 완료되었습니다.");

			return false;
		}
	}
</script>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>찾아ZOOM</title>

<!-- Custom styles for this template-->
<link href="resources/css/sb-admin-2.css" rel="stylesheet">
<link href="resources/css/Home.css" rel="stylesheet">
</head>

<body class="bg-gradient-primary">
				<%@include file="../views/include/mainHeader.jsp"%>
		<form commandName="searchVO" id="createForm"
			action="/signup_action.do" method="post">
			<input type="hidden" id="userId_yn" name="userId_yn" value="N" />

			<div class="container">
				<div class="card o-hidden border-0 shadow-lg my-5">

					<div class="row">
						<div class="col-lg-7">
							<div class="p-5">
								<div class="text-center">
									<h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
								</div>
								<form class="user">
									<div class="form-group row">
										<div class="col-sm-12 mb-3 mb-sm-0">
											<input type="text" class="form-control form-control-user"
												id="userName" name="userName" style="text-align: center;"
												placeholder="이름" />
										</div>
									</div>
									<div class="form-group row">
										<div class="col-sm-8 mb-3 mb-sm-0">
											<input type="text" class="form-control form-control-user"
												id="userId" name="userId" style="text-align: center;"
												placeholder="아이디" />
										</div>
										<div class="col-sm-4 mb-3 mb-sm-0">
											<a href="#" class="btn btn-success btn-icon-split"
												style="text-align: center;"
												onclick="duplicate(); return false;"> <span class="text">중복체크</span>
											</a>
										</div>
									</div>
									<div class="form-group row">
										<div class="col-sm-12 mb-3 mb-sm-0">
											<input type="password" class="form-control form-control-user"
												id="userPasswd" name="userPasswd"
												style="text-align: center;" placeholder="비밀번호" />
										</div>

									</div>
									<div class="form-group row">
										<div class="col-sm-12 mb-3 mb-sm-0">
											<input type="password" class="form-control form-control-user"
												id="userPasswd2" style="text-align: center;"
												placeholder="비밀번호 확인" />
										</div>
									</div>
									<div class="form-group row">
										<div class="col-sm-12 mb-3 mb-sm-0">
											<input type="text" class="form-control form-control-user"
												id="userPhone" name="userPhone" style="text-align: center;"
												placeholder="예)01012341234" />
										</div>
									</div>
									<div class="form-group row">
										<div class="col-sm-12 mb-3 mb-sm-0">
											<input type="text" class="form-control form-control-user"
												id="userEmail" name="userEmail" style="text-align: center;"
												placeholder="example@email.com" />
										</div>
									</div>
									<div class="form-group row">
										<a href="#" class="btn btn-primary btn-user btn-block"
											onclick="fnSubmit(); return false;"> 회원가입 </a>
										<a href="login" class="btn btn-facebook btn-user btn-block">
											이미 계정이 있으신가요? 로그인 </a> 
										<a href="/" class="btn btn-warning btn-user btn-block">
											홈페이지</a>
									</div>
								</form>
									<hr>
									<div class="text-center">
										<a class="small" href="userSearch">Forgot Id/Password?</a>
									</div>
							</div>
							<!-- form 끝 -->
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
				<%@include file="../views/include/mainFooter.jsp"%>
</body>

</html>



