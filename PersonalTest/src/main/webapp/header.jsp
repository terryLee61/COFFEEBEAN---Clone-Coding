<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 초기화 css -->
<link rel="stylesheet" href="resources/style/reset.css">

<!-- 기본 css -->
<link rel="stylesheet" href="resources/style/grid.css">

<!-- jquery -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script> -->

</head>
<body>
 <header>
 		<!-- header -->
        <div class="header">
        
        		<!-- 최상단 헤더 -->
            	<div class="header_member">
            		<div class="h_mbr_no">
	            		<p class="h_mbr_no_txt">
	            			<strong class="pcolor4">로그인</strong>을 하시면 커피빈 멤버스 클럽의 <strong class="pcolor4">다양한 혜택</strong>을 받으실 수 있습니다.
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
							<a href="#">
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
						<li>
							<a href="online">
								BUY ONLINE
							</a>
						</li>
						<li>
							<a href="members">
								MEMBER'S CLUB
							</a>    
						</li>
						<li>
							<a href="menu">
								MENU
						  </a>
						</li>
						<li>
							<a href="service">
								STORE & 서비스
							</a>
						</li>
						<li>
							<a href="about">
								THE COFFEE BEAN
							</a>
						</li>
					</ul>
				</div>
				<div id="btnSearch"><button>검색창 열기</button></div>
	            
                <!-- top_menu 끝 -->
            </div>
        </div>
    </header>
	<script>
		document.addEventListener('DOMContentLoaded', function() {
    // 클릭한 버튼 요소를 찾습니다.
    var btnHeaderMember = document.getElementById('btnHeaderMember');
    
    // .header_member 요소를 찾습니다.
    var headerMember = document.querySelector('.header_member');
    
    var isOpen = false; // 초기에는 닫혀있는 상태로 설정
    
    // 클릭 이벤트 리스너를 추가합니다.
    btnHeaderMember.addEventListener('click', function() {
        if (isOpen) {
            // 이미지를 눌렀을 때 이미지로 변경
            btnHeaderMember.style.backgroundImage = 'url("../img/user_info.jpg")';
            isOpen = false; // 버튼 상태를 닫힌 상태로 설정
            
            // 클릭하면 .header_member 요소의 스타일을 변경합니다.
            headerMember.style.display = 'none'; // 숨김
            headerMember.style.height = '0'; // 높이를 0으로 설정
        } else {
            // 이미지를 눌렀을 때 다른 이미지로 변경
            btnHeaderMember.style.backgroundImage = 'url("../img/logo_close.png")';
            isOpen = true; // 버튼 상태를 열린 상태로 설정
            
            // 클릭하면 .header_member 요소의 스타일을 변경합니다.
            headerMember.style.display = 'block'; // 나타남
            headerMember.style.height = '100px'; // 높이 설정
        }
    });
});



		</script>
</body>
</html>