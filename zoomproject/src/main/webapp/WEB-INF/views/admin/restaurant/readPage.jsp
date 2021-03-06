<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Review Board</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- Bootstrap 3.3.4 -->
    <link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons -->
    <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
    <link href="/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
  </head>
      <!-- jQuery 2.1.4 -->
    <script src="../../resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>

<script type="text/javascript" src="/resources/js/upload.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<!-- Main content -->
<style type="text/css">
.popup {
	position: absolute;
}

.back {
	background-color: gray;
	opacity: 0.5;
	width: 100%;
	height: 300%;
	overflow: hidden;
	z-index: 1101;
}

.front {
	z-index: 1110;
	opacity: 1;
	boarder: 1px;
	margin: auto;
}

.show {
	position: relative;
	max-width: 1200px;
	max-height: 800px;
	overflow: auto;
}
</style>

<div class='popup back' style="display: none;"></div>
<div id="popup_front" class='popup front' style="display: none;">
	<img id="popup_img">
</div>
        <section class="content-header">
          <h1><a href="../../">??????ZOOM</a></h1>
        </section>
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<!-- /.box-header -->
				<form role="form" action="modifyPage" method="post">
					<input type='hidden' name='no' value="${boardVO.no}"> 
					<input type='hidden' name='page' value="${cri.page}"> 
					<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
					<input type='hidden' name='searchType' value="${cri.searchType}">
					<input type='hidden' name='keyword' value="${cri.keyword}">
				</form>

				<div class="box-body">
					<div class="form-group">
						<label for="exampleInputEmail1">??????</label> <input type="text"
							name='title' class="form-control" value="${boardVO.title}"
							readonly="readonly">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">??????</label>
						<textarea class="form-control" name="content" rows="22" cols="50"
							readonly="readonly">${boardVO.content}</textarea>
					</div>
					<div class="form-group">
						<label for="exampleInputEmail1">?????????</label> <input type="text"
							name="writer" class="form-control" value="${boardVO.writer}"
							readonly="readonly">
					</div>
				</div>
				<!-- /.box-body -->

				<ul class="mailbox-attachments clearfix uploadedList"></ul>

				<div class="box-footer">
					<button type="submit" class="btn btn-warning" id="modifyBtn">
						<i class="fa fa-edit"></i> ??????
					</button>
					<button type="submit" class="btn btn-danger" id="removeBtn">
						<i class="fa fa-trash"></i> ??????
					</button>
					<button type="submit" class="btn btn-primary" id="goListBtn">
						<i class="fa fa-list"></i> ??????
					</button>
					<button type="submit" class="btn btn-success" id="recBtn">
						??????
					</button>
				</div>
			</div>
			<!-- /.box -->
		</div>
		<!--/.col (left) -->
	</div>
	<!-- /.row -->

	<div class="row">
		<div class="col-md-12">

			<div class="box box-success">
				<div class="box-header">
					<h3 class="box-title">
						<i class="fa-fa pencil"></i>?????? ??????
					</h3>
				</div>
				<div class="box-body">
					<p>
						<label for="exampleInputEmail1">?????????</label> <input
							class="form-control" type="text" id="newReplyWriter">
					</p>
					<p>
						<label for="exampleInputEmail1">?????? ??????</label> <input
							class="form-control" type="text" id="newReplyText">
					</p>
				</div>
				<!-- /.box-body -->
				<div class="box-footer">
					<button type="button" class="btn btn-primary" id="replyAddBtn">
						<i class="fa fa-save"></i> ??????
					</button>
				</div>
			</div>

			<!-- The time line -->
			<ul class="timeline">
				<!-- timeline time label -->
				<li class="time-label" id="repliesDiv"><span class="bg-green">
						?????? ?????? <small id='replycntSmall'> [ ${boardVO.replycnt} ] </small>
				</span></li>
			</ul>

			<div class='text-center'>
				<ul id="pagination" class="pagination pagination-sm no-margin ">
				</ul>
			</div>
		</div>
		<!-- /.col -->
	</div>
	<!-- /.row -->


	<!-- Modal -->
	<div id="modifyModal" class="modal" role="dialog" tabindex="-1">
		<div class="modal-dialog" role="document">
			<!--  Modal content -->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title"></h4>
				</div>
				<div class="modal-body">
					<p>
						<input type="text" id="replytext" class="form-control">
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-warning" id="replyModBtn">??????</button>
					<button type="button" class="btn btn-danger" id="replyDelBtn">??????</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal">??????</button>
				</div>
			</div>
		</div>
	</div>

