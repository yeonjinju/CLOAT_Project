<%@include file="/WEB-INF/views/includes/header.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<section class="content">
   <div class="about">
      <!--
      1. 왜 CLOAT인가? (Why CLOAT) 
      - 딥페이크 문제 현황
      - 뉴스, 통계, 사회적 위험 강조
      - “우리는 왜 이 서비스를 만들었는가”에 대한 답변         -->
      <div id="why" class="ab_why">
         <div class="about_head">
            <div class="inner">
               <div class="tit1" data-aos="fade-up2" data-aos-duration="600">Why CLOAT?</div>
               <div class="tit2" data-aos="fade-up2" data-aos-duration="600" data-aos-delay="100">왜 필요한가요?</div>
            </div>
         </div>
         <div class="inner ab_cont">
         	<div class="ab_tit" data-aos="fade-up" data-aos-duration="800" dataa-aos-delay="600">나날이 증가하는 딥페이크 범죄들</div>
            <div class="ab_tit" data-aos="fade-up" data-aos-duration="800" dataa-aos-delay="1000">
            	24년 집계된 딥페이크 성범죄 건수, 전년 대비 <b class="c_red">14.8% 증가</b> <br>
            	<small class="c_gray" data-aos="fade-up" data-aos-duration="800">(2023년 8,983명, 2024년 10,305명)</small>
            </div>         	
            <ul class="news_ul">
                <li data-aos="fade-up" data-aos-duration="800" dataa-aos-delay="1400">
                   <div class="news_h">“ 딥페이크(Deep-fake)의 공포-AI가 만든 가짜 그림자”</div> <!--headline : 기사 제목-->
                   <div class="news_s">2025.05.28 | 대전일보</div> <!--source : 기사 출처-->
                </li>
                <li data-aos="fade-up" data-aos-duration="800">
                   <div class="news_h">“‘딥페이크방’으로 유도해 “지인에 알리겠다” 협박…20대 남성 징역형”</div>
                   <div class="news_s">2025.05.27 | 세계일보</div>
                </li>
                <li data-aos="fade-up" data-aos-duration="800" dataa-aos-delay="">
                   <div class="news_h">“[단독] “중고거래 취소해서”...미성년 ‘딥페이크 범죄’ 1년새 2.5배”</div>
                   <div class="news_s">2025.05.25 | 서울신문</div>
                </li>
                <li data-aos="fade-up" data-aos-duration="800" dataa-aos-delay="">
                   <div class="news_h">“‘20~30초면 뚝딱’…대선 앞두고 쏟아지는 딥페이크 게시물”</div>
                   <div class="news_s">2025.05.23 | 매일경제</div>
                </li>                                                
            </ul>
			<div class="ab_tit" data-aos="fade-up" data-aos-duration="800">청소년의 <b class="c_red">76%</b>가 딥페이크 피해를 입을까 불안하다고 응답했습니다</div>
			<div class="ab_tit">
				<p data-aos="fade-up" data-aos-duration="800">나도 모르게 딥페이크 범죄의 피해자가 될 수 있습니다</p>
				<p data-aos="fade-up" data-aos-duration="800"><b class="c_main">CLOAT</b>는 언제 어디서 다가올지 모르는 딥페이크의 위협에서 지켜드릴 수 있는 기술을 가지고 있습니다</p>
			</div>
         </div>
      </div>

      <!--
      2. CLOAT는 무엇인가? (What is CLOAT) 
      - 클로킹 기술 개요
      - Fawkes 기술 소개 + 개선 필요성 or 우리의 차별점
      - 사용 흐름(사진 → 업로드 → 변환 → 다운로드)        
      -->
      <div id="what" class="ab_what">
            <div class="about_head">
               <div class="inner">
                  <div class="tit1" data-aos="fade-up2" data-aos-duration="600">What is CLOAT?</div>
                  <div class="tit2" data-aos="fade-up2" data-aos-duration="600" data-aos-delay="100">어떤 서비스인가요?</div>
               </div>
            </div>
            <div class="inner ab_cont">
               <!--  <div class="ab_tit" data-aos="fade-up" data-aos-duration="800">CLOAT란?</div> -->
               <div class="ab_tit_eng" data-aos="fade-up" data-aos-duration="800"><span class="c_main">C</span>larity & <span class="c_main">L</span>ocking <span class="c_main">O</span>f <span class="c_main">A</span>uthentic <span class="c_main">T</span>eens</div>
               <ul class="c_gray ab_tit3">
               		<li data-aos="fade-up" data-aos-duration="800">Clarity : <span data-aos="fade-right" data-aos-duration="600">명확한</span></li>
               		<li data-aos="fade-up" data-aos-duration="800">Locking : <span data-aos="fade-right" data-aos-duration="600">잠그다</span></li>
               		<li data-aos="fade-up" data-aos-duration="800">Authentic : <span data-aos="fade-right" data-aos-duration="600">진짜, 진정한, 인정된</span></li>
               		<li data-aos="fade-up" data-aos-duration="800">Teens : <span data-aos="fade-right" data-aos-duration="600">십대들</span></li>
               </ul>
               <div class="ab_tit2">
	               	<p data-aos="fade-up" data-aos-duration="800">딥페이크 범죄의 가장 큰 <span class="c_gray">피해자</span>인 청소년들을 주 대상으로</p>
	               	<p data-aos="fade-up" data-aos-duration="800">안전하고 깨끗한 디지털 생태계를 위해 </p>
	               	<p data-aos="fade-up" data-aos-duration="800"><span class="c_main">진짜 나의 얼굴</span>을 명확히 하고, <span class="c_main">잠가서 보호</span>한다는 뜻을 담았습니다.</p>
               </div>
               <div class="ab_tit2">
	               <p data-aos="fade-up" data-aos-duration="800"><b>CLOAT</b>는 AI 학습 모델이 얼굴을 인식하지 못하도록 하는 방어적 노이즈 삽입 기술을 사용해</p>               
	               <p data-aos="fade-up" data-aos-duration="800">딥러닝 모델이 사용자의 얼굴을 탐지할 수 없는 안전한 이미지를 생성하고, 다운로드와 공유 기능으로 쉬운 사용을 보장합니다.</p>               
               </div>
               
               <div class="thum service_flow"  data-aos="fade-up" data-aos-duration="800"><img src="resources/images/service_flow.png" alt=""></div>
              
            </div>
      </div>

      <!--
      3. 어떻게 동작하는가? (How It Works) 
      - 이미지 한 장으로 간단한 흐름도
      - 기술적 개요 (ex. 노이즈 삽입, 딥러닝 모델 대응)
      - 예: "Before vs After" 이미지 예시         -->
      <div id="how" class="ab_how">
      	<div class="about_head">
               <div class="inner">
                  <div class="tit1" data-aos="fade-up2" data-aos-duration="600">How CLOAT Works?</div>
                  <div class="tit2" data-aos="fade-up2" data-aos-duration="600" data-aos-delay="100">어떻게 얼굴을 보호하나요?</div>                  
               </div>
        </div>
        <div class="inner ab_cont">
	        <div class="ab_tit2">
	         <p data-aos="fade-up" data-aos-duration="800">CLOAT는 시카고대학 연구팀에서 개발한 AI 얼굴 인식 방지 기술 Fawkes(포크스)🎭를 사용합니다. </p>
	         <p data-aos="fade-up" data-aos-duration="800">'포크스'는 영화로도 제작된 만화 ‘브이 포 벤데타’에 등장한 ‘가이 포크스’ 가면에서 착안한 이름으로, </p>
	         <p data-aos="fade-up" data-aos-duration="800">포크스는 얼굴 구별을 가능하게 하는 특성 벡터에 아주 세밀한 교란을 삽입해 </p>
	         <p data-aos="fade-up" data-aos-duration="800">이미지에 보이지 않는 마스크를 씌운 것처럼 <span class="c_main">이미지 탐지 알고리즘이 사진을 다른 사람으로 인식하게 해 얼굴 학습을 방해</span>합니다.</p>
	        </div>               
	        
	        <div class="thum fawkes_flow"  data-aos="fade-up" data-aos-duration="800"><img src="resources/images/fawkes.png" alt=""></div>
     	</div>
      </div>

      <!--  
      4. CLOAT 팀을 소개합니다 (About the Team) 
      - 팀원별 역할 / 기여 기능 (더 구체화)
      - 누구든 궁금한 점이 있으면 연락할 수 있게       
      -->
      <div id="team" class="ab_team">
         <div class="about_head">
            <div class="inner">
               <div class="tit1" data-aos="fade-up2" data-aos-duration="600">About the Team</div>
               <div class="tit2" data-aos="fade-up2" data-aos-duration="600" data-aos-delay="100">우리 팀을 소개합니다</div>                
            </div>
         </div>
         <div class="inner ab_cont">
            <!-- <p>팀 CLOAT는 스마트인재개발원 '데이터분석 SW엔지니어 양성과정'에서 핵심 프로젝트</p> -->
            <ul class="team_ul">
               <li data-aos="fade-up" data-aos-duration="800">
                  <div class="thumb"><img src="resources/images/team_yj.png"></div>
                  <div class="name">주연진</div>
                  <div class="position">팀장 · BackEnd</div>
                  <div class="role">전체 기획 총괄, DB 설계</div>
                  <a href="https://github.com/yeonjinju" target="_blank" class="git">https://github.com/yeonjinjuT</a>
               </li>
               <li data-aos="fade-up" data-aos-duration="800" data-aos-delay="300">
                  <div class="thumb"><img src="resources/images/team_bh.png"></div>
                  <div class="name">정병호</div>
                  <div class="position">BackEnd</div>
                  <div class="role">클로킹 기능 구현, 암호화 담당, 보안책임자</div>
                  <a href="https://github.com/jbh6357" target="_blank" class="git">https://github.com/jbh6357</a>
               </li>
               <li data-aos="fade-up" data-aos-duration="800" data-aos-delay="600">
                  <div class="thumb"><img src="resources/images/team_gm.png"></div>
                  <div class="name">나규민</div>
                  <div class="position">FrontEnd</div>
                  <div class="role">회원관리기능 개발, 개인정보책임자</div>
                  <a href="https://github.com/suyeonh12" target="_blank" class="git">https://github.com/gyuminna</a>
               </li>
               <li data-aos="fade-up" data-aos-duration="800" data-aos-delay="900">
                  <div class="thumb"><img src="resources/images/team_sy.png"></div>
                  <div class="name">한수연</div>
                  <div class="position">FrontEnd</div>
                  <div class="role">화면구현, 고객서비스 담당</div>
                  <a href="https://github.com/gyuminna" target="_blank" class="git">https://github.com/suyeonh12</a>
               </li>												
            </ul>
         </div>
      </div>

      <!--
      5. 앞으로의 목표 / 비전 (Our Vision)
      - 현재 MVP 기반
      - 확장 방향 (앱 개발 / API 제공 / 글로벌 서비스 등)
      - 사회적 임팩트와 기술적 확장 가능성      
      -->      
      <div id="vision" class="ab_vision">
         <div class="about_head">
            <div class="inner ab_cont">
               <div class="tit1" data-aos="fade-up2" data-aos-duration="600">Our Vision</div>
               <div class="tit2" data-aos="fade-up2" data-aos-duration="600" data-aos-delay="100">우리가 그리는 미래</div>                 
            </div>
         </div>
         <div class="inner">
         	 <div class="ab_tit2">
	         	<p data-aos="fade-up" data-aos-duration="800">우리는 누구나 디지털 세상에서 얼굴과 신원을 안전하게 <span class="c_main">보호</span>받을 수 있어야 한다고 믿습니다.</p>
	         	<p data-aos="fade-up" data-aos-duration="800"><b>CLOAT</b>는 기술을 통해 사용자에게 프라이버시와 명예를 되돌려주는 ‘디지털 신뢰의 기준’이 되는 것을 목표로 합니다.</p>
	         	<p data-aos="fade-up" data-aos-duration="800">우리는 얼굴을 지키는 기술로, 세상에 더 많은 <span class="c_main">안전</span>을, 더 많은 <span class="c_main">자유</span>를 만들어갑니다.</p>
	        </div> 
         </div>
      </div>	
      
      <!--
      6. 사용자의 목소리 (선택적) 
      - 직접 테스트해본 유저 후기나 멘션
      - “내 얼굴이 안전해지는 느낌이에요!” 등 짧은 카피      
      -->      
      <!-- <div id="review" class="ab_rv">
         <div class="about_head">wow! 실제 후기</div>
         <p>실제 CLOAT 서비스 사용자들이 남긴 후기입니다</p>
         <ul class="user_riview">
            <li>
               <p>"내 얼굴이 가려졌다는 느낌보다, 보호받고 있다는 안정감이 더 컸어요!"</p>
               <span>- 베타테스터 김ㅇㅇ</span>
            </li>
            <li>
               <p>"늘 불안했는데 어쩌구저쩌구"</p>
               <span>- 베타테스터 김ㅇㅇ</span>
            </li>            
         </ul>
      </div>	 -->
   </div>
