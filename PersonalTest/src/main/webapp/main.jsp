<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>커피빈 카피</title>
			<!-- main css -->
			<link rel="stylesheet" href="resources/style/main.css">

			<!-- Stylesheets -->
			<link href='https://fonts.googleapis.com/css?family=Lato:300,400,700,400italic,300italic' rel='stylesheet'
				type='text/css'>
			<!-- <link rel="stylesheet" href="resources/style/docs.theme.min.css"> -->

			<script type="text/javascript" src="resources/script/jquery.min.js"></script>
			<script type="text/javascript" src="resources/script/slick.min.js"></script>

			<link rel="stylesheet" href="resources/style/slick.css" />
			<link rel="stylesheet" href="resources/style/slick-theme.css" />



		</head>

		<body>
			<!-- header 시작 -->
			<jsp:include page="header"></jsp:include>
			<!-- header 끝 -->
			<section id="wrap">
				<div class="con1">
					<a href="#"><img src="resources/img/main_img.jpg" alt=""></a>
				</div>
				<div class="main_wrap">
					<h2 class="main_title">MD's Pick</h2>
					<!-- <div class="product_slide_wrap"> -->
					<div class="product_slide">
						<div class="product_list">
							<!-- 제품사진 -->
							<a href="#">
								<p class="photo">
									<img src="resources/img/coffee.jpg" alt="">
									<!-- 제품설명 -->
								</p>
								<p class="txt_box">
									<span class="name">제품설명1</span>
									<span class="date">유통기한: 2024-08-27</span>
									<span class="ori_price">15,000원</span>
									<span class="fixed_price">12,000원</span>
								</p>
							</a>
							<button class="quickView">QUICKVIEW</button>



						</div>
						<div class="product_list">
							<!-- 제품사진 -->
							<a href="#">
								<p class="photo">
									<img src="resources/img/coffee.jpg" alt="">
									<!-- 제품설명 -->
								</p>
								<p class="txt_box">
									<span class="name">제품설명2</span>
									<span class="date">유통기한: 2025-12-12</span>
									<span class="ori_price">12,000원</span>
									<span class="fixed_price">9,000원</span>
								</p>
							</a>
							<button class="quickView">QUICKVIEW</button>

						</div>
						<div class="product_list">
							<!-- 제품사진 -->
							<a href="#">
								<p class="photo">
									<img src="resources/img/coffee.jpg" alt="">
									<!-- 제품설명 -->
								</p>
								<p class="txt_box">
									<span class="name">제품설명3</span>
									<span class="date">유통기한: 2023-10-11</span>
									<span class="ori_price">18,000원</span>
									<span class="fixed_price">15,000원</span>
								</p>
							</a>
							<button class="quickView">QUICKVIEW</button>

						</div>
						<div class="product_list">
							<!-- 제품사진 -->
							<a href="#">
								<p class="photo">
									<img src="resources/img/coffee.jpg" alt="">
									<!-- 제품설명 -->
								</p>
								<p class="txt_box">
									<span class="name">제품설명4</span>
									<span class="date">유통기한: 2030-01-22</span>
									<span class="ori_price">21,000원</span>
									<span class="fixed_price">18,000원</span>
								</p>
							</a>
							<button class="quickView">QUICKVIEW</button>

						</div>
					</div>

					<!-- </div> -->
					<h2 class="main_title">What's new</h2>
					<div class="promotion_slide">
						<div class="slide_box">
							<div class="autoplay">
								<div>
									<a href="#">
										<img src="resources/img/coffee.jpg" alt="">
										<p class="subject_wrap">
											<span class="subject">Spring</span>
										</p>
									</a>
								</div>
								<div>
									<a href="#"><img src="resources/img/coffee2.jpg" alt="">
										<p class="subject_wrap">
											<span class="subject">Summer</span>
										</p>
									</a>
								</div>
								<div>
									<a href="#"><img src="resources/img/coffee3.jpg" alt="">
										<p class="subject_wrap">
											<span class="subject">Fall</span>
										</p>
									</a>
								</div>
								<div>
									<a href="#"><img src="resources/img/coffee.jpg" alt="">
										<p class="subject_wrap">
											<span class="subject">Winter</span>
										</p>
									</a>
								</div>
								<div>
									<a href="#"><img src="resources/img/coffee2.jpg" alt="">
										<p class="subject_wrap">
											<span class="subject">Spring</span>
										</p>
									</a>
								</div>
								<div>
									<a href="#"><img src="resources/img/coffee3.jpg" alt="">
										<p class="subject_wrap">
											<span class="subject">Summer</span>
										</p>
									</a>
								</div>
								<div>
									<a href="#"><img src="resources/img/coffee.jpg" alt="">
										<p class="subject_wrap">
											<span class="subject">Fall</span>
										</p>
									</a>
								</div>
								<div>
									<a href="#"><img src="resources/img/coffee2.jpg" alt="">
										<p class="subject_wrap">
											<span class="subject">Winter</span>
										</p>
									</a>
								</div>
								<div>
									<a href="#"><img src="resources/img/coffee3.jpg" alt="">
										<p class="subject_wrap">
											<span class="subject">Spring</span>
										</p>
									</a>
								</div>
							</div>
							<span class="control-buttons">
								<button type="button" class="play">재생</button>
								<button type="button" class="stop">정지</button>
							</span>
						</div>
					</div>
					<script>
						$(document).ready(function () {

							$('.autoplay').slick({
								slidesToShow: 3,
								slidesToScroll: 3,
								autoplay: true,
								autoplaySpeed: 4000, // 자동 재생 간격(텀)
								speed: 3000, // 전환 속도
								dots: true
							});


							// 재생/정지 버튼 컨트롤
							$('.play').click(function () {
								$('.autoplay').slick('slickPlay');
							});
							$('.stop').click(function () {
								$('.autoplay').slick('slickPause');
							});

							// ".control-buttons" 내의 버튼을 ".slick-dots" 클래스 내로 이동
							var controlButtons = $('.control-buttons');
							controlButtons.appendTo('.slick-dots');
						});
					</script>
				</div>
				<div class="insta_area">
					<h2>#커피빈코리아</h2>
					<ul>
						<li><a href="#"><img src="resources/img/coffee.jpg" alt=""></a></li>
						<li><a href="#"><img src="resources/img/coffee2.jpg" alt=""></a></li>
						<li><a href="#"><img src="resources/img/coffee3.jpg" alt=""></a></li>
						<li><a href="#"><img src="resources/img/coffee.jpg" alt=""></a></li>
						<li><a href="#"><img src="resources/img/coffee2.jpg" alt=""></a></li>
						<li><a href="#"><img src="resources/img/coffee3.jpg" alt=""></a></li>
						<li><a href="#"><img src="resources/img/coffee.jpg" alt=""></a></li>
						<li><a href="#"><img src="resources/img/coffee2.jpg" alt=""></a></li>
						<li><a href="#"><img src="resources/img/coffee3.jpg" alt=""></a></li>
						<li><a href="#"><img src="resources/img/coffee.jpg" alt=""></a></li>
						<li><a href="#"><img src="resources/img/coffee2.jpg" alt=""></a></li>
						<li><a href="#"><img src="resources/img/coffee3.jpg" alt=""></a></li>
					</ul>
					<a class="insta_area_btn" href="#">OUR INSTAGRAM - @#</a>
					<!-- <div class="overlayDiv3">배경
						<button id="close_pop"></button>
					</div> -->
				</div>
				<script>
					// QUICKVIEW 버튼 클릭 이벤트 처리
					$('.quickView').click(function () {
						// 새로운 div 엘리먼트 생성
						var newDiv = $('<div class="dynamicDiv">This is a dynamically created div.</div');

						// 두 번째 div를 생성
						var overlayDiv = $('<div class="overlayDiv"></div');

						var overlayDiv2 = $('<div class="overlayDiv2">배경 wrap</div');

						var overlayDiv3 = $('<div class="overlayDiv3">배경<button id="close_pop">Close</button></div>');

						// overlayDiv를 newDiv의 자식으로 추가
						newDiv.append(overlayDiv);
						newDiv.append(overlayDiv2);
						overlayDiv2.append(overlayDiv3);

						// newDiv를 body 끝 부분에 추가
						$('body').append(newDiv);

						// close_pop 버튼 클릭 이벤트 처리
						$('#close_pop').click(function () {
							// newDiv 및 하위 요소 삭제
							newDiv.remove();

							// 이벤트 핸들러 해제
							$('#close_pop').off('click');
						});
					});
				</script>
			</section>
			<!-- footer 시작 -->
			<jsp:include page="footer"></jsp:include>
			<!-- footer 끝 -->
		</body>

		</html>