</section>
<!-- /.content -->

<script id="templateAttach" type="text/x-handlebars-template">
<li data-src='{{fullName}}'>
  <div class="mailbox-attachment-name">
  <a href="{{getLink}}">
  <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}">
  </span>
  </a>
  </div>
</li>                
</script>

<script id="template" type="text/x-handlebars-template">
{{#each .}}
<li class="replyLi" data-rno={{rno}}>
<i class="fa fa-comments bg-light"></i>
 <div class="timeline-item" >
  <span class="time">
    <i class="fa fa-clock-o"></i>{{prettifyDate regdate}}
  </span>
  <h3 class="timeline-header"><strong>{{replyer}}</strong></h3>
  <div class="timeline-body">{{replytext}} </div>
    <div class="timeline-footer">
     <a class="btn btn-success btn-xs" 
	    data-toggle="modal" data-target="#modifyModal">??????</a>
    </div>
  </div>			
</li>
{{/each}}
</script>

<script>
	Handlebars.registerHelper("prettifyDate", function(timeValue) {
		var dateObj = new Date(timeValue);
		var year = dateObj.getFullYear();
		var month = dateObj.getMonth() + 1;
		var date = dateObj.getDate();
		return year + "/" + month + "/" + date;
	});

	var printData = function(replyArr, target, templateObject) {

		var template = Handlebars.compile(templateObject.html());

		var html = template(replyArr);
		$(".replyLi").remove();
		target.after(html);

	}

	var no = ${boardVO.no};
	
	var replyPage = 1;
	
	getPage("/replies/" + no + "/1");

	function getPage(pageInfo){
		
		$.getJSON(pageInfo,function(data){
			printData(data.list, $("#repliesDiv") ,$('#template'));
			printPaging(data.pageMaker, $(".pagination"));
			
			$("#modifyModal").modal('hide');
			$("#replycntSmall").html("[ " + data.pageMaker.totalCount +" ]");
			
		});
	}

	var printPaging = function(pageMaker, target) {

		var str = "";

		if (pageMaker.prev) {
			str += "<li><a href='" + (pageMaker.startPage - 1)
					+ "'> << </a></li>";
		}

		for (var i = pageMaker.startPage, len = pageMaker.endPage; i <= len; i++) {
			var strClass = pageMaker.cri.page == i ? 'class=active' : '';
			str += "<li "+strClass+"><a href='"+i+"'>" + i + "</a></li>";
		}

		if (pageMaker.next) {
			str += "<li><a href='" + (pageMaker.endPage + 1)
					+ "'> >> </a></li>";
		}

		target.html(str);
	};

	$("#repliesDiv").on("click", function() {

		if ($(".timeline li").size() > 1) {
			return;
		}
		getPage("/replies/" + no + "/1");

	});
	

	$(".pagination").on("click", "li a", function(event){
		
		event.preventDefault();
		
		replyPage = $(this).attr("href");
		
		getPage("/replies/"+no+"/"+replyPage);
		
	});
	

	$("#replyAddBtn").on("click",function(){
		 
		var replyerObj = $("#newReplyWriter");
		var replytextObj = $("#newReplyText");
		var replyer = replyerObj.val();
		var replytext = replytextObj.val();
		
		$.ajax({
				type:'post',
				url:'/replies/',
				headers: { 
				      "Content-Type": "application/json",
				      "X-HTTP-Method-Override": "POST" },
				dataType:'text',
				data: JSON.stringify({no:no, replyer:replyer, replytext:replytext}),
				success:function(result){
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						alert("?????? ???????????????.");
						replyPage = 1;
						getPage("/replies/"+no+"/"+replyPage );
						replyerObj.val("");
						replytextObj.val("");
					}
		}});
	});

	$(".timeline").on("click", ".replyLi", function(event){
		
		var reply = $(this);
		
		$("#replytext").val(reply.find('.timeline-body').text());
		$(".modal-title").html(reply.attr("data-rno"));
		
	});
	
	$("#replyModBtn").on("click",function(){
		  
		var rno = $(".modal-title").html();
		var replytext = $("#replytext").val();
		  
		$.ajax({
				type:'put',
				url:'/replies/'+rno,
				headers: { 
				      "Content-Type": "application/json",
				      "X-HTTP-Method-Override": "PUT" },
				data:JSON.stringify({replytext:replytext}), 
				dataType:'text', 
				success:function(result){
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						alert("?????? ???????????????.");
						getPage("/replies/"+no+"/"+replyPage );
					}
		}});
	});

	$("#replyDelBtn").on("click",function(){
		  
		var rno = $(".modal-title").html();
		var replytext = $("#replytext").val();
		  
		$.ajax({
				type:'delete',
				url:'/replies/'+rno,
				headers: { 
				      "Content-Type": "application/json",
				      "X-HTTP-Method-Override": "DELETE" },
				dataType:'text', 
				success:function(result){
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						alert("?????? ???????????????.");
						getPage("/replies/"+no+"/"+replyPage );
					}
		}});
	});
	
