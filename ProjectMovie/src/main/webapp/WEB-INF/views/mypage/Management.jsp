<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
	<div class="container">
			<div class="contact-head">
				<div class="row">
					<%@ include file="../include/menu_side_bar_mypage.jsp"%>
					<div class="col-lg-8 col-12">
					
						<div class="form-main">
							<div class="title">
							<div class="jumbotron" style="background-color:rgba(0, 255, 255, 0.8)" >
	
								<h4>My 정보관리</h4>
								<h3>회원 정보 관리</h3>
							</div>
							</div>
							<form class="form" method="post" action="/mypage/modify">
								<div class="row">
									<div class="form-group">

										<label for="exampleInputFile"> 사진 </label> <input
												type="file" class="form-control-file" id="file"  name="file"/>
									</div>
								
									<div class="col-12">
										<div class="form-group">
											<label for="user_id">아이디:<span>*</span></label>
											<input name="user_id" id="user_id" type="text" value="${mypageVo.user_id}" readonly>
										</div>
									</div>
									<div class="col-12">
										<div class="form-group">
											<label for="user_pw">패스워드:<span>*</span></label>
											<input name="user_pw" id="user_pw" type="text" readonly>
										</div>
									</div>
									<div class="col-12">
										<div class="form-group">
											<label for="user_name">이름:<span>*</span></label>
											<input name="user_name" id="user_name" type="text" value="${mypageVo.user_name}" readonly>
										</div>
									</div>
									
									<div class="col-12">
										<div class="form-group">
											<label for="user_email">이메일:<span>*</span></label>
											<input name="user_email" id="user_email" type="email" value="${mypageVo.user_email}" readonly>
										</div>
									</div>
									
									<div class="col-12">
										<div class="form-group">
											<label for="user_point">포인트:<span>*</span></label>
											<input name="user_point" id="user_point" type="text" value="${mypageVo.user_point}" readonly>
										</div>
									</div>
								
															
									<div class="col-12" style="margin-top:20px;">
										<div class="form-group button">
											<a href="/mypage/modify" class="btn" style="color:#fff;">회원 정보수정</a>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
					
				</div>
			</div>
		</div>
<br>
<br>
<br>
<%@ include file="../include/footer.jsp"%>
