$(document).ready(function () {
    var searchJSON = '<%= request.getAttribute("searchJSON") %>';
    var searchData = JSON.parse(searchJSON);

    if (searchData.length > 0) {
        // 검색 결과가 있는 경우
        var resultHtml = '<ul>'; // <ul> 요소를 시작
        for (var i = 0; i < searchData.length; i++) {
            resultHtml += '<li>';
            resultHtml += '<a href="#">';
            resultHtml += '<p class="photo"><img src="' + searchData[i].product_image + '" alt="제품사진"></p>';
            resultHtml += '<p class="txt_box">';
            resultHtml += '<span class="name" >' + searchData[i].product_name + '</span>';
            resultHtml += '<span class="product_price" >' + searchData[i].product_price + '원</span>';
            resultHtml += '</p>';
            resultHtml += '</a>';
            resultHtml += '</li>';
        }
        // resultHtml += '<span class="date">유통기한: ' + searchData[i].product_date + '</span>';
        // resultHtml += '<span class="fixed_price">' + searchData[i].product_fixed_price + '원</span>';
        resultHtml += '</ul>'; // </ul> 요소를 닫음
        // 결과를 화면에 추가
        $('.product_list').append(resultHtml);
    } else {
        // 검색 결과가 없는 경우
        $('.product_list').append('<p>제품을 찾을 수 없습니다.</p>');
    }
    var productName = $('#searchInput').val(); // 검색어를 입력하는 input 필드에서 값을 가져옵니다.
});
