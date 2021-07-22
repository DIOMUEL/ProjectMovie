<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/header.jsp"%>    
	<!-- 포인트 안내-->
	<section class="page-section" id="point">
		<div class="container">
			<div class="text">
					<br>
					<br>
					<br>
					<h3 class="tit mt70"> 멤버십 포인트 제도</h3>

					<!-- benefit-membership -->
					<div class="benefit-membership new mt15">
						<div class="box bg-new-point-save">
							<p class="tit">적립</p>

							<ul class="dot-list">
								<li>영화 예매 시 5&#37; 적립(VIP 최대 10&#37;)</li>
								<li>매점 상품 2&#37; 적립</li>
							</ul>
						</div>

						<div class="box bg-new-point-use">
							<p class="tit">사용</p>

							<ul class="dot-list">
								<li>영화 티켓 또는 매점 구매(부분 사용 불가)</li>
								<li>포토카드 구매</li>
							</ul>
						</div>
					</div>
					<!--// benefit-membership -->
	
					<br>
					<br>
					<br>				
					<h3 class="tit mt70" id="pointSave">포인트 적립</h3>

					<h4 class="tit">포인트 기본 적립</h4>

					<ul class="dot-list">
						<li>영화 티켓 구매 시 유료 결제 금액의 <em class="font-gblue">5~10%</em> 적립
							<ul class="dash-list font-gray">
								<li>일반회원 : 5% 적립</li>
								<li>VIP회원 : 10% 적립 (단, VIP 선정 기준은 5%만 반영)</li>
							</ul>
						</li>
						<li>매점 유료 결제 금액의 <em class="font-gblue">2%</em> 적립</li>
						<li>결제가 완료된 후 적립 예정 포인트로 적립되며 <em class="font-gblue">영화의 경우 상영일 익일, 매점의 경우 구매일 익일</em> 사용 가능한 포인트(가용 포인트) 로 전환됩니다.</li>
						<li>회원이 로그인 후 온라인 서비스를 이용 하거나 현장 매표소, 키오스크에서 멤버십 카드 제시 또는 회원임을 확인 할 수 있는 정보를 제공하여야 포인트가 적립됩니다.</li>
						<li>메가박스 및 제휴사 할인, 포인트 결제 등을 통해 할인 받은 금액을 제외한 실제 고객님께서 현금, 신용카드 등으로 유료 결제한 금액 기준으로 적립됩니다.</li>
						<li>일부 영화, 상품, 극장, 결제 수단의 경우 적립이 되지 않거나 별도의 적립률이 적용될 수 있으며 상세 내용은 해당 상품, 극장 등에 별도 공지합니다.</li>
						<li>VIP 선정 시 기준이 되는 포인트입니다.</li>
						<li>포인트 적립은 티켓에 노출된 영화 시작 시간 이전까지만 가능하며, 영화 상영 및 매점 상품 구매 이후 사후 적립은 불가능합니다.</li>
					</ul>


					<h4 class="tit mt30">기타 적립 안내</h4>
					<ul class="dot-list">
						<li>단체 영화 관람 및 매점 구매를 통해 가격 할인을 받은 경우 포인트는 적립되지 않습니다.</li>
						<li>발행된 관람권은 영화 가격과 무관하게 관람권이 판매된 가격 기준으로 포인트가 적립됩니다.</li>
						<li>모바일 쿠폰(기프티콘, 쇼 등)으로 결제된 티켓은 포인트 적립이 제외됩니다.</li>
						<li>위탁예매사(인터파크, YES24 등)을 통한 티켓 예매 시 회원정보가 동일할 경우 포인트가 적립됩니다.</li>
					</ul>
				
	
				
			</div>
		</div>
	</section>
	<!-- 할인 안내-->
	<section class="page-section" style="background-color:#d3d3d3" id="discount">
		<div class="container">
			<div class="text">
				
					<h3 class="tit mt70" id="pointUse">포인트 사용</h3>

					<h4 class="tit">포인트 사용</h4>

					<ul class="dot-list">
						<li>적립된 포인트는 사용 가능한 보유포인트 내에서 영화, 매점, 포토카드 상품 구매 시 <span class="font-gblue">상품 정가 전액을 기준</span>으로 포인트를 차감하여 사용할 수 있습니다.</li>
					</ul>

					<div class="table-wrap mt10">
						<table class="data-table a-c">

							<colgroup>
								<col style="width:140px;" />
								<col />
								<col />
								<col />
							</colgroup>
							<thead>
								<tr>
									<th scope="col">회원상품</th>
									<th scope="col">구분</th>
									<th scope="col">포인트</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td rowspan="2">영화</td>
									<td>사용 가능 요일</td>
									<td>월~일(요일 무관)</td>
								</tr>
								<tr>
									<td>차감 포인트</td>
									<td>티켓 정가 100%</td>
								</tr>
								<tr>
									<td rowspan="2">매점</td>
									<td>사용 가능 상품</td>
									<td>매점 판매 상품(일부 상품 제외)</td>
								</tr>
								<tr>
									<td>차감<br />포인트</td>
									<td>보유 포인트 내 사용 가능<br />- 최소 1,000 포인트 부터 사용 가능<br />- 10포인트 단위 사용 가능 (키오스크, 모바일오더)<br />※  현장 직원 결제 시 500포인트 단위 사용 가능 </td>
								</tr>
								<tr>
									<td>포토카드</td>
									<td>차감 포인트</td>
									<td>1,000 P</td>
								</tr>
								<tr>
									<td>온라인 스토어</td>
									<td>차감<br />포인트</td>
									<td>상품별 차감 기준 상이 / 일부 상품 제외</td>
								</tr>
							</tbody>
						</table>
					</div>

					<ul class="dot-list mt10">
						<li>차감 예시
							<ul class="dash-list font-gray">
								<li>평일 조조 영화 티켓가 9,000원 관람 시 9,000 포인트 차감</li>
								<li>주말 영화 티켓가 14,000원 관람 시 14,000 포인트 차감</li>
							</ul>
						</li>
						<li>영화 티켓 구매 시
							<ul class="dash-list font-gray">
								<li>포인트는 티켓가 전액 차감되며 현금 또는 신용카드 등 다른 결제 수단과 합산하여 사용할 수 없습니다.</li>
							</ul>
						</li>
						<li>매점 상품 구매시
							<ul class="dash-list font-gray">
								<li>최소 1,000포인트 부터 10포인트 단위 (키오스크, 모바일오더), 500포인트 단위 (현장 직원 결제 시)로 사용 가능합니다.</li>
								<li>포인트 사용 후 남은 금액에 대하여 현금 또는 신용카드 등으로 결제 가능합니다.</li>
							</ul>
						</li>
						<li>제휴사 할인, 포인트 결제 등 할인 수단이 적용된 티켓, 매점 상품은 포인트로 구매하실 수 없습니다.</li>
						<li>오프라인에서 포인트 사용 시 멤버십 카드 또는 앱을 반드시 제시 해야하며, 개인별로 설정된 포인트 비밀번호 인증이 필요합니다.</li>
						<li>특별콘텐트 (오페라, 팝콘클래식, 기획전, GV, 라이브중계 등) 및 일부 영화는 포인트로 영화 관람이 불가합니다.</li>
						<li>매점 상품 중 프로모션 상품, 특가 상품 및 일부 품목은 포인트 사용이 제한되며, 극장에 따라 사용 가능 상품이 상이할 수 있습니다.</li>
						<li>더 부티크 프라이빗 관람 시 포인트 사용이 불가합니다.</li>
					</ul>
					
					<br>
					<br>
					<br>
					<h3 class="tit mt70">유효기간 및 소멸</h3>

					<h4 class="tit">포인트 유효기간</h4>

					<ul class="dot-list">
						<li>기본 적립 포인트 : 적립일로부터 24개월이 지난 해당월 말일  (티켓 및 매점 유료 구매 시)</li>
						<li>선물 받은 포인트 : 선물 받은 날로부터 3개월이 지난 해당월 말일</li>
						<li>이벤트 적립 포인트 : 이벤트 마다 유효기간이 상이(개별 확인 필요)</li>
					</ul>

					<h4 class="tit mt30">포인트 소멸</h4>

					<ul class="dot-list">
						<li>유효기간이 경과된 포인트는 매월 말일 영업 종료 후 포인트가 자동 소멸됩니다.</li>
						<li>소멸 기준은 잔여 가용 포인트 중 유효기간이 가장 짧은 포인트부터 소멸되며, 소멸된 포인트는 복구되지 않습니다.</li>
						<li>
							보유 포인트의 소멸 예정일이 도래할 경우, 포인트 소멸과 관련된 내용을 최소 15일 전에 문자 또는 이메일 등으로 고지합니다.<br />
							또한, 홈페이지 및 모바일 웹/앱 로그인 시 소멸 예정 포인트를 확인하실 수 있습니다.
						</li>
					</ul>
				
			</div>
		</div>
	</section>
	<!-- 멤버쉽 안내 -->
	<section class="page-section" id="membership">
		<div class="container">
			<div class="text">

				<div class="inner-wrap">
					<!-- benefit-vip-selection -->
					<div class="benefit-vip-selection">
						<h3 class="tit">VIP 선정 기준</h3>

						<!-- block -->
						<div class="block">
							<div class="box vip">
								<p class="tit">VIP</p>

								<p class="txt">
									VIP 회원 중 연 1편 이상 유료 관람<br/>
									또는<br/>
									일반 회원 중 3개월간 6편 이상 유료 관람
								</p>
							</div>

							<div class="box vip-p">
								<p class="tit">VIP PREMIUM</p>

								<p class="txt vip-p">
									누적 승급포인트<br/>
									1.1만 포인트 이상
								</p>
							</div>

							<div class="box vvip">
								<p class="tit">VVIP</p>

								<p class="txt vip-p">
									누적 승급포인트<br/>
									2.7만 포인트 이상<br/>
									또는 서로 다른 영화 50편 이상
								</p>
							</div>
						</div>
						<!--// block -->

						<div class="period">
							<p>선정기간 : 2020.01.01 ~ 2020.12.31 (상영일 기준)</p>
							<p>자격기간 : 2021.03.02 ~ 2022.02.28 (상영일 기준)</p>
						</div>

						<ul class="dot-list mt15">
							<li>VIP 등급 선정 기준 및 혜택은 매년 상이할 수 있습니다.</li>
							<li>VIP 회원 혜택은 내부 사정에 의해 변경, 종료될 수 있습니다.</li>
							<li>VIP 추가 5% 적립, VIP DAY 10% 추가 적립, 선물받은 포인트, 이벤트 등으로 적립된 포인트는 VIP 산정에서 제외됩니다.</li>
						</ul>
					</div>
					<!--// benefit-vip-selection -->				
				
			</div>
		</div>
	</section>
	<!-- VIP-->
	<section class="page-section" style="background-color:#d3d3d3" id="vip">
		<div class="container">
			<div class="text">
				
				<!-- benefit-vip-benefit -->
					<div class="benefit-vip-benefit mt70">
						<h3 class="tit">VIP 멤버십 혜택</h3>

						<p class="txt-info">
							<span>VIP 쿠폰북</span>
							<span>회원님의 취향에 따라 원하시는 쿠폰을 선택하세요!</span>
						</p>

						<!-- bg-coupon-block -->
						<div class="bg-coupon-block">
							<div class="box">
								<table>
									<colgroup>
										<col style="width:180px;">
										<col />
									</colgroup>
									<tbody>
										<tr>
											<td>
												<i class="iconset ico-benefit-movie"></i>
											</td>
											<td class="a-l">
												<p class="tit">영화</p>
												<p class="txt">VIP 영화관람 쿠폰</p>
											</td>
										</tr>
									</tbody>
								</table>
							</div>

							<div class="box">
								<table>
									<colgroup>
										<col style="width:180px;">
										<col />
									</colgroup>
									<tbody>
										<tr>
											<td>
												<i class="iconset ico-benefit-cafeteria"></i>
											</td>
											<td class="a-l">
												<p class="tit">매점</p>
												<p class="txt">VIP 매점이용 쿠폰</p>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<!--// bg-coupon-block -->

						<ul class="dot-list mt15">
							<li>본 혜택은 VIP 등급 유지 기간 중 제공됩니다. 직접 쿠폰을 선택하신 후 다운받으셔야 쿠폰을 이용하실 수 있습니다.</li>
							<li>등급 별 VIP 쿠폰 제공이 상이하오니 VIP 쿠폰북 안내를 통해 확인해주세요.</li>
							<li>쿠폰마다 유효 기간이 상이합니다. 유효기간을 꼭 확인해 주세요!</li>
						</ul>

						<p class="txt-info mt40">
							<span>VIP 미션 이벤트</span>
							<span>매월 서로 다른 영화 5회 이상 관람 시 미션 성공 쿠폰 제공!</span>
						</p>

						<!-- benefit-mission -->
						<div class="benefit-mission">
							<table>
								<tbody>
									<tr>
										<td>
											<i class="iconset ico-benefit-mission"></i>
										</td>
										<td>
											<div>
												<p class="tit">VIP, VIP PREMIUM</p>
												<p class="txt">영화 2천원 할인 쿠폰 2매</p>
											</div>

											<div class="mt05">
												<p class="tit">VVIP</p>
												<p class="txt">일반 2D 무료관람 쿠폰 1매</p>
											</div>
										</td>
										<td>
											<i class="iconset ico-plus-circle">+</i>
											콤보 4천원 할인 쿠폰 1매
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!--// benefit-mission -->

						<ul class="dot-list mt15">
							<li>티켓 유료 구매 후 포인트 적립된 티켓 기준으로 서로 다른 영화 관람 편수가 책정됩니다.</li>
							<li>미션 달성 시 제공되는 쿠폰은 매월 10일 제공되며 주말 및 공휴일일 경우 가장 가까운 평일 내 제공됩니다.</li>
							<li>무료 관람권 및 쿠폰의 유효기간은 제공일로부터 익월 말 까지 입니다.</li>
						</ul>

						<p class="txt-info mt40">
							<span>VIP DAY</span>
							<span>매주 수요일 영화 관람 시 포인트 추가 적립!</span>
						</p>

						<div class="benefit-vip-day">
							<table>
								<tbody>
									<tr>
										<td>
											<i class="iconset ico-benefit-coin"></i>
											<p>
												기본적립 5&#37;
											</p>
										</td>
										<td>
											<i class="iconset ico-plus-gray-big">+</i>
										</td>
										<td>
											<i class="iconset ico-benefit-coin"></i>
											<p>
												VIP 추가적립 5&#37;
											</p>
										</td>
										<td>
											<i class="iconset ico-plus-gray-big">+</i>
										</td>
										<td>
											<i class="iconset ico-benefit-coin2"></i>
											<p>
												VIP DAY 추가 적립 10&#37;
											</p>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
			</div>
		</div>
	</section>
<%@ include file="../include/footer.jsp"%>