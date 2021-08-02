<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
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
							<div class="jumbotron" style="background-color: black;">
								<h4 style="color: white;">My 정보관리</h4>
								<h3 style="color: white;">회원 탈퇴</h3>

							</div>
						</div>

						<form class="form" method="post" id="frmMyPage">
							
							


								<div class="col-12">
									<div class="form-group">
										<label for="user_id">아이디:<span></span></label> <input
											name="user_id" id="user_id" type="text"
											value="${memberVo.user_id }" class="form-control" >
									</div>
								</div>
								<div class="col-12">
									<div class="form-group">
										<label for="user_pw">비밀번호:<span></span></label> <input
											name="user_pw" id="user_pw" type="password"
											value="${memberVo.user_pw}" class="form-control">
									</div>
								</div>
								<div class="col-12">
									<div class="form-group">
										<label for="user_name">이름:<span></span></label> <input
											name="user_name" id="user_name" type="text"
											value="${memberVo.user_name }" class="form-control">
									</div>
								</div>
								
								<div class="col-12" style="margin-top: 20px;">
									<div class="form-group button">
										<input type="button" class="btn btn-primary" id="btn_modify"
											 value="회원 탈퇴">
										
											<input type="button" class="btn btn-primary"
												id="btn_modifyOk"  value="취소">
										


									</div>
						</form>
					</div>
				</div>

			</div>
		</div>
	</div>
<%@ include file="../include/footer.jsp"%>