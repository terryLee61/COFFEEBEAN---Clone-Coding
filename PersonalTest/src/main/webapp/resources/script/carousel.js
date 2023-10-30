$(document).ready(function() {
    // 초기 슬라이더 위치
    var currentSlide = 0;
    
    // 슬라이드 컨테이너 및 슬라이드 요소 선택
    var $slideContainer = $('.slide_container');
    var $slides = $slideContainer.find('li');
    
    // 슬라이드 개수
    var numSlides = $slides.length;
    
    // 다음 슬라이드 표시 함수
    function showNextSlide() {
        $slides.eq(currentSlide).fadeOut();
        currentSlide = (currentSlide + 1) % numSlides;
        $slides.eq(currentSlide).fadeIn();
    }
    
    // 슬라이드 쇼 시작
    var slideInterval = setInterval(showNextSlide, 3000); // 3초마다 슬라이드 변경

    // 슬라이드 컨테이너에 호버할 때 슬라이드 멈추고 재생
    $slideContainer.hover(
        function() {
            clearInterval(slideInterval);
        },
        function() {
            slideInterval = setInterval(showNextSlide, 3000);
        }
    );
});
