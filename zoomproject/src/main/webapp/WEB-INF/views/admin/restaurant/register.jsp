<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>찾아ZOOM</title>
<!-- Custom Stylesheet -->
<link href="../../resources/css/style.css" rel="stylesheet">

<link href="../../resources/css/adminQnAList.css" rel="stylesheet"
	type="text/css" />

<link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet"
	type="text/css" />
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
</head>

<script id="template" type="text/x-handlebars-template">
<li>
  <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
  <div class="mailbox-attachment-info">
	<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
	<a href="{{fullName}}" 
     class="btn btn-default btn-xs pull-right delbtn"><i class="fa fa-fw fa-remove"></i></a>
	</span>
  </div>
</li>                
</script>

<script>
	var template = Handlebars.compile($("#template").html());

	$(".fileDrop").on("dragenter dragover", function(event) {
		event.preventDefault();
	});

	$(".fileDrop").on("drop", function(event) {
		event.preventDefault();

		var files = event.originalEvent.dataTransfer.files;

		var file = files[0];

		var formData = new FormData();

		formData.append("file", file);

		$.ajax({
			url : '/uploadAjax',
			data : formData,
			dataType : 'text',
			processData : false,
			contentType : false,
			type : 'POST',
			success : function(data) {

				var fileInfo = getFileInfo(data);

				var html = template(fileInfo);

				$(".uploadedList").append(html);
			}
		});
	});

	$(".uploadedList").on("click", ".delbtn", function(event) {

		event.preventDefault();

		var that = $(this);

		$.ajax({
			url : "/deleteFile",
			type : "post",
			data : {
				fileName : $(this).attr("href")
			},
			dataType : "text",
			success : function(result) {
				if (result == 'deleted') {
					that.closest("li").remove();
				}
			}
		});
	});

	$("#registerForm").submit(
			function(event) {
				event.preventDefault();

				var that = $(this);

				var str = "";
				$(".uploadedList .delbtn").each(
						function(index) {
							str += "<input type='hidden' name='files[" + index
									+ "]' value='" + $(this).attr("href")
									+ "'> ";
						});

				that.append(str);

				that.get(0).submit();

			});
</script>

<style>
.fileDrop {
	width: 100%;
	height: 200px;
	border: 2px dotted #0b58a2;
}

.fileDrop ul {
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
}
</style>

</head>

<body>

	<!--*******************
        Preloader start
    ********************-->
	<div id="preloader">
		<div class="loader">
			<svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none"
					stroke-width="3" stroke-miterlimit="10" />
            </svg>
		</div>
	</div>
	<!--*******************
        Preloader end
    ********************-->


	<!--**********************************
        Main wrapper start
    ***********************************-->
	<div id="main-wrapper">

		<!--**********************************
            Nav header start
        ***********************************-->
		<div class="nav-header">
			<div class="brand-logo">
				<a href="index.html"> <b class="logo-abbr"><img
						src="../../resources/images/logo.png" alt=""> </b> <span
					class="logo-compact"><img
						src="../../resources/images/logo-compact.png" alt=""></span> <span
					class="brand-title"> <img
						src="../../resources/images/logo-text.png" alt="">
				</span>
				</a>
			</div>
		</div>
		<!--**********************************
            Nav header end
        ***********************************-->

		<!--**********************************
            Header start
        ***********************************-->
		<div class="header">
			<div class="header-content clearfix">
				<div class="header-right">
					<ul class="clearfix">
						<li class="icons dropdown"><a href="../../"> <span>사용자
									페이지</span>
						</a></li>
						<li class="icons dropdown">
							<div class="user-img c-pointer position-relative"
								data-toggle="dropdown">

								<img src="../../resources/images/admin.png" height="40"
									width="40" alt="">
							</div>
							<div class="drop-down dropdown-profile   dropdown-menu">
								<div class="dropdown-content-body">
									<ul>
										<li><a href="../../signout"><i class="icon-key"></i>
												<span>Logout</span></a></li>
									</ul>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<!--**********************************
            Header end ti-comment-alt
        ***********************************-->

		<!--**********************************
            Sidebar start
        ***********************************-->
		<div class="nk-sidebar">
			<div class="nk-nav-scroll">
				<ul class="metismenu" id="menu">
					<li aria-expanded="false"><a class="has-arrow"
						href="../index" aria-expanded="false"> <i
							class="icon-graph menu-icon"></i><span class="nav-text">Dashboard</span>
					</a></li>

					<li class="mega-menu mega-menu-sm" aria-expanded="false"><a
						class="has-arrow" href="../memberList" aria-expanded="false">
							<i class="icon-people"></i><span class="nav-text">회원관리</span>
					</a></li>

					<li aria-expanded="false"><a class="has-arrow"
						href="../qnaList" aria-expanded="false"> <i
							class="icon-speech"></i> <span class="nav-text">게시판관리</span>
					</a></li>

					<li aria-expanded="false"><a class="has-arrow"
						href="../restaurant/list" aria-expanded="false"> <i
							class="icon-arrow-up-circle"></i><span class="nav-text">맛집등록</span>
					</a></li>

				</ul>
			</div>
		</div>
		<!--**********************************
            Sidebar end
        ***********************************-->

		<!--**********************************
            Content body start
        ***********************************-->
		<div class="content-body">
			<!-- row -->
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-body">

								<!--본문 내용-->
								<section class="content">
									<div class="row">
										<div class="col-md-12">
											<h2><a href="../../admin/restaurant/list">인천 맛집 리스트</a></h2>
											<div class="box box-primary">

												<form id='registerForm' role="form" method="post">
													<div class="box-body">
														<div class="form-group">
															<label for="exampleInputEmail1">제목</label> <input
																type="text" name='title' class="form-control">
														</div>
														<div class="form-group">
															<label for="exampleInputPassword1">내용</label>
															<textarea class="form-control" name="content" rows="22"
																cols="50">
															</textarea>
														</div>
														<div class="form-group">
															<label for="exampleInputEmail1">작성자</label> <input
																type="text" name="writer" class="form-control">
														</div>
														<div class="form-group">
															<label for="exampleInputEmail1">사진을 드래그해주세요.</label>
															<div class="fileDrop">
																<ul class="mailbox-attachments clearfix uploadedList">
																</ul>
															</div>
														</div>
													</div>

													<div class="box-footer">
														<button type="submit" class="btn btn-primary">
															<i class="fa fa-save"></i> 등록
														</button>
													</div>
												</form>

											</div>
										</div>
									</div>
								</section>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- #/ container -->
		</div>
		<!--**********************************
            Content body end
        ***********************************-->


		<!--**********************************
            Footer start
        ***********************************-->
		<div class="main_footer">
			<div class="copyright">
				<p>&copy; Untitled. All rights reserved. Design: TEMPLATED. Demo
					Images: Unsplash.</p>
			</div>
		</div>
		<!--**********************************
            Footer end
        ***********************************-->
	</div>
	<!--**********************************
        Main wrapper end
    ***********************************-->

	<!--**********************************
        Scripts
    ***********************************-->
	<script type="text/javascript" src="../../resources/js/upload.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<script src="../../resources/plugins2/common/common.min.js"></script>
	<script src="../../resources/js/custom.min.js"></script>
	<script src="../../resources/js/settings.js"></script>
	<script src="../../resources/js/gleek.js"></script>
	<script src="../../resources/js/styleSwitcher.js"></script>

</body>

</html>