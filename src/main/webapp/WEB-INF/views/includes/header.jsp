<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="cpath" value="${pageContext.request.contextPath}"/>

<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image/x-icon" href="<c:url value='/resources/images/favicon.ico' />">
<title>CLOAT, 이미지 클로킹 서비스</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/fonts-archive/Paperlogy/Paperlogy.css" type="text/css"/>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<!-- summernote 에디터 cdn, css 충돌 위험 가능하면 에디터 사용 페이지에서만 추가되도록-->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>	 
<!-- summernote 에디터 cdn, css 충돌 위험 가능하면 에디터 사용 페이지에서만 추가되도록-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/responsive.css">
<script src="${pageContext.request.contextPath}/resources/assets/js/common.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/aos_style.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/aos.css" />
</head>

<body>
   <header class="header">
      <div class="inner">
         <h1 class="logo">
            <a href="${pageContext.request.contextPath}"><img src="resources/images/logo.svg" alt=""></a>
         </h1>                  
         <ul class="depth">
            <li>
               <a href="about">CLOAT</a>
               <ul class="depth2 about-link">
                  <li><a href="about?#why">Why?</a></li>
                  <li><a href="about?#what">What is?</a></li>
                  <li><a href="about?#how">How?</a></li>
                  <li><a href="about?#team">팀 소개</a></li>
                  <li><a href="about?#vision">비전</a></li>
               </ul>
            </li>
            <li>
               <a href="service">서비스</a>
            </li>
            <li>
               <a href="ReviewList">고객후기</a>
            </li>
            <li>
               <a href="NoticeList">고객지원</a>
               <ul class="depth2">
                  <li><a href="NoticeList">공지사항</a></li>
                  <li><a href="NewsList">뉴스</a></li>
                  <li><a href="QnaList">고객문의</a></li>
                  <li><a href="map?type=청소년상담복지센터">도움기관 지도</a></li>
               </ul>
            </li>
         </ul>
         <div class="hd_util">
         <c:choose>
         	<c:when test="${not empty mvo}">
         		<span class="mb_name">${mvo.name}님</span>
         		<a href="mypage">마이페이지</a>
         		<a href="logout">로그아웃</a>
            </c:when>
	         <c:otherwise>          
	            <a href="join">회원가입</a>
	            <a href="login">로그인</a>
	         </c:otherwise>
	     </c:choose> 
         </div>
      </div>
	<div class="ham vw_mo" onClick="menuToggle()">
		<div class="ham_bar"></div>
		<div class="ham_bar"></div>
		<div class="ham_bar"></div>
	</div>      
	<div class="menu_wrap vw_mo">
		<div class="mo_nav">
	    	<div class="mo_hd_util top">
	         <c:choose>
	         	<c:when test="${not empty mvo}">
	         		<p class="mb_name"><b>${mvo.name}</b> 님 <br> 환영합니다!</p>
	            </c:when>
		         <c:otherwise>          
		            <a href="join">회원가입</a>
		            <a href="login">로그인</a>
		         </c:otherwise>
		     </c:choose> 
			</div>				
			<ul class="menu">
			   <li>
			      <a class="mo_link">CLOAT</a>
			      <ul class="submenu about-link">
			         <li><a href="about?#why">Why?</a></li>
			         <li><a href="about?#what">What is?</a></li>
			         <li><a href="about?#how">How?</a></li>
			         <li><a href="about?#team">팀 소개</a></li>
			         <li><a href="about?#vision">비전</a></li>
			      </ul>
			   </li>
			   <li>
			      <a href="service">서비스</a>
			   </li>
			   <li>
			      <a href="ReviewList">고객후기</a>
			   </li>
			   <li>
			      <a class="mo_link">고객지원</a>
			      <ul class="submenu">
			         <li><a href="NoticeList">공지사항</a></li>
			         <li><a href="NewsList">뉴스</a></li>
			         <li><a href="QnaList">고객문의</a></li>
			         <li><a href="map?type=청소년상담복지센터">도움기관 지도</a></li>
			      </ul>
			   </li>
			</ul>
         	<c:if test="${not empty mvo}">
         	<div class="mo_hd_util btm">
         		<a href="mypage">마이페이지</a>
         		<a href="logout" class="c_gray">로그아웃</a>
         	</div>
            </c:if>			
		</div>
	</div>      
   </header>   
