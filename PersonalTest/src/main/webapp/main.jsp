<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- main css -->
<link rel="stylesheet" href="resources/style/main.css">

 <!-- Stylesheets -->
 <link href='https://fonts.googleapis.com/css?family=Lato:300,400,700,400italic,300italic' rel='stylesheet' type='text/css'>
 <link rel="stylesheet" href="resources/style/docs.theme.min.css">

 <!-- Owl Stylesheets -->
 <link rel="stylesheet" href="resources/style/owl.carousel.min.css">
 <link rel="stylesheet" href="resources/style/owl.theme.default.min.css">

    <!-- javascript -->
    <script src="resources/script/jquery.min.js"></script>
    <script src="resources/script/owl.carousel.js"></script>
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
				<div class="product_slide">
					MD's Pick Content
				</div>
			<h2 class="main_title">What's new</h2>
				<div class="promotion_slide">
					<div class="slide_box">
						<!-- aria-live="polite" 생략 -->
						<!-- <ul class="slide_container"> -->
							<section id="demos">
								<div class="row">
								  <div class="large-12 columns">
									<div class="owl-carousel owl-theme">
									  <div class="item">
										<h4>1</h4>
									  </div>
									  <div class="item">
										<h4>2</h4>
									  </div>
									  <div class="item">
										<h4>3</h4>
									  </div>
									  <div class="item">
										<h4>4</h4>
									  </div>
									  <div class="item">
										<h4>5</h4>
									  </div>
									  <div class="item">
										<h4>6</h4>
									  </div>
									  <div class="item">
										<h4>7</h4>
									  </div>
									  <div class="item">
										<h4>8</h4>
									  </div>
									  <div class="item">
										<h4>9</h4>
									  </div>
									  <div class="item">
										<h4>10</h4>
									  </div>
									  <div class="item">
										<h4>11</h4>
									  </div>
									  <div class="item">
										<h4>12</h4>
									  </div>
									</div>
									<a class="button secondary play">Play</a> 
									<a class="button secondary stop">Stop</a> 
									<script>
									  $(document).ready(function() {
										var owl = $('.owl-carousel');
										owl.owlCarousel({
										  items: 4,
										  loop: true,
										  margin: 10,
										  autoplay: true,
										  autoplayTimeout: 3000,
										//   넘어가는 속도 조정, 1000 = 1초를 의미한다.
										  autoplayHoverPause: true
										});
										$('.play').on('click', function() {
										  owl.trigger('play.owl.autoplay', [1000])
										})
										$('.stop').on('click', function() {
										  owl.trigger('stop.owl.autoplay')
										})
									  })
									</script>
								  </div>
								</div>
							<!-- <li class="silde_con"><img src="" alt="">1</li>
							<li class="silde_con"><img src="" alt="">2</li>
							<li class="silde_con"><img src="" alt="">3</li>
							<li class="silde_con"><img src="" alt="">4</li>
							<li class="silde_con"><img src="" alt="">5</li>
							<li class="silde_con"><img src="" alt="">6</li> -->
						<!-- </ul> -->
					</div>
				</div>
		</div>
		<div class="insta_area">
			INSTA AREA
			<h2>#커피빈코리아</h2>
			<ul>
				<li><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a href="#">6</a></li>
				<li><a href="#">7</a></li>
				<li><a href="#">8</a></li>
				<li><a href="#">9</a></li>
				<li><a href="#">10</a></li>
				<li><a href="#">11</a></li>
				<li><a href="#">12</a></li>
			</ul>
		</div>
	</section>
	<!-- footer 시작 -->
	<jsp:include page="footer"></jsp:include>
	<!-- footer 끝 -->
</body>
</html>