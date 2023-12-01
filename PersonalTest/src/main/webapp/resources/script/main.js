// 슬라이드

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

// Insta_area Js

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