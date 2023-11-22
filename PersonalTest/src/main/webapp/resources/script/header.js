document.addEventListener('DOMContentLoaded', function () {

    // 토글 버튼 요소를 선택합니다. 예를 들면, '회원 정보 안내' 링크를 클릭하여 
    // 헤더를 토글할 수 있습니다.
    var toggleButton = document.getElementById('headerMemberLink');
    var header = document.querySelector('header');
    var headerMemberLink = document.getElementById('headerMemberLink');
    var headerMember = document.querySelector('.header_member');
    // 토글 버튼을 클릭했을 때 실행될 함수를 정의합니다.
    toggleButton.addEventListener('click', function () {
        if (header.classList.contains('is_open_member')) {
            header.classList.remove('is_open_member');
            header.classList.add('is_close_member');
            // 클래스를 추가 및 제거할 때 CSS 애니메이션을 토글합니다.
            headerMember.style.display = 'block';
            headerMember.style.height = '10px';
        } else {
            header.classList.add('is_open_member');
            header.classList.remove('is_close_member');
            headerMember.style.display = 'block';
            headerMember.style.height = '100px';
        }
    });

    // js를 동작 시켰을 때, margin-top 변경
    var section = document.querySelector('section');

    // 함수를 만들어서 header 클래스가 is_open_member인지 확인하고, 그에 따라 section의 margin-top을 조절합니다.
    function adjustSectionMargin() {
        if (header.classList.contains('is_open_member')) {
            section.style.marginTop = '240px'; // 여기에 원하는 값으로 margin-top을 설정하세요.
        } else {
            section.style.marginTop = '140px'; // header 클래스가 is_open_member가 아닐 때는 margin-top을 초기화합니다.
        }
    }

    // 페이지가 로드될 때와 헤더 클래스가 변경될 때마다 호출하여 section의 margin-top을 조절합니다.
    adjustSectionMargin();

    // 헤더 클래스가 변경될 때마다 section의 margin-top을 조절하는 함수를 호출합니다.
    document.addEventListener('click', function () {
        adjustSectionMargin();
    });

    // 클릭한 링크 요소를 찾습니다.
    var headerMemberLink = document.getElementById('headerMemberLink');

    // 클릭한 링크 요소의 부모 요소를 찾습니다.
    var headerMemberParent = headerMemberLink.parentElement;

    // .header_member 요소를 찾습니다.
    var headerMember = document.querySelector('.header_member');

    var isOpen = false; // 초기에는 닫혀있는 상태로 설정

      // #btnSearch 요소를 찾습니다.
      var btnSearch = document.getElementById('btnSearch');

      // btnSearch 클릭 이벤트 리스너를 추가합니다.
      btnSearch.addEventListener('click', function () {
          // header가 열려있는 경우에만 닫히도록 처리합니다.
          if (isOpen) {
              // isOpen 상태를 변경하여 header를 닫힌 상태로 설정합니다.
              isOpen = false;
              header.classList.remove('is_open_member');
              header.classList.add('is_close_member');
              headerMember.style.display = 'block';
              headerMember.style.height = '0'; // 변경할 높이 설정
              headerMemberLink.style.backgroundImage = 'url("resources/img/user_info.png")';
          }
        });

    // 클릭 이벤트 리스너를 추가합니다.
    headerMemberLink.addEventListener('click', function (event) {
        event.preventDefault(); // 링크의 기본 동작을 취소합니다.

        // 클릭할 때 이미지를 변경하고 isOpen 변수를 업데이트합니다.
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