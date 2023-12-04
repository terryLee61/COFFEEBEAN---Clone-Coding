<%@page import="model.Search.SearchRequestDto" %>
	<%@page import="java.util.ArrayList" %>
		<%@page import="model.Search.SearchDao" %>
			<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
				<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



					<!DOCTYPE html>
					<html>

					<head>
						<meta charset="UTF-8">
						<title>검색 결과</title>
						<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
						<link rel="stylesheet" href="resources/style/search.css">

					</head>

					<body>
						<!-- header 시작 -->
						<jsp:include page="header"></jsp:include>
						<!-- header 끝 -->
						<!-- body 시작 -->
						<section id="wrap">
							<div class="main_wrap">
								<!-- 시작 -->
								<div class="product_list">
									검색 결과

									<!-- <%-- <c:if test="${not empty search}">
										<p>제품 이름: ${search[0].product_name}</p>
										<p>제품 가격: ${search[0].product_price}</p>
										
										</c:if>
										<c:if test="${empty search}">
											<p>제품을 찾을 수 없습니다.</p>
										</c:if> --%> -->
								</div>
									<script>
										var searchJSON = '<%= request.getAttribute("searchJSON") %>';
									    var searchData = JSON.parse(searchJSON);
									</script>
							</div>
						</section>
						<!-- body 끝 -->

						<!-- footer 시작 -->
						<jsp:include page="footer"></jsp:include>
						<!-- footer 끝 -->
					</body>
					<script type="text/javascript" src="resources/script/search.js"></script>
					</html>
