<%@include file="/WEB-INF/views/includes/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
						<div class="cont">
							<div class="info_cont">
								<div class="title_area">
									<span class="sub_tit">${center.sido}</span>
									<span class="tit">${center.org_name}</span>
								</div>
								<div class="data_list_area">
									<li class="">
										<img src="resources/images/ico_location_on.svg" class="ico">${center.addr}
									</li>
									<li class="">
										<img src="resources/images/ico_call.svg" class="ico">${center.org_tel}
									</li>
								</div>
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
	   		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(${mapvo[0].lat}, ${mapvo[0].lon}), // 지도의 중심좌표
				level : 8 // 지도의 확대 레벨
			};
	   		
	   		var infowindowArray = [];
	   		var markers = [];
	   		
	   		// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption);
	   		
			var positions = [
			    <c:forEach var="center" items="${mapvo}" varStatus="status">
			        {
			        	// 이 부분 인포윈도우 디자인
			        	content: `<div style="width: 100%; height: 100%; padding:5px;">
			        				<div class="cont" style="border: none;">
			        					<div class="info_cont">
			                				<div class="title_area">
			                  					<div class="sub_tit">${center.sido}</div>
			                  					<div class="title">${center.org_name}</div>
			                				</div>
			                				<div class="data_list_area">
			                  					<li class="icon01">${center.addr}</li>
			                  					<li class="icon02">${center.org_tel}</li>
			                				</div>
			              				</div>
			              		  	</div>
			              		  </div>
			  			`,
			        	
			            title: '${center.org_name}',
			            latlng: new kakao.maps.LatLng(${center.lat}, ${center.lon})
			        }<c:if test="${!status.last}">,</c:if>
			    </c:forEach>
			]
			var selectedMarker = null;
			
			// 마커 이미지의 이미지 주소입니다
			var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
			
			// 마커 이미지의 이미지 크기 입니다
		    var imageSize = new kakao.maps.Size(24, 35); 
		    var imageSize2 = new kakao.maps.Size(48, 70); 
		    // 마커 이미지를 생성합니다    
		    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
			var clickImage = new kakao.maps.MarkerImage(imageSrc, imageSize2);     
		    
			for (let i = 0; i < positions.length; i ++) {
			    
			    // 마커를 생성합니다
			    var marker = new kakao.maps.Marker({
			        map: map, // 마커를 표시할 지도
			        position: positions[i].latlng, // 마커를 표시할 위치
			        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
			        image : markerImage // 마커 이미지 
			    });
			    
			    // 마커에 표시할 인포윈도우를 생성
			    var infowindow = new kakao.maps.InfoWindow({
			        content: positions[i].content // 인포윈도우에 표시할 내용
			    });
			    
			    infowindowArray.push(infowindow);
			    markers.push(marker); // 배열에 마커 저장
			    
			    // 마커에 click 이벤트를 등록합니다
			    kakao.maps.event.addListener(marker, 'click', test(map,marker,infowindow, positions[i].latlng));
			 	
			}
			
			function test(map, marker,infowindow,latlng){
				return function(){
					closeInfoWindow();
					infowindow.open(map, marker);
					selectedMarker = marker;
					map.panTo(latlng);
				};
			}
		
			
			// 인포윈도우를 닫는 함수
			function closeInfoWindow() {
			  for (infowindow of infowindowArray) {
			    infowindow.close();
			  }
			}
			
			$('.map_list .cont').click(function() {
				  var orgName = $(this).find('.tit').text();
		  		
				  // markers 배열에서 title이 일치하는 마커 찾기
				  for (let i = 0; i < markers.length; i++) {
				        if (markers[i].getTitle() == orgName) {
				            kakao.maps.event.trigger(markers[i], 'click'); // 마커 클릭 트리거
				            break;
				        }
				  }
			});
			
			kakao.maps.event.trigger(markers[0], 'click');
	   		</script>
		
	</div>
</section>

<%@include file="/WEB-INF/views/includes/footer.jsp" %>