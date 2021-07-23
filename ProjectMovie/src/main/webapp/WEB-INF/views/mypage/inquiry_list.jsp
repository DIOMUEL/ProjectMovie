<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<br>
<br>
<br>
<section class="page-section bg-light">
	<input type='hidden' name='memberVo' />

	<div class="container">
		<div class="contact-head">
			<div class="row">
				<%@ include file="../include/menu_side_bar_mypage.jsp"%>
				<div class="col-lg-8 col-12">

					<div class="form-main">
						<div class="title">
							<div class="jumbotron"
								style="background-color:black; font:lighter;">
								<h2 style="color: white;">쪽지 관리</h2>
								

							</div>
						</div>

						<form class="form" method="post" id="frmMyPage">
				
							<div class="row"  id="modifyForm">
								
								<div class="col-12">
									<div class="form-group">
										<label for="msg_sender">제목:<span></span></label> <input
											name="msg_sender" id="msg_sender" type="text"
											value="" class="form-control" >
									</div>
								</div>
							
								
								
								<div class="col-12">
									<div class="form-group">
										<label for="msg_content">내용:<span></span></label> 
										<textarea class="form-control" id="msg_content" name="msg_content" ></textarea>
											
									</div>
								</div>

								


								<div class="col-12" style="margin-top: 20px;">
						
								<div class="form-group button" >
										<input type="button" class="btn btn-primary" id="btn_send"  value="보내기">
															
										<input type="button" class="btn btn-primary" id="btn_main"  value="목록">									
									
								</div>
						
	
							</div>
						</form>
					</div>
				</div>

			</div>
		</div>
	</div>

	<br> <br> <br>

</section>
<%@ include file="../include/footer.jsp"%>