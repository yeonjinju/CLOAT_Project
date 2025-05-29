<%@include file="/WEB-INF/views/includes/header.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<section class="main content">

	<!-- 메인 배너 -->
	<div class="main_banner">
		<div class="inner">
			<div class="thum">
				<video src="resources/images/intro.mp4" autoplay muted loop class="main_vd"></video>
			</div>
			<div class="txt">
				<div class="tit" data-aos="fade-up" data-aos-duration="800" data-aos-delay="300">내 얼굴, 더는 노출되지 않게</div>
				<p class="desc" data-aos="fade-up" data-aos-duration="800" data-aos-delay="600">딥페이크로부터 나를 지키는 가장 쉬운 방법</p>
				<div data-aos="fade-up" data-aos-duration="800" data-aos-delay="1200">
					<a href="service" class="bttn bttn_sbm2 wh">클로킹 서비스 바로가기</a>	
				</div>			
			</div>	
		</div>
	</div>   

	<!-- 장점 나열 -->
	<div class="main_good">
		<div class="inner">
			<h2 class="main_tit" data-aos="fade-up" data-aos-duration="800"><span class="c_main">CLOAT</span> 는 합니다</h2>
			<ul class="main_good_ul">
				<li data-aos="fade-up" data-aos-duration="800" data-aos-delay="200">
					<div class="box">
						<p class="tit">걱정없이 안전하게</p>
						<p class="desc">클로킹 서비스로<br> 딥페이크에서 벗어나 <br>안전한 디지털 라이프를 <br>누려보세요!</p>
						<div class="thum">
							<img src="resources/images/main_good_1.png" alt="" >
						</div>					
					</div>
				</li>		
				<li data-aos="fade-up" data-aos-duration="800" data-aos-delay="400">
					<div class="box">
						<p class="tit">금전부담 전혀없는</p>
						<p class="desc">CLOAT는 공익을 위해 <br>모든 서비스를 <br>무료로 제공합니다</p>
						<div class="thum">
							<img src="resources/images/main_good_2.png" alt="">
						</div>							
					</div>
				</li>				
				<li data-aos="fade-up" data-aos-duration="800" data-aos-delay="600">
					<div class="box">
						<p class="tit">어디서나 편안하게</p>
						<p class="desc">휴대폰으로도 문제 없어요. <br>어느 기기에서나 <br>편리하게 이용하세요</p>
						<div class="thum">
							<img src="resources/images/main_good_3.png" alt="" >
						</div>							
					</div>
				</li>	
				<li data-aos="fade-up" data-aos-duration="800" data-aos-delay="800">
					<div class="box">
						<p class="tit">헤매지말고 한번에</p>
						<p class="desc">딥페이크 관련 예방 컨텐츠 제공, <br>딥페이크 방지 이미지 클로킹 서비스, <br>유관센터 지도 등 <br>전반적인 딥페이크 대응 관련 <br>서비스를 제공합니다</p>
						<div class="thum">
							<img src="resources/images/main_good_4.png" alt="" >
						</div>							
					</div>
				</li>
			</ul>		
		</div>		
	</div>
	
	<!-- 게시판 최신글 -->
	<div class="main_board">
		<div class="inner">
		    <div class="main_board_cont" data-aos="fade-up" data-aos-duration="800">
		    	<!-- 공지사항 최신글 5개 -->
		    	<div class="main_board_top">
		    		<div class="tit">공지사항 📢</div>
		    		<a href="NoticeList" class="more">더보기</a>
		    	</div>		    	
				<ul class="main_board_ul">
				    <c:forEach items="${new_notice}" var="notice">
					<li>
						<a href="noticeview?no=${notice.notice_idx}">
							<p class="bd_title">${notice.notice_title}</p>
							<span class="bd_date"><fmt:formatDate value="${notice.created_at}" pattern="yyyy.MM.dd"/></span>
						</a>
					</li>
					</c:forEach>                                                      
				</ul>
			</div>
			<div class="main_board_cont" data-aos="fade-up" data-aos-duration="800" data-aos-delay="200">
				<!-- 후기 최신글 5개 -->
		    	<div class="main_board_top">
		    		<div class="tit">이용 후기 💬</div>
		    		<a href="ReviewList" class="more">더보기</a>
		    	</div>				
				<ul class="main_board_ul">
					<c:forEach items="${new_review}" var="review">
					<li>
						<a href="reviewview?no=${review.review_idx}">
							<p class="bd_title">${review.review_title}</p>
							<span class="bd_date"><fmt:formatDate value="${review.created_at}" pattern="yyyy.MM.dd"/></span>
						</a>
					</li>
					</c:forEach>     
		        </ul>
		    </div>		
		</div>
	</div>


</section>
<script>
  function AOS_MOBILE() {

	if (matchMedia("screen and (min-width: 1220px)").matches) { //1220px 이상에서 모두 적용

		$('.main_good_ul > li:nth-child(1)').attr('data-aos-delay', '200');
		$('.main_good_ul > li:nth-child(2)').attr('data-aos-delay', '400');
		$('.main_good_ul > li:nth-child(3)').attr('data-aos-delay', '600');
		$('.main_good_ul > li:nth-child(4)').attr('data-aos-delay', '800');
	}

	if (matchMedia("screen and (max-width: 1220px)").matches) {

		$('.main_good_ul > li:nth-child(1)').attr('data-aos-delay', '200');
		$('.main_good_ul > li:nth-child(2)').attr('data-aos-delay', '400');
		$('.main_good_ul > li:nth-child(3)').attr('data-aos-delay', '200');
		$('.main_good_ul > li:nth-child(4)').attr('data-aos-delay', '400');
	}
	
  }   
</script>
   
<%@include file="/WEB-INF/views/includes/footer.jsp" %>