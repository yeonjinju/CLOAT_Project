<%@include file="/WEB-INF/views/includes/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<section class="content map">
   <div class="page_top">
      <div class="inner">
         <h2 class="pageName">도움기관 지도</h2>
      </div>
   </div>
   <div class="inner">
	
		<!-- 카테고리 선택 -->
		<div class="sub_area">
			<ul class="tabTit">
				<li class="${type == '청소년상담복지센터' ? 'on' : ''}">
					<a href="map?type=청소년상담복지센터">청소년상담복지센터</a>
				</li>
				<li class="${type == '해바라기센터' ? 'on' : ''}">
					<a href="map?type=해바라기센터">해바라기센터</a>
				</li>
				<li class="${type == '성착취 피해아동·청소년 지원센터' ? 'on' : ''}">
					<a href="map?type=성착취+피해아동·청소년+지원센터">성착취 피해아동·청소년 지원센터</a>
				</li>
				<li class="${type == '지역디지털성범죄피해자지원센터' ? 'on' : ''}">
					<a href="map?type=지역디지털성범죄피해자지원센터">지역디지털성범죄피해자지원센터</a>
				</li>
			</ul>
		</div>
		
		<!-- 검색창 -->
		<div class="search_form">
			<form action="searchMap">
				<select name="searchValue" title="키워드를 선택해주세요" class="sel">
					<option value="0">전체</option>
					<option value="1">지역</option>
					<option value="2">기관명</option>
					<option value="3">주소</option>
				</select> <input type="text" name="searchKeyword" value=""
					placeholder="검색어를 입력해주세요." title="검색어를 입력해주세요." class="ipt_tt">
				<input type="hidden" name="type" value="${type}">
				<button type="submit" class="ipt_sbm">검색</button>
			</form>
		</div>
		
		<c:if test="${!empty mapvo}">
			<div class="map_container">
				<div class="map_list">
					<c:forEach var="center" items="${mapvo}" varStatus="status">
						<div class="cont <c:if test='${status.first}'>on</c:if>">
							<div class="info_cont">
								<div class="title_area">
									<span class="sub_tit">${center.sido}</span>
									<span class="tit">${center.org_name}</span>
								</div>
								<ul class="data_list_area">
									<li class="">
										<img src="resources/images/ico_location_on.svg" class="ico">${center.addr}
									</li>
									<li class="">
										<img src="resources/images/ico_call.svg" class="ico">${center.org_tel}
									</li>
								</ul>
							</div>
						</div>
					</c:forEach>
				</div>
				<div class="map_area">
					<div id="map" style="width: 100%;"></div>
				</div>
			</div>
		</c:if>
		
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=93ef0428acf91a435ff28bf23556f61d&libraries=services"></script>
		<script>
			// kakao.maps.InfoWindow 는 css 커스텀 어려워서 infoWindow 대신 kakao.maps.CustomOverlay 사용,
			// 원래 코드는 _Map.jsp 에 보존되어 있습니다
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = { 
					center: new kakao.maps.LatLng(${mapvo[0].lat}, ${mapvo[0].lon}), // 지도의 중심좌표
					level: 8 // 지도의 확대 레벨
			}; 
			
			// 지도를 생성합니다 
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			
			var markers = []; 
			var overlays = []; 
			var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; // 마커 이미지의 이미지 주소입니다
			var imageSize = new kakao.maps.Size(24, 35); // 마커 이미지의 이미지 크기 입니다
			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); // 마커 이미지를 생성합니다  
			
			<c:forEach var="center" items="${mapvo}" varStatus="status"> (
			function() { 
				var position = new kakao.maps.LatLng(${center.lat}, ${center.lon}); 
				var title = '${center.org_name}'; 
				// 마커 생성
				var marker = new kakao.maps.Marker({ 
					map: map, // 마커를 표시할 지도
					position: position, // 마커를 표시할 위치
					title: title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
					image: markerImage // 마커 이미지 
				}); 
				
				markers.push(marker); // 커스텀 오버레이 HTML 구성 
				
				// 인포윈도우 디자인
				var content = ` <div class="info_window"> 
									<div class="title_area">
										<span class="sub_tit">${center.sido}</span>
										<span class="tit">${center.org_name}</span>
									</div> 
									<ul class="info_btm"> 
										<li> 
											<a href="https://map.kakao.com/link/map/${fn:escapeXml(center.org_name)},${center.lat},${center.lon}" target="_blank"> 
												<img src="resources/images/ico_map.svg" class="ico">크게 보기 
											</a> 
										</li>
										<li> 
											<a href="https://map.kakao.com/link/to/${fn:escapeXml(center.org_name)},${center.lat},${center.lon}" target="_blank">
												<img src="resources/images/ico_turn_right.svg" class="ico">길찾기
											</a>
										</li>
										<li>
											<a href="tel:${center.org_tel}">
												<img src="resources/images/ico_call_gray.svg" class="ico">전화하기
											</a>
										</li>
									</ul>
								</div>
				`;
				
				var overlay = new kakao.maps.CustomOverlay({ 
					content: content, // 인포윈도우에 표시할 내용
					position: position, 
					// 마커로부터의 인포윈도우 X축, Y축 위치
					// xAnchor: 수평 위치 조절 (0 = 왼쪽, 0.5 = 가운데, 1 = 오른쪽)
					// yAnchor: 수직 위치 조절 (0 = 위쪽 끝, 1 = 아래쪽 끝)
					xAnchor: 0.5, 
					yAnchor: 1.55
				}); 
				
				overlays.push(overlay); // 배열에 마커 저장
				
				// 마커에 click 이벤트를 등록합니다
				kakao.maps.event.addListener(marker, 'click', function() { 
					closeOverlays(); 
					overlay.setMap(map); 
					map.panTo(position);
					
				    // [1] 오버레이 관련 제목 가져오기
				    const orgName = marker.getTitle(); // 또는 content 안에서 title 따로 꺼내는 방법도 가능

				    // [2] 관련 .cont 요소에 on 추가 + 형제들에서 제거
				    $('.map_list .cont').each(function () {
				        const title = $(this).find('.tit').text().trim();
				        if (title === orgName.trim()) {
				            $(this).addClass('on').siblings('.cont').removeClass('on');

				            // [3] 해당 cont를 중심으로 스크롤 이동
				            const container = $('.map_list');
				            const scrollTo = $(this);
				            const scrollTop = scrollTo.offset().top - container.offset().top + container.scrollTop() - container.height() / 2 + scrollTo.outerHeight() / 2;

				            container.animate({ scrollTop: scrollTop }, 400);
				        }
				    });				
				}); 
			})(); 
			</c:forEach>
			
			function closeOverlays() { 
				for (var i = 0; i < overlays.length; i++) { 
					overlays[i].setMap(null); 
				} 
			} // div.cont 클릭 시 마커와 오버레이 연동 
			
			$('.map_list .cont').click(function() { 
				$(this).addClass('on').siblings('.cont').removeClass('on');
				
				var orgName = $(this).find('.tit').text(); 
				
				// markers 배열에서 title이 일치하는 마커 찾기
				for (let i = 0; i < markers.length; i++) { 
					if (markers[i].getTitle() === orgName) { 
						kakao.maps.event.trigger(markers[i], 'click'); // 마커 클릭 트리거 
						break; 
					} 
				} 
			}); 
			
			// 페이지 로드 시 첫 마커 오버레이 자동 열기 
			kakao.maps.event.trigger(markers[0], 'click'); 
			
	   		</script>

</section>
		
	</div>
</section>

<%@include file="/WEB-INF/views/includes/footer.jsp" %>