</section>

<script>
  $(document).ready(function () {
     if (window.location.pathname.endsWith('about') && window.location.hash) {
        let h_height = $('.header').outerHeight();
        let target = $(window.location.hash);
        if (target.length) {
              setTimeout(function () {
                 $('html, body').scrollTop(target.offset().top - h_height);
              }, 50);
        }
     }
  });
</script>
<script>
  function AOS_MOBILE() {

	if (matchMedia("screen and (min-width: 1220px)").matches) { //1220px 이상에서 모두 적용

		$('.team_ul > li:nth-child(2)').attr('data-aos-delay', '300');
		$('.team_ul > li:nth-child(3)').attr('data-aos-delay', '600');
		$('.team_ul > li:nth-child(4)').attr('data-aos-delay', '900');
	}

	if (matchMedia("screen and (max-width: 1220px)").matches) {

		$('.team_ul > li:nth-child(2)').attr('data-aos-delay', '200');
		$('.team_ul > li:nth-child(3)').attr('data-aos-delay', '');
		$('.team_ul > li:nth-child(4)').attr('data-aos-delay', '200');
	}
	
	if (matchMedia("screen and (max-width: 768px)").matches) {

		$('.team_ul > li:nth-child(2)').attr('data-aos-delay', '');
		$('.team_ul > li:nth-child(3)').attr('data-aos-delay', '');
		$('.team_ul > li:nth-child(4)').attr('data-aos-delay', '');
	}
	
}   
</script>
   
<%@include file="/WEB-INF/views/includes/footer.jsp" %>