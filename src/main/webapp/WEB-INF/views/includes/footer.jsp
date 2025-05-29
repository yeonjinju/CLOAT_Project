<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
   <footer class="footer">
         <div class="inner">
            <div class="logo ft_logo"><img src="resources/images/logo_gray.svg" alt=""></div>
            <div class="ft_rt">
               <ul class="ft_link">
                  <li><a href="javascript:popUp('tou');">이용약관</a></li>
                  <li><a href="javascript:popUp('privacy');">개인정보처리방침</a></li>
                  <li><a href="javascript:popUp('email');">이메일무단수집거부</a></li>
               </ul>
               <p>
                  <strong>주소</strong>
                  <span>서울 마포구 양화로 85 5층</span>&nbsp;<span class="copy">2025 CLOAT All Rights Reserved.</span>
               </p>
            </div>
         </div>
   </footer>
   
   <div class="mo_btm_util vw_mo">
   	<ul class="btm_util">
   		<li>
   			<a href="${pageContext.request.contextPath}">
   				<div class="thum">
   					<img alt="" src="resources/images/util_home.png">
   				</div>
   				<div class="txt">홈</div>
   			</a>
   		</li>
   		<li>
   			<a href="service">
   				<div class="thum">
   					<img alt="" src="resources/images/util_service.png">
   				</div>
   				<div class="txt">사진변환</div>
   			</a>
   		</li>
   		<li>
   			<a href="ReviewList">
   				<div class="thum">
   					<img alt="" src="resources/images/util_review.png">
   				</div>
   				<div class="txt">후기</div>
   			</a>
   		</li>
   		<li>
   			<a href="mypage">
   				<div class="thum">
   					<img alt="" src="resources/images/util_my.png">
   				</div>
   				<div class="txt">MY</div>
   			</a>
   		</li>   		   		   		
   	</ul>
   </div>
    
   
   <aside class="floating">
   	<ul class="floating_ul">
   		<li>
   			<a href="QnaList">
   				<div class="thumb"><img src="resources/images/float_qna.png" alt=""></div>
   				<div class="txt">고객문의 <br>바로가기</div>
   			</a>
   		</li>   	
   		<li>
   			<a href="service">
   				<div class="thumb"><img src="resources/images/float_service.png" alt=""></div>
   				<div class="txt">클로킹서비스 <br>바로가기</div>
   			</a>
   		</li>
   		<li>
   			<a href="map?type=청소년상담복지센터">
   				<div class="thumb"><img src="resources/images/float_map.png" alt=""></div>
   				<div class="txt">기관지도 <br>바로가기</div>
   			</a>
   		</li>   		
   		<li>
   			<a href="https://open.kakao.com/o/s7xb2Kyh" target="_blank">
   				<div class="thumb"><img src="resources/images/float_kakao.png" alt=""></div>
   				<div class="txt">카카오톡 상담</div>
   			</a>
   		</li>   		
   	</ul>
   </aside>

	<div class="popWrap popWrap_footer">
		<div class="popBg" onClick="popClose()"></div>
		<div class="popBox">
			<div class="popClose" onClick="popClose()">
				<img src="resources/images/close.svg">
			</div>		
			<div class="pop_tit"></div>
			<div class="pop_cont"></div>		
		</div>
	</div>
	
	<!--aos-->
	<script src="${pageContext.request.contextPath}/resources/assets/js/aos.js"></script>
	<script>
	  AOS.init({
		easing: 'ease-out'
	  });
	  
	  $(function(){
			AOS_MOBILE(); // 반응형 코드
		});

		$(window).resize(function() { //윈도우 사이즈 변할때마다 적용
			AOS_MOBILE();
		});
		
	</script>
	<!--aos-->	
	<script>
		function popUp(txt) {
			$(".popWrap_footer").show();
			$("html, body").css('overflow','hidden');
	
			let title = "";
			let url = "";
	
			switch(txt){
				case 'tou':
					title = '이용약관';
					url = '${pageContext.request.contextPath}/terms/tou';
					break;
				case 'privacy':
					title = '개인정보처리방침';
					url = '${pageContext.request.contextPath}/terms/privacy';
					break;
				case 'email':
					title = '이메일 무단 수집거부';
					url = '${pageContext.request.contextPath}/terms/email';
					break;
			}
	
			$(".popWrap_footer .pop_tit").text(title);
			$(".popWrap_footer .pop_cont").load(url);
		}
	
		function popClose(){
			$(".popWrap").hide();
			$("html, body").css('overflow','auto');
		}
	</script>

</body>

</html>