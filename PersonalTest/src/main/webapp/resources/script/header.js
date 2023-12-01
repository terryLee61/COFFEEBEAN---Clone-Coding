document.addEventListener('DOMContentLoaded', function () {

    var toggleButton = document.getElementById('headerMemberLink');
    var header = document.querySelector('header');
    var headerMemberLink = document.getElementById('headerMemberLink');
    var headerMember = document.querySelector('.header_member');
    toggleButton.addEventListener('click', function () {
        if (header.classList.contains('is_open_member')) {
            header.classList.remove('is_open_member');
            header.classList.add('is_close_member');
            headerMember.style.display = 'block';
            headerMember.style.height = '10px';
        } else {
            header.classList.add('is_open_member');
            header.classList.remove('is_close_member');
            headerMember.style.display = 'block';
            headerMember.style.height = '100px';
        }
    });

    var section = document.querySelector('section');

    function adjustSectionMargin() {
        if (header.classList.contains('is_open_member')) {
            section.style.marginTop = '240px'; // 여기에 원하는 값으로 margin-top을 설정하세요.
        } else {
            section.style.marginTop = '140px'; // header 클래스가 is_open_member가 아닐 때는 margin-top을 초기화합니다.
        }
    }

    adjustSectionMargin();

    document.addEventListener('click', function () {
        adjustSectionMargin();
    });

    var headerMemberLink = document.getElementById('headerMemberLink');
    var headerMemberParent = headerMemberLink.parentElement;
    var headerMember = document.querySelector('.header_member');
    var isOpen = false; 
    var btnSearch = document.getElementById('btnSearch');

    btnSearch.addEventListener('click', function () {
        if (isOpen) {
            isOpen = false;
            header.classList.remove('is_open_member');
            header.classList.add('is_close_member');
            headerMember.style.display = 'block';
            headerMember.style.height = '0'; // 변경할 높이 설정
            headerMemberLink.style.backgroundImage = 'url("resources/img/user_info.png")';
        }
    });

    headerMemberLink.addEventListener('click', function (event) {
        event.preventDefault(); 

        if (isOpen) {
            headerMemberLink.style.backgroundImage = 'url("resources/img/user_info.png")';
            isOpen = false;
            headerMember.style.display = 'none';
            headerMember.style.height = '0';
        } else {
            headerMemberLink.style.backgroundImage = 'url("resources/img/logo_close.png")';
            isOpen = true;
            headerMember.style.display = 'block';
            headerMember.style.height = '100px';
        }
    });
});

// 검색

const searchButton = document.getElementById("searchButton");

searchButton.addEventListener("click", (event) => {
    event.preventDefault(); // 폼 제출 방지
    const searchItem = document.getElementById("searchItem").value;
    window.location.href = "Search?product_name=" + encodeURIComponent(searchItem);
});


const openSearchButton = document.getElementById("openSearchButton");
const btnSearch = document.getElementById("btnSearch");
const searchBox = document.getElementById("search_box");
const btnHeaderMember = document.getElementById("btnHeaderMember");
const headerMember = document.querySelector('.header_member');

// 버튼 상태를 추적하는 변수
let isButtonActive = true;

btnHeaderMember.addEventListener("click", function () {
    // btnSearch가 active일 때 버튼 상태를 변경하고 검색창 종료
    if (btnSearch.classList.contains("active")) {
        btnSearch.classList.remove("active");
        searchBox.style.display = "none";
        isButtonActive = true; // isButtonActive 상태를 다시 true로 설정합니다.
    }
});

// 버튼을 클릭시 이벤트 리스너를 추가
openSearchButton.addEventListener("click", function () {
    // isButtonActive 변수를 기반으로 현재 상태를 확인 및 업데이트
    if (isButtonActive) {
        btnSearch.classList.add("active");
        searchBox.style.display = "block";
    } else {
        btnSearch.classList.remove("active");
        searchBox.style.display = "none";
    }

    // 현재 상태 반대로 업데이트
    isButtonActive = !isButtonActive;

});