</script>


<script>
$(document).ready(function(){
	
	var formObj = $("form[role='form']");
	
	console.log(formObj);
	
	$("#modifyBtn").on("click", function(){
		formObj.attr("action", "../restaurant/modifyPage");
		formObj.attr("method", "get");		
		formObj.submit();
	});

	$("#removeBtn").on("click", function(){
		
		var replyCnt =  $("#replycntSmall").html().replace(/[^0-9]/g,"");
		
		if(replyCnt > 0 ){
			alert("????????? ?????? ???????????? ????????? ??? ????????????.");
			return;
		}	
		
		var arr = [];
		$(".uploadedList li").each(function(index){
			 arr.push($(this).attr("data-src"));
		});
		
		if(arr.length > 0){
			$.post("/deleteAllFiles",{files:arr}, function(){
				
			});
		}
		
		formObj.attr("action", "../restaurant/removePage");
		formObj.submit();
	});	
	
	$("#goListBtn ").on("click", function(){
		formObj.attr("method", "get");
		formObj.attr("action", "../restaurant/list");
		formObj.submit();
	});
	
	$("#recBtn").on("click", function() {
		
		formObj.attr("action","../restaurant/recommendPage");
		formObj.submit();
		
		alert("?????? ?????? ?????????????????????.");
	});
	
	
	var no = ${boardVO.no};
	var template = Handlebars.compile($("#templateAttach").html());
	
	$.getJSON("../restaurant/getfile/"+no,function(list){
		$(list).each(function(){
			
			var fileInfo = getFileInfo(this);
			
			var html = template(fileInfo);
			
			 $(".uploadedList").append(html);
			
		});
	});
	

	$(".uploadedList").on("click", ".mailbox-attachment-name a", function(event){
		
		var fileLink = $(this).attr("href");
		
		if(checkImageType(fileLink)) {
			
			event.preventDefault();
					
			var imgTag = $("#popup_img");
			imgTag.attr("src", fileLink);
			
			console.log(imgTag.attr("src"));
					
			$(".popup").show('slow');
			imgTag.addClass("show");		
		}	
	});
	
	$("#popup_img").on("click", function(){
		
		$(".popup").hide('slow');
		
	});	
			
});
</script>


<%@include file="../../include/footer.jsp"%>
