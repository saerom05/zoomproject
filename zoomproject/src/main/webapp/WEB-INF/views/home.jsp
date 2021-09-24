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
<!-- js에서 validate를 사용하기 위해 관련 js파일을 추가 -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.min.js"></script>

<!-- 외부문서를 연결시키는 태그, css라는 확장자를 가진 스타일 시트 파일을 만들고 이 파일을 html 문서에 연결-->
<!-- 외부 스타일 시트 연결 -->
<!-- 내부 login.css 스타일 시트 연결 -->
<link rel="stylesheet" href="../resources/css/Home.css?after"
	type="text/css" />
<!--  추가한 부분 -->
<!-- src를 user-credential 없이 요청하도록 명시 -->
<script src="https://kit.fontawesome.com/8eb5905426.js"
	crossorigin="anonymous"></script>
<title>찾아ZOOM</title>
</head>
<style type="text/css"> 
a { text-decoration:none } 
</style> 
<body>
	<div id="wrapper">
	<%@include file="../views/include/mainHeader.jsp"%>
			<!-- 메인화면 -->
		<header id="header">
			<span class="map"> <img src="resources/images/map2.jpg"
				alt="map" /> <a class="btn1" href="#">서울특별시</a> <a class="btn2"
				href="/board/list">인천광역시</a> <a class="btn3" href="#">경기도</a> <a class="btn4"
				href="#">강원도</a> <a class="btn5" href="#">세종시</a> <a class="btn6"
				href="#">대전광역시</a> <a class="btn7" href="#">충청남도</a> <a class="btn8"
				href="#">충청북도</a> <a class="btn9" href="#">경상북도</a> <a class="btn10"
				href="#">대구광역시</a> <a class="btn11" href="#">울산광역시</a> <a
				class="btn12" href="#">부산광역시</a> <a class="btn13" href="#">전라북도</a>
				<a class="btn14" href="#">경상남도</a> <a class="btn15" href="#">광주광역시</a>
				<a class="btn16" href="#">전라남도</a> <a class="btn17" href="#">제주도</a>
			</span>
		</header>
		<!-- 검색창  -->
		<div class="search">
			<input type="text" id="mainSearch"><i class="fas fa-search"></i>
		</div>
		<!-- 메인 부분 -->
		<section id="main">
			<section class="thumbnails">
				<div>
					<a href="/board/readPage?page=1&perPageNum=10&searchType&keyword&no=1017">
						<img src="resources/images/케이크오후.jpg" alt="" /></a>
					<a href="/board/readPage?page=1&perPageNum=10&searchType&keyword&no=1017">
						<h3>케이크오후</h3>
					</a>

					<a href="/board/readPage?page=1&perPageNum=10&searchType&keyword&no=854">
						<img src="resources/images/공단떡볶이.jfif" alt="" /></a>
					<a href="/board/readPage?page=1&perPageNum=10&searchType&keyword&no=854">
						<h3>공단떡볶이</h3>
					</a>

					<a href="/board/readPage?page=2&perPageNum=10&searchType=&keyword=&no=847">
						<img src="resources/images/깨비옥.jpg" alt="" /></a>
					<a href="/board/readPage?page=2&perPageNum=10&searchType=&keyword=&no=847">
						<h3>깨비옥</h3>
					</a>
				</div>
				<div>
					<a href="/board/readPage?page=4&perPageNum=10&searchType=tc&keyword=임파스토&no=4">
						<img src="resources/images/임파스토.jpg" alt="" /></a>
					<a href="/board/readPage?page=4&perPageNum=10&searchType=tc&keyword=임파스토&no=4">
						<h3>임파스토</h3>
					</a>

					<a href="/board/readPage?page=1&perPageNum=10&searchType&keyword&no=853">
						<img src="resources/images/솟구쳐차기.jpg" alt="" /></a>
					<a href="/board/readPage?page=1&perPageNum=10&searchType&keyword&no=853">
						<h3>솟구쳐차기</h3>
					</a>

					<a href="/board/readPage?page=2&perPageNum=10&searchType=&keyword=&no=848">
						<img src="resources/images/짱구네.jpg" alt="" /></a>
					<a href="/board/readPage?page=2&perPageNum=10&searchType=&keyword=&no=848">
						<h3>짱구네</h3>
					</a>

					<a href="/board/readPage?page=1&perPageNum=10&searchType&keyword&no=1018">
						<img src="resources/images/플레이그라운드.jpg" alt="" /></a>
					<a href="/board/readPage?page=1&perPageNum=10&searchType&keyword&no=1018">
						<h3>플레이그라운드 브루어리 탭룸 송도</h3>
					</a>
				</div>
				<div>
					<a href="/board/readPage?page=3&perPageNum=10&searchType=&keyword=&no=840">
						<img src="resources/images/스시사쿠.jfif" alt="" /></a>
					<a href="/board/readPage?page=3&perPageNum=10&searchType=&keyword=&no=840">
						<h3>스시사쿠 (송도점)</h3>
					</a>

					<a href="/board/readPage?page=2&perPageNum=10&searchType=&keyword=&no=849">
						<img src="resources/images/화미소금구이.jfif" alt="" /></a>
					<a href="/board/readPage?page=2&perPageNum=10&searchType=&keyword=&no=849">
						<h3>화미소금구이</h3>
					</a>

					<a href="/board/readPage?page=3&perPageNum=10&searchType=&keyword=&no=841">
						<img src="resources/images/천유향마라향솥.jfif" alt="" /></a>
					<a href="/board/readPage?page=3&perPageNum=10&searchType=&keyword=&no=841">
						<h3>천유향마라향솥</h3>
					</a>
				</div>
			</section>			 
		</section>
			<%@include file="../views/include/mainFooter.jsp"%>
	</div>
</body>
</html>



