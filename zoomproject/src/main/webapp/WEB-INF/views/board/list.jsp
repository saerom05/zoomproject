<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<%@include file="../include/header.jsp"%>


<section class="content">
	<div class="row">

		<div class="col-md-12">

			<div class="box">
				<div class="box-header with-border">
					<h5 class="pull-left"><a href="/board/list">인천 맛집 리스트</a></h5>
					<button id='newBtn' class="btn btn-primary pull-right">
						<i class="fa fa-pencil"></i> 글 쓰기
					</button>
				</div>

				<div class="box-body">
					<table class="table table-bordered">
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>날짜</th>
							<th>조회</th>
							<th>추천</th>
						</tr>

						<c:forEach items="${list}" var="boardVO">

							<tr>
								<td>${boardVO.no}</td>
								<td><a
									href='/board/readPage${pageMaker.makeSearch(pageMaker.cri.page) }&no=${boardVO.no}'>
										${boardVO.title} <strong>[ ${boardVO.replycnt} ]</strong>
								</a></td>
								<td>${boardVO.writer}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
										value="${boardVO.regdate}" /></td>
								<td><span class="badge bg-blue">${boardVO.viewcnt }</span></td>
								<td><span class="badge bg-red">${boardVO.reccnt }</span></td>
							</tr>

						</c:forEach>

					</table>
				</div>

				<div class="box-footer">

					<div class="text-center">
						<ul class="pagination">

							<c:if test="${pageMaker.prev}">
								<li><a
									href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx">
								<li
									<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="list${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
							</c:if>

						</ul>
					</div>
				</div>
			</div>


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
		</div>
	</div>
</section>


<script>
	var result = '${msg}';

	if (result == 'SUCCESS') {
		alert("처리가 완료되었습니다.");
		location.replace(self.location);
	}
</script>

<script>
	$(document).ready(function() {
		$('#searchBtn').on("click", function(event) {
			self.location = "list"
			+ '${pageMaker.makeQuery(1)}'
			+ "&searchType="
			+ $("select option:selected").val()
			+ "&keyword=" + $('#keywordInput').val();
		});

		$('#newBtn').on("click", function(evt) {
			self.location = "register";
		});

	});
</script>

<%@include file="../include/footer.jsp"%>
