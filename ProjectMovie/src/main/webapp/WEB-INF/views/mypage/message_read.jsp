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
								style="background-color: rgba(0, 255, 255, 0.8)">
								<h4>My 정보관리</h4>
								<h3>회원 정보 관리</h3>

							</div>
						</div>

						<form class="form" method="post" id="frmMyPage">
				
							<div class="row"  id="modifyForm">
								
								<div class="col-12">
									<div class="form-group">
										<label for="user_id">아이디:<span></span></label> <input
											name="user_id" id="user_id" type="text"
											value="${memberVo.user_id }" class="form-control" readonly>
									</div>
								</div>
							
								
								
								<div class="col-12">
									<div class="form-group">
										<label for="user_email">내용:<span></span></label> 
										<textarea class="form-control"></textarea>
											
									</div>
								</div>

								


								<div class="col-12" style="margin-top: 20px;">
									<div class="form-group button">
										<input type="button" class="btn btn-primary" id="btn_modify"  value="목록">				
								
									
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