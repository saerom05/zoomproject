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
		if($("#delSubmit").submit(function(){
			var userPasswd = $("#userPasswd").val();

			var submitObj = new Object();
			submitObj.userPasswd = userPasswd;
			
			if ($("#userPasswd").val() == null || $("#userPasswd").val() == "") {                                                                                                                                                                 
				alert("비밀번호를 입력해주세요.");                                                                                                                                                            
				$("#userPasswd").focus();                                                                                                                                                                         
				return false;                                                                                                                                                                                 
			} 
			if(!confirm("정말 회원탈퇴하시겠습니까?")){
				alert("회원탈퇴가 완료되었습니다.");
			}
		}));
	
	
	function duplicate(){
		
 
			$.ajax({
				url : "memberDelete",
				type : "POST",
				dateType : "json",
				data : JSON.stringify(submitObj),
				async : false,
				success : function(data){
					if(data == false){
						alert("패스워드가 틀렸습니다.");
						return;
					}

					if(confirm("회원탈퇴하시겠습니까?")){
						$("#delSubmit").submit();
						alert("회원탈퇴가 완료되었습니다.");
					}
					
					
					
				}
			})
			
			
		}*/
	

		function frmCheck() {   	
			if ($("#userPasswd").val() == null || $("#userPasswd").val() == "") {                                                                                                                                                                 
				alert("비밀번호를 입력해주세요.");                                                                                                                                                            
				$("#userPasswd").focus();                                                                                                                                                                         
				return false;                                                                                                                                                                                 
			} 
			
		}

		function duplicate(){
			if ($("#userPasswd").val() == null || $("#userPasswd").val() == "") {
				alert("비밀번호를 입력해주세요.");
				$("#userPasswd").focus();

				return false;
			}
			
			if (confirm("회원 탈퇴하시겠습니까?")) {

				$("#delForm").submit();
				alert("탈퇴되었습니다.");

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
									<form id="myPage" action="myPage" method="post">
									<div class="form-group row">
										<div class="col-sm-4 mb-3 mb-sm-0">
											<label>이름</label>
										</div>
										<div class="col-sm-2 mb-3 mb-sm-0">
											${member.userName }
										</div>
									</div>
									<hr>
									<div class="form-group row">
										<div class="col-sm-4 mb-3 mb-sm-0">
											<label>아이디</label>
										</div>
										<div class="col-sm-2 mb-3 mb-sm-0">
											${member.userId }
										</div>
									</div>
									<hr>
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
									<hr>
									<div class="form-group row">
										<div class="col-sm-4 mb-3 mb-sm-0">
											<label>Phone</label>
										</div>
										<div class="col-sm-3 mb-3 mb-sm-0">
											${member.userPhone }
										</div>
									</div>	
									<hr>
									<div class="form-group row">
										<div class="col-sm-4 mb-3 mb-sm-0">
											<label>email</label>
										</div>
										<div class="col-sm-4 mb-3 mb-sm-0">
											${member.userEmail }
										</div>
									</div>
									<hr>
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
									 onclick="return frmCheck();">정보 수정</button>
									</form>
									 
									<form action="memberDelete" method="post" id="delForm">
									<hr>
									<div class="text-center">
										<button class="btn btn-facebook btn-user btn-block" 
											type="submit" id="delSubmit" name="delSubmit" 
											onclick="duplicate(); return false;">회원탈퇴</button>
									</div>
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
