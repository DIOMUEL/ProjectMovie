<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>예매 페이지</title>
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body>
        <!-- 몸통 부분 -->
        <header class="bg-dark py-5">
            <div class="container px-5">
                <div class="row gx-5 justify-content-center">
                    <div class="col-lg-6">
                        <div class="text-center my-5">
                            <h1 class="display-5 fw-bolder text-white mb-2">영화 예매</h1>
                            <p class="lead text-white-50 mb-4">예매하실 상품 정보들을 정확히 입력해 주세요.</p>
                            <div class="d-grid gap-3 d-sm-flex justify-content-sm-center">
                                <a class="btn btn-info btn-lg px-4 me-sm-3" href="/board/mainPage">메인으로</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- 영화 선택 -->
        <section class="py-5 border-bottom" id="features">
            <div class="container px-5 my-5">
                <div class="row gx-5">
                    <div class="col-lg-4 mb-5 mb-lg-0">
                        <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"></div>
                        <h2 class="h4 fw-bolder">영화1</h2>
                        <p>영화1</p>
                        <a class="text-decoration-none" href="#!">
                        <img class="img-fluid" style="width:100%" src=".././resources/mainPage/assets/img/portfolio/movieBack1.jpg" alt="..." />
                        </a>
                    </div>
                    <div class="col-lg-4 mb-5 mb-lg-0">
                        <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"></div>
                        <h2 class="h4 fw-bolder">영화2</h2>
                        <p>영화2</p>
                        <a class="text-decoration-none" href="#!">
                        <img class="img-fluid" style="width:100%" src=".././resources/mainPage/assets/img/portfolio/movieBack2.jpg" alt="..." />
                        </a>
                    </div>
                    <div class="col-lg-4 mb-5 mb-lg-0">
                        <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"></div>
                        <h2 class="h4 fw-bolder">영화3</h2>
                        <p>영화3</p>
                        <a class="text-decoration-none" href="#!">
                        <img class="img-fluid" style="width:100%" src=".././resources/mainPage/assets/img/portfolio/movieBack3.jpg" alt="..." />
                        </a>
                    </div>
                    <div class="col-lg-4 mb-5 mb-lg-0">
                        <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"></div>
                        <h2 class="h4 fw-bolder">영화1</h2>
                        <p>영화1</p>
                        <a class="text-decoration-none" href="#!">
                        <img class="img-fluid" style="width:100%" src=".././resources/mainPage/assets/img/portfolio/movieBack4.jpg" alt="..." />
                        </a>
                    </div>
                    <div class="col-lg-4 mb-5 mb-lg-0">
                        <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"></div>
                        <h2 class="h4 fw-bolder">영화1</h2>
                        <p>영화1</p>
                        <a class="text-decoration-none" href="#!">
                        <img class="img-fluid" style="width:100%" src=".././resources/mainPage/assets/img/portfolio/movieBack5.jpg" alt="..." />
                        </a>
                    </div>
                    <div class="col-lg-4 mb-5 mb-lg-0">
                        <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"></div>
                        <h2 class="h4 fw-bolder">영화1</h2>
                        <p>영화1</p>
                        <a class="text-decoration-none" href="#!">
                        <img class="img-fluid" style="width:100%" src=".././resources/mainPage/assets/img/portfolio/movieBack6.jpg" alt="..." />
                        </a>
                    </div>
                </div>
            </div>
        </section>
        <section class="bg-light py-5 border-bottom">
            <div class="container px-5 my-5">
                <div class="text-center mb-5">
                    <h2 class="fw-bolder">지역 / 좌석 선택</h2>
                    <p class="lead mb-0">상영하실 지역과 좌석을 올바르게 입력해주세요.</p>
                </div>
                <div class="row gx-5 justify-content-center">
                    <div class="col-lg-6 col-xl-4">
                        <div class="card mb-5 mb-xl-0">
                            <div class="card-body p-5">
                                <div class="mb-3">
                                    <span class="display-3 fw-bold">지역 설정</span>
                                </div>
                                <ul class="list-unstyled mb-4">
                                    <li class="mb-2">
                                        <i class="bi bi-check text-primary"></i>
                                        <strong>1 users</strong>
                                    </li>
                                    <li class="mb-2">
                                        <i class="bi bi-check text-primary"></i>
                                        5GB storage
                                    </li>
                                    <li class="mb-2">
                                        <i class="bi bi-check text-primary"></i>
                                        Unlimited public projects
                                    </li>
                                    <li class="mb-2">
                                        <i class="bi bi-check text-primary"></i>
                                        Community access
                                    </li>
                                    <li class="mb-2 text-muted">
                                        <i class="bi bi-x"></i>
                                        Unlimited private projects
                                    </li>
                                    <li class="mb-2 text-muted">
                                        <i class="bi bi-x"></i>
                                        Dedicated support
                                    </li>
                                    <li class="mb-2 text-muted">
                                        <i class="bi bi-x"></i>
                                        Free linked domain
                                    </li>
                                    <li class="text-muted">
                                        <i class="bi bi-x"></i>
                                        Monthly status reports
                                    </li>
                                </ul>
                                <div class="d-grid"><a class="btn btn-dark" href="#!">확인</a></div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-6 col-xl-4">
                        <div class="card mb-5 mb-xl-0">
                            <div class="card-body p-5">
                                <div class="mb-3">
                                    <span class="display-3 fw-bold">좌석 선택</span>
                                </div>
                                <ul class="list-unstyled mb-4">
                                    <li class="mb-2">
                                        <i class="bi bi-check text-primary"></i>
                                        <strong>5 users</strong>
                                    </li>
                                    <li class="mb-2">
                                        <i class="bi bi-check text-primary"></i>
                                        5GB storage
                                    </li>
                                    <li class="mb-2">
                                        <i class="bi bi-check text-primary"></i>
                                        Unlimited public projects
                                    </li>
                                    <li class="mb-2">
                                        <i class="bi bi-check text-primary"></i>
                                        Community access
                                    </li>
                                    <li class="mb-2">
                                        <i class="bi bi-check text-primary"></i>
                                        Unlimited private projects
                                    </li>
                                    <li class="mb-2">
                                        <i class="bi bi-check text-primary"></i>
                                        Dedicated support
                                    </li>
                                    <li class="mb-2">
                                        <i class="bi bi-check text-primary"></i>
                                        Free linked domain
                                    </li>
                                    <li class="text-muted">
                                        <i class="bi bi-x"></i>
                                        Monthly status reports
                                    </li>
                                </ul>
                                <div class="d-grid"><a class="btn btn-dark" href="#!">확인</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-xl-4">
                        <div class="card">
                            <div class="card-body p-5">
                                <div class="small text-uppercase fw-bold text-muted"></div>
                                <div class="mb-3">
                                    <span class="display-3 fw-bold">음식 예약</span>
                                </div>
                                <ul class="list-unstyled mb-4">
                                    <li class="mb-2">
                                        <i class="bi bi-check text-primary"></i>
                                        <strong>Unlimited users</strong>
                                    </li>
                                    <li class="mb-2">
                                        <i class="bi bi-check text-primary"></i>
                                        5GB storage
                                    </li>
                                    <li class="mb-2">
                                        <i class="bi bi-check text-primary"></i>
                                        Unlimited public projects
                                    </li>
                                    <li class="mb-2">
                                        <i class="bi bi-check text-primary"></i>
                                        Community access
                                    </li>
                                    <li class="mb-2">
                                        <i class="bi bi-check text-primary"></i>
                                        Unlimited private projects
                                    </li>
                                    <li class="mb-2">
                                        <i class="bi bi-check text-primary"></i>
                                        Dedicated support
                                    </li>
                                    <li class="mb-2">
                                        <i class="bi bi-check text-primary"></i>
                                        <strong>Unlimited</strong>
                                        linked domains
                                    </li>
                                    <li class="text-muted">
                                        <i class="bi bi-check text-primary"></i>
                                        Monthly status reports
                                    </li>
                                </ul>
                                <div class="d-grid"><a class="btn btn-dark" href="#!">확인</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="bg-light py-5">
            <div class="container px-5 my-5 px-5">
                <div class="text-center mb-5">
                    <h2 class="fw-bolder">추가 정보 입력</h2>
                    <p class="lead mb-0"></p>
                </div>
                <div class="row gx-5 justify-content-center">
                    <div class="col-lg-6">
                        <form id="contactForm" data-sb-form-api-token="API_TOKEN">
                            <!-- Name input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="name" type="text" placeholder="Enter your name..." data-sb-validations="required" />
                                <label for="name">이름</label>
                                <div class="invalid-feedback" data-sb-feedback="name:required">이름을 입력하지 않았습니다.</div>
                            </div>
                            <div class="form-floating mb-3">
                                <input class="form-control" id="email" type="email" placeholder="name@example.com" data-sb-validations="required,email" />
                                <label for="email">이메일</label>
                                <div class="invalid-feedback" data-sb-feedback="email:required">이메일을 입력하지 않았습니다.</div>
                                <div class="invalid-feedback" data-sb-feedback="email:email">이메일 양식이 정확하지 않습니다.</div>
                            </div>
                            <!-- Phone number input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="phone" type="tel" placeholder="(123) 456-7890" data-sb-validations="required" />
                                <label for="phone">전화번호(휴대폰번호)</label>
                                <div class="invalid-feedback" data-sb-feedback="phone:required">전화번호를 입력하지 않았습니다.</div>
                            </div>
                            <div class="d-grid"><a href="/board/mainPage"></a><button class="btn btn-info btn-lg" id="submitButton" type="submit">
                            	확인</button></div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>

<%@ include file="../include/footer.jsp"%>