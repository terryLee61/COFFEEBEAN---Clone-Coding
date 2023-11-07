<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 결과</title>
</head>
<body>
	<!-- header 시작 -->
	<jsp:include page="header"></jsp:include>
	<!-- header 끝 -->
	<!-- body 시작 -->
	<section id="wrap">
		<div class="main_wrap">
			<div class="product_box product_list">검색 결과

				<c:if test="${search != null}">
					<p>제품 이름: ${search.product_name}</p>
					<p>제품 가격: ${search.product_price}</p>
					<!-- 다른 제품 정보를 여기에 표시할 수 있습니다 -->
				</c:if>
				<c:if test="${search == null}">
					<p>제품을 찾을 수 없습니다.</p>
				</c:if>
			</div>
		</div>
	</section>
	<!-- body 끝 -->

	<!-- footer 시작 -->
	<jsp:include page="footer"></jsp:include>
	<!-- footer 끝 -->
</body>
</html>