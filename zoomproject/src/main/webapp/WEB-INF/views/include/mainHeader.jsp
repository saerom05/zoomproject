<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

		<div id="menu">
			<img id="img" src="resources/images/rogo3.png">
			<!-- style="max-width: 25%; height: auto;" -->
			<nav class="menu_nav">
				<c:if test="${member == null}">
					<ul>
						<li><a href="qnaBoard/list">Q&A</a></li>
						<li><a href="login">Login</a></li>
						<li><a href="signup">Join</a></li>
					</ul>
				</c:if>
				<c:if test="${member != null}">
					<ul>
						<c:if test="${member.verify == 9}">
							<li><a href="admin/index">관리자 화면</a></li>
						</c:if>
						<li><a href="myPage">MyPage</a></li>
						<li><a href="qnaBoard/list">Q&A</a></li>
						<li><a href="signout">Logout</a></li>
						<li><a href="signup">Join</a></li>
					</ul>
				</c:if>
			</nav>
		</div>
