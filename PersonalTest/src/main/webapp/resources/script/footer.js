	// 스크롤 이벤트 리스너 추가
    window.addEventListener('scroll', function () {
        const backTopButton = document.getElementById("backTop2");
        if (window.pageYOffset > 200) {
            backTopButton.style.opacity = "1";
        } else {
            backTopButton.style.opacity = "0";
        }
    });

    document.getElementById("backTop2").addEventListener('click', function (event) {
event.preventDefault();
scrollToTop(1000); // 1000은 애니메이션의 지속 시간을 밀리초 단위로 나타냅니다.
});

function scrollToTop(duration) {
const start = window.pageYOffset;
const distance = -start; // 스크롤의 거리를 현재 스크롤 위치에서 0까지로 설정합니다.
const startTime = performance.now();

function animateScroll(currentTime) {
const elapsedTime = currentTime - startTime;
const ease = easeOutCubic(elapsedTime, start, distance, duration);
window.scrollTo(0, ease);

if (elapsedTime < duration) {
requestAnimationFrame(animateScroll);
}
}

function easeOutCubic(t, b, c, d) {
t /= d;
t--;
return c * (t * t * t + 1) + b;
}

requestAnimationFrame(animateScroll);
}

