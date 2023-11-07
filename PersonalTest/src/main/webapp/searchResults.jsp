<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="product_box product_list">
        검색 결과

        <c:if test="${not empty searchResults}">
            <c:forEach items="${searchResults}" var="result">
                <p>제품 이름: ${result.product_name}</p>
                <p>제품 가격: ${result.product_price}</p>
                <!-- 다른 제품 정보를 여기에 표시할 수 있습니다 -->
            </c:forEach>
        </c:if>
        <c:if test="${empty searchResults}">
            <p>제품을 찾을 수 없습니다.</p>
        </c:if>
    </div>
</body>
</html>