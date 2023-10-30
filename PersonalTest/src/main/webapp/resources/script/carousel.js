$(document).ready(function() {
    var currentSlide = 0;
    var $slideContainer = $('.slide_container');
    var $slides = $slideContainer.find('li');
    var numSlides = $slides.length;
    var itemsToShow = 3; // 3개의 항목을 보이도록 설정

    // 슬라이드 표시 함수
    function showSlides() {
        // 이전 슬라이드 숨김
        $slides.hide();

        // 보이는 슬라이드만 표시
        for (var i = 0; i < itemsToShow; i++) {
            var index = (currentSlide + i) % numSlides;
            $slides.eq(index).fadeIn();
        }
    }

    // 슬라이드 쇼 시작
    var slideInterval = setInterval(function() {
        showSlides();
        currentSlide = (currentSlide + itemsToShow) % numSlides;
    }, 3000);

    // 슬라이드 컨테이너에 호버할 때 슬라이드 멈추고 재생
    $slideContainer.hover(
        function() {
            clearInterval(slideInterval);
        },
        function() {
            slideInterval = setInterval(function() {
                showSlides();
                currentSlide = (currentSlide + itemsToShow) % numSlides;
            }, 3000);
        }
    );

    // 페이지 로드 시 초기 슬라이드 표시
    showSlides();
});
