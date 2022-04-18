<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">

<title>JSP AJAX실시간 익명 채팅 사이트</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="js/bootstrap.js"></script>
<script type="text/javascript">
	var lastID = 0;
	function submitFunction() {
		var chatName = $('#chatName').val();
		var chatContent = $('#chatContent').val();
		$.ajax({
			type : "POST",
			url:"./chatSubmitServlet",
			data: {
				chatName : encodeURIComponent(chatName),
				chatContent : encodeURIComponent(chatContent)
			},
			success: function(result) {
				if(result == 1){
					autoClosingAlert('#successMessage', 2000);
				} else if(result == 0){
					autoClosingAlert('#dangerMessage', 2000);
				} else {
					autoClosingAlert('#warningMessage', 2000);
				}
			}
		});
		$('#chatContent').val('');
		//전송 이후 전송한 창의 값을 비워준다.
	}
	function autoClosingAlert(selector, delay){
		var alert = $(selector).alert();
		alert.show();
		window.setTimeout(function(){alert.hide()},delay);
	}
	
	function chatListFunction(type){
		$.ajax({
			type : "POST",
			url:"./chatListServlet",
			data: {
				listType : type,
			},
			success: function(data) {
				if(data == "") return;
				var parsed = JSON.parse(data);
				var result = parsed.result;
				for(var i=0; i<result.length; i++){
					addChat(result[i][0].value, result[i][1].value	, result[i][2].value);
				}
				lastID = Number(parsed.last);
			}
		});
	}
	
	function addChat(chatName, chatContent, chatTime){
		$('#chatList').append('<div class="row">'+
				'<div class="col-lg-12">'+
				'<div class="media">' +
				'<a class="pull-left" href="#">'+
				'<img class="media-object img-circle" src="images/icon.jpg" alt="">' +
				'</a>' +
				'<div class = "media-body">'+
				'<h4 class="media-heading">'+
				chatName+
				'<span class="small pull-right">'+
				chatTime +
				'</span>'+
				'</h4>'+
				'<p>'+
				chatContent +
				'</p>'+
				'</div>'+
				'</div>'+
				'</div>'+
				'</div>'+
				'<hr>'				
				);
		$('#chatList').scrollTop($('#chatList')[0].scrollHeight);
	}
	
	function getInfiniteChat(){
		setInterval(function(){
			chatListFunction(lastID);
		}, 1000);
	}
</script>
</head>
<body>
	<div class="container">
		<div class="container bootstrap snippet">
			<div class="row">
				<div class="col-xs-12">
					<div class="portlet portlet-default">
						<div class="portlet-heading">
							<div class="portlet-title">
								<h4>
									<i class="fa fa-circle text-green"></i>실시간 채팅방
								</h4>
							</div>
							<div class="clearfix"></div>
						</div>
						<div id="chat" class="panel-collapse collapse in">
							<div id="chatList" class="portlet-body chat-widget" style="overflow-y: auto; width: auto; height: 600px;">
								<!-- overflow-y: auto  
								y축이 auto로 -> 글이 작성될 때마다 스크롤바가 생기면서 늘어날 수 있음을 명시함
							-->
							
							
							
							
								<!-- <div class="row">
									<div class="col-lg-12">
										<p class="text-center text-muted small">2022년 04월 17일</p>
									</div>
								</div>

								구간1 start
								<div class="row">
									<div class="col-lg-12">
										<div class="media">
											<a class="pull-left" href="#">
												프로필 이미지를 눌렀을 때 그사람의 프로필로 이동시키는 a링크
												<img class="media-object img-circle" src="images/icon.jpg">
											</a>
											<div class="media-body">
												<h4 class="media-heading">
													홍길동 <span class="small pull-right">오전 11:00</span>
												</h4>
												<p>안녕하세요. 홍길동입니다. 히히</p>
											</div>
										</div>
									</div>
								</div>
								구간1 end
								<hr> -->
								

							</div>
							<div class="portlet-footer">
							
								<div class="row">
									<div class="form-group col-xs-4">
										<input style="height: 40;" type="text" id="chatName" class="form-control" placeholder="이름" maxlength="8">
									</div>
								</div>
								<div class="row" style="height: 90px">
									<div class="form-group col-xs-10">
										<textarea style="height: 80px;" id="chatContent" class="form-control" placeholder="메세지를 입력하세요." maxlength="100"></textarea>
									</div>
									<div class="form-group col-xs-2">
										<button type="button" class="btn btn-default pull-right" onclick="submitFunction();">전송</button>
										<div class="clearfix"></div>
									</div>
								</div>
								
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="alert alert-success" id="successMessage" style="display: none;">
			<strong>메세지 전송에 성공했습니다.</strong>
		</div>
		<div class="alert alert-danger" id="dangerMessage" style="display: none;">
			<strong>이름과 내용을 모두 입력해주세요.</strong>
		</div>
		<div class="alert alert-warning" id="warningMessage" style="display: none;">
			<strong>데이터베이스 오류가 발생했습니다.</strong>
		</div>
	</div>
<!-- 	<button type="button" class="btn btn-default pull-right" onclick = "chatListFunction('ten');">추가</button>-->
<script type="text/javascript">
	$(document).ready(function() {
		chatListFunction('ten');
		getInfiniteChat();
	});
</script>

</body>
</html>