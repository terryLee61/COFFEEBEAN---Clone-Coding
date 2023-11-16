<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>

			<!-- 초기화 css -->
			<link rel="stylesheet" href="resources/style/reset_form.css">

			<!-- 기본 css -->
			<link rel="stylesheet" href="resources/style/grid.css">

			<!-- form 전용 css -->
			<link rel="stylesheet" href="resources/style/form.css">

			<!-- 헤더 토글 js -->
			<script src="resources/script/header.js"></script>

			<style>
				.modal {
					display: none;
					position: fixed;
					top: 0;
					left: 0;
					width: 100%;
					height: 100%;
					background-color: rgba(0, 0, 0, 0.7);
					z-index: 1;
				}

				.modal-content {
					position: absolute;
					top: 50%;
					left: 50%;
					transform: translate(-50%, -50%);
					background-color: #fff;
					padding: 20px;
					border: 1px solid #ddd;
					box-shadow: 2px 2px 6px #aaa;
				}

				.close {
					position: absolute;
					top: 10px;
					right: 10px;
					cursor: pointer;
				}
			</style>
		</head>

		<body>
			<header>
				<!-- header -->
				<div class="header">

					<!-- 최상단 헤더 -->
					<div class="header_member">
						<div class="h_mbr_no">
							<p class="h_mbr_no_txt">
								<strong class="pcolor4">로그인</strong>을 하시면 커피빈 멤버스 클럽의 <strong class="pcolor4">다양한
									혜택</strong>을 받으실 수 있습니다.
							</p>
							<div class="btn_box">
								<a href="login" class="btn1"> 로그인 </a>
								<a href="join" class="btn2"> 회원가입 </a>
							</div>
						</div>
					</div>
					<!-- 최상단 헤더 끝 -->

					<!-- util_menu 시작 -->
					<div class="util_menu">
						<div class="inner_util">
							<ul>
								<li>
									<c:choose>
										<c:when test="${not empty sessionScope.log }">
											<a href="Logout">로그아웃</a>
											<!-- <button class="logout_btn" onclick="location.href='Logout'">로그아웃</button> -->
											<!-- <button class="leave_btn" onclick="location.href='leave'">회원탈퇴</button> -->
										</c:when>

										<c:otherwise>
											<a href="login">로그인</a>
											<!-- 						<button class="login_link" onclick="location.href='login'">로그인</button> -->
										</c:otherwise>
									</c:choose>
								</li>
								<c:if test="${not empty sessionScope.log}">
									<li>
										<a href="#">
											마이페이지
										</a>
									</li>
								</c:if>
								<li>
									<a href="#">
										매장찾기
									</a>
								</li>
								<li>
									<a href="#">
										채용정보
									</a>
								</li>
								<li>
									<a href="#">
										단체 및 기업구매
									</a>
								</li>
								<li>
									<a href="#">
										고객서비스
									</a>
								</li>
								<li id="btnHeaderMember">
									<a href="#" id="headerMemberLink">
										회원 정보 안내
									</a>
								</li>
								<li class="mybag">
									<a href="#">

									</a>
								</li>
							</ul>

						</div>
					</div>
					<!-- util_menu 끝 -->

					<!-- top_menu -->
					<div class="inner_header">
						<h1 class="logo">
							<a href="main">COFFEE BEAN</a>
						</h1>
						<div id="gnb" class="gnb">
							<ul>
								<li class="buy">
									<a href="online">BUY ONLINE</a>
									<!-- depth 시작 -->
									<div class="depth2">
										<div class="depth2_list">
											<h2 class="depth_title"><a href="">테스트1</a></h2>
											<ul>
												<li>
													<a href="#">테스트12</a>
												</li>
											</ul>
										</div>

										<div class="depth2_list">
											<h2 class="depth_title"><a href="">테스트1</a></h2>
											<ul>
												<li>
													<a href="#">테스트13</a>
												</li>
											</ul>
										</div>

										<div class="depth2_list">
											<h2 class="depth_title"><a href="">테스트1</a></h2>
											<ul>
												<li>
													<a href="#">테스트143</a>
												</li>
											</ul>
										</div>

										<div class="depth2_list">
											<h2 class="depth_title"><a href="">테스트1</a></h2>
											<ul>
												<li>
													<a href="#">테스트123</a>
												</li>
											</ul>
										</div>
									</div>
									<!-- depth 끝 -->
								</li>
								<li>
									<a href="members">
										MEMBER'S CLUB
									</a>
									<!-- depth 시작 -->
									<div class="depth2">
										<div class="depth2_list">
											<h2 class="depth_title"><a href="">테스트1</a></h2>
											<ul>
												<li>
													<a href="#">테스트12</a>
												</li>
											</ul>
										</div>

										<div class="depth2_list">
											<h2 class="depth_title"><a href="">테스트1</a></h2>
											<ul>
												<li>
													<a href="#">테스트13</a>
												</li>
											</ul>
										</div>

										<div class="depth2_list">
											<h2 class="depth_title"><a href="">테스트1</a></h2>
											<ul>
												<li>
													<a href="#">테스트143</a>
												</li>
											</ul>
										</div>

										<div class="depth2_list">
											<h2 class="depth_title"><a href="">테스트1</a></h2>
											<ul>
												<li>
													<a href="#">테스트123</a>
												</li>
											</ul>
										</div>
									</div>
									<!-- depth 끝 -->
								</li>
								<li id="menu_li">
									<a href="menu">
										MENU
									</a>
									<!-- depth 시작 -->
									<div class="depth2">
										<div class="depth2_list">
											<h2 class="depth_title"><a href="">테스트1</a></h2>
											<ul>
												<li>
													<a href="#">테스트12</a>
												</li>
											</ul>
										</div>

										<div class="depth2_list">
											<h2 class="depth_title"><a href="">테스트1</a></h2>
											<ul>
												<li>
													<a href="#">테스트13</a>
												</li>
											</ul>
										</div>

										<div class="depth2_list">
											<h2 class="depth_title"><a href="">테스트1</a></h2>
											<ul>
												<li>
													<a href="#">테스트143</a>
												</li>
											</ul>
										</div>

										<div class="depth2_list">
											<h2 class="depth_title"><a href="">테스트1</a></h2>
											<ul>
												<li>
													<a href="#">테스트123</a>
												</li>
											</ul>
										</div>
									</div>
									<!-- depth 끝 -->
								</li>
								<li>
									<a href="service">
										STORE & 서비스
									</a>
									<!-- depth 시작 -->
									<div class="depth2">
										<div class="depth2_list">
											<h2 class="depth_title"><a href="">테스트1</a></h2>
											<ul>
												<li>
													<a href="#">테스트12</a>
												</li>
											</ul>
										</div>

										<div class="depth2_list">
											<h2 class="depth_title"><a href="">테스트1</a></h2>
											<ul>
												<li>
													<a href="#">테스트13</a>
												</li>
											</ul>
										</div>

										<div class="depth2_list">
											<h2 class="depth_title"><a href="">테스트1</a></h2>
											<ul>
												<li>
													<a href="#">테스트143</a>
												</li>
											</ul>
										</div>

										<div class="depth2_list">
											<h2 class="depth_title"><a href="">테스트1</a></h2>
											<ul>
												<li>
													<a href="#">테스트123</a>
												</li>
											</ul>
										</div>
									</div>
									<!-- depth 끝 -->
								</li>
								<li>
									<a href="about">
										THE COFFEE BEAN
									</a>
									<!-- depth 시작 -->
									<div class="depth2">
										<div class="depth2_list">
											<h2 class="depth_title"><a href="">커피빈 소식</a></h2>
											<ul>
												<li>
													<a href="notice_list">공지사항</a>
												</li>
											</ul>
										</div>

										<div class="depth2_list">
											<h2 class="depth_title"><a href="">테스트1</a></h2>
											<ul>
												<li>
													<a href="#">테스트13</a>
												</li>
											</ul>
										</div>

										<div class="depth2_list">
											<h2 class="depth_title"><a href="">테스트1</a></h2>
											<ul>
												<li>
													<a href="#">테스트143</a>
												</li>
											</ul>
										</div>

										<div class="depth2_list">
											<h2 class="depth_title"><a href="">테스트1</a></h2>
											<ul>
												<li>
													<a href="#">테스트123</a>
												</li>
											</ul>
										</div>
									</div>
									<!-- depth 끝 -->
								</li>
							</ul>
						</div>
						<!-- 검색창 -->
						<div id="btnSearch">
							<button id="openSearchButton">검색창 열기</button>
						</div>
						<div class="search_box" id="search_box">
							<form action="Search" method="get" enctype="multipart/form-data">
								<fieldset>
									<legend>검색 폼</legend>
									<input type="text" class="search_input" name="searchItem" id="searchItem"
										placeholder="검색어를 입력하세요">
									<button class="btn_search" id="searchButton">검색</button>
								</fieldset>
							</form>
						</div>

						<!-- 모달 팝업 -->
						<div id="searchResultModal" class="modal">
							<div class="modal-content">
								<span class="close" id="closeModal">&times;</span>
								<h2>검색 결과</h2>
								<div id="searchResult">
									<!-- 검색 결과를 표시할 곳 -->
								</div>
							</div>
						</div>

						<script>
							const searchButton = document.getElementById("searchButton");

							// 검색 버튼 클릭 시 서버로 검색어를 요청
							searchButton.addEventListener("click", (event) => {
								event.preventDefault(); // 폼 제출 방지

								// 검색어 가져오기
								const searchItem = document.getElementById("searchItem").value;

								// 검색어를 서버로 전송하고 search.jsp로 이동
								window.location.href = "Search?product_name=" + encodeURIComponent(searchItem);
							});


							// 버튼 요소와 검색 박스 요소를 가져옵니다.
							const openSearchButton = document.getElementById("openSearchButton");
							const btnSearch = document.getElementById("btnSearch");
							const searchBox = document.getElementById("search_box");
							const btnHeaderMember = document.getElementById("btnHeaderMember");
							const headerMember = document.querySelector('.header_member');

							// 버튼 상태를 추적하는 변수
							let isButtonActive = true;

							btnHeaderMember.addEventListener("click", function () {
								// btnSearch가 active일 때 버튼 상태를 변경하고 검색창을 닫습니다.
								if (btnSearch.classList.contains("active")) {
									btnSearch.classList.remove("active");
									searchBox.style.display = "none";
									isButtonActive = true; // isButtonActive 상태를 다시 true로 설정합니다.
								}
							});

							// 버튼을 클릭할 때 이벤트 리스너를 추가합니다.
							openSearchButton.addEventListener("click", function () {
								// isButtonActive 변수를 기반으로 현재 상태를 확인하고 업데이트합니다.
								if (isButtonActive) {
									// 버튼에 클래스를 추가하여 활성 상태를 나타냅니다.
									btnSearch.classList.add("active");
									// 검색 박스를 보이도록 합니다.
									// 배경 이미지를 변경합니다.
									searchBox.style.display = "block";
								} else {
									// 버튼의 클래스를 제거하여 비활성 상태를 나타냅니다.
									btnSearch.classList.remove("active");
									// 검색 박스를 숨깁니다.
									searchBox.style.display = "none";
								}

								// 현재 상태를 반대로 업데이트합니다.
								isButtonActive = !isButtonActive;

							});
							// btnSearch.addEventListener("click", function () {
							// 	const header = document.querySelector("header");
							// 	const headerMember = document.querySelector(".header_member");
							// 	if (btnSearch.classList.contains("active")) {
							// 		headerMember.style.display = "none";
							// 		headerMember.style.height = "0";
							// 		header.classList.remove("is_open_member");
							// 		header.classList.add("is_close_member");
							// 		headerMemberLink.style.backgroundImage = 'url("resources/img/user_info.png")';
							// 		isOpen = false;
							// 		headerMember.style.display = 'none';
							// 		headerMember.style.height = '0';

							// 		headerMember.classList.remove("is_open_member");
							// 		headerMember.classList.add("is_close_member");
							// 	}

							// else {
							// 	headerMember.style.display = "block";
							// 	headerMember.style.height = "100px"; // 또는 원하는 높이로 설정하세요.
							// }
							// });


						</script>

						<!-- top_menu 끝 -->
					</div>
				</div>
			</header>
			
		</body>

		</html>