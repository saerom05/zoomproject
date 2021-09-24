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
<link href="../resources/css/style.css" rel="stylesheet">
<link href="../resources/css/adminQnAList.css" rel="stylesheet" type="text/css" />
 <link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
</head>

<script>
	var result = '${msg}';

	if (result == 'SUCCESS') {
		alert("처리가 완료되었습니다.");
		location.replace(self.location);
	}
</script>

<script>
	$(document).ready(
			function() {

				$('#searchBtn').on(
						"click",
						function(event) {

							self.location = "qnaList"
									+ '${pageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword=" + $('#keywordInput').val();

						});

				$('#newBtn').on("click", function(event) {

					self.location = "register";

				});

			});
</script>
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
						src="../resources/images/logo.png" alt=""> </b> <span
					class="logo-compact"><img
						src="../resources/images/logo-compact.png" alt=""></span> <span
					class="brand-title"> <img
						src="../resources/images/logo-text.png" alt="">
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
						<li class="icons dropdown"><a href="../"> <span>사용자 페이지</span>
						</a></li>
						<li class="icons dropdown">
							<div class="user-img c-pointer position-relative"
								data-toggle="dropdown">

								<img src="../resources/images/admin.png" height="40" width="40"
									alt="">
							</div>
							<div class="drop-down dropdown-profile   dropdown-menu">
								<div class="dropdown-content-body">
									<ul>
										<li><a href="../signout"><i class="icon-key"></i> <span>Logout</span></a></li>
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
						href="../admin/index" aria-expanded="false"> <i
							class="icon-graph menu-icon"></i><span class="nav-text">Dashboard</span>
					</a></li>

					<li class="mega-menu mega-menu-sm" aria-expanded="false"><a
						class="has-arrow" href="../admin/memberList" aria-expanded="false">
							<i class="icon-people"></i><span class="nav-text">회원관리</span>
					</a>
					</li>

					<li aria-expanded="false"><a class="has-arrow"
						href="../admin/qnaList" aria-expanded="false"> <i
							class="icon-speech"></i> <span class="nav-text">게시판관리</span>
					</a>
					</li>

					<li aria-expanded="false"><a class="has-arrow"
						href="../admin/restaurant/list" aria-expanded="false"> <i
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
										<!-- left column -->
										<div class="col-md-12">
										<h2><a href="/admin/qnaList">QnA 게시판</a></h2>
							<div class="box">
				<div class="box-header with-border">
					<button id='newBtn' class="btn btn-primary pull-right">
					<i class="fa fa-pencil"></i> 글 쓰기</button>
				</div>
				<div class="box-body">
					<table class="table table-bordered">
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>날짜</th>
							<th>조회</th>
						</tr>

						<c:forEach items="${list}" var="qnaBoardVO">

							<tr>
								<td>${qnaBoardVO.no}</td>
								<td><a
									href='/admin/readPage${pageMaker.makeSearch(pageMaker.cri.page) }&no=${qnaBoardVO.no}'>
										${qnaBoardVO.title} <strong>[ ${qnaBoardVO.replycnt} ]</strong>
								</a></td>
								<td>${qnaBoardVO.writer}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
										value="${qnaBoardVO.regdate}" /></td>
								<td><span class="badge bg-red">${qnaBoardVO.viewcnt }</span></td>
							</tr>

						</c:forEach>

					</table>
				</div>
				<!-- /.box-body -->


				<div class="box-footer">

					<div class="text-center">
						<ul class="pagination">

							<c:if test="${pageMaker.prev}">
								<li><a
									href="qnaList${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx">
								<li
									<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="qnaList${pageMaker.makeSearch(idx)}">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="qnaList${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
							</c:if>

						</ul>
					</div>

				</div>
				<!-- /.box-footer-->
			</div>
											<!-- general form elements -->
											<div class="from-group col-sm-2">

												<select name="searchType" class="form-control">
													<option value="n"
														<c:out value="${cri.searchType == null?'selected':''}"/>>
														--</option>
													<option value="t"
														<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
														제목</option>
													<option value="c"
														<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
														내용</option>
													<option value="w"
														<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
														작성자</option>
													<option value="tc"
														<c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>
														제목 or 내용</option>
													<option value="cw"
														<c:out value="${cri.searchType eq 'cw'?'selected':''}"/>>
														내용 or 작성자</option>
													<option value="tcw"
														<c:out value="${cri.searchType eq 'tcw'?'selected':''}"/>>
														제목 or 내용 or 작성자</option>
												</select>
											</div>

											<div class="form-group col-sm-10">
												<div class="input-group">
													<input type="text" name='keyword' id="keywordInput"
														class="form-control" value='${cri.keyword }'> <span
														class="input-group-btn">
														<button type="button" class="btn btn-primary btn-flat"
															id="searchBtn">
															<i class="fa fa-search"> 검색</i>
														</button>
													</span>
												</div>
											</div>

											<!--/.col (left) -->

										</div>
										<!-- /.row -->
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
	<script src="../resources/plugins2/common/common.min.js"></script>
	<script src="../resources/js/custom.min.js"></script>
	<script src="../resources/js/settings.js"></script>
	<script src="../resources/js/gleek.js"></script>
	<script src="../resources/js/styleSwitcher.js"></script>

</body>

</html>