<%@page import="model.Search.SearchRequestDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Search.SearchDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 결과</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>
	<!-- header 시작 -->
	<jsp:include page="header"></jsp:include>
	<!-- header 끝 -->
	<!-- body 시작 -->
	<section id="wrap">
		<div class="main_wrap">
			<!-- 시작 -->
			<div class="product_box product_list">
				검색 결과

				<c:if test="${not empty search}">
					<p>제품 이름: ${search[0].product_name}</p>
					<p>제품 가격: ${search[0].product_price}</p>
					<!-- 다른 제품 정보를 여기에 표시할 수 있습니다 -->
				</c:if>
				<c:if test="${empty search}">
					<p>제품을 찾을 수 없습니다.</p>
				</c:if>
			<script>
    $(document).ready(function() {
        $.ajax({
            url: 'search', // 서블릿 URL을 여기에 입력
            type: 'GET',
            data: { product_name: productName }, // 검색에 사용할 제품 이름
            dataType: 'json',
            success: function(data) {
                // 검색 결과를 처리 (data 변수에 JSON 데이터가 들어 있음)

                if (data.length > 0) {
                    // 검색 결과가 있는 경우
                    var resultHtml = '';
                    for (var i = 0; i < data.length; i++) {
                        resultHtml += '<p>제품 이름: ' + data[i].full_product_name + '</p>';
                        resultHtml += '<p>제품 가격: ' + data[i].product_price + '</p>';
                        // 다른 필드도 필요에 따라 추가
                    }
                    // 결과를 화면에 추가
                    $('.product_list').append(resultHtml);
                } else {
                    // 검색 결과가 없는 경우
                    $('.product_list').append('<p>제품을 찾을 수 없습니다.</p>');
                }
            },
            error: function() {
                // 오류 처리
                console.error('오류 발생');
            }
        });
    });
</script>
			</div>
		</div>
	</section>
	<!-- body 끝 -->

	<!-- footer 시작 -->
	<jsp:include page="footer"></jsp:include>
	<!-- footer 끝 -->
</body>
</html>