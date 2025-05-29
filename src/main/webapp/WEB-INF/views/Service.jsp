<%@include file="/WEB-INF/views/includes/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
					
<section class="content">
   <div class="page_top">
      <div class="inner">
         <h2 class="pageName">서비스</h2>
      </div>
   </div>
	<div class="inner">
		<div class="service">
		
			<p class="clk_intro">CLOAT만의 이미지 클로킹 서비스로 <br>안심하고 당신의 순간을 공유하세요</p>
			<small class="clk_info"><span class="marker">❗</span> 로그인 하시면 '마이 페이지 - 나의 갤러리'에서 제공하는 <br class="d_none">변환 이미지 클라우드 기능을 이용하실 수 있습니다.</small>
			
			<div class="inner inner_400">
				<div class="clk_wrap">
					<h1 class="clk clk_complete none">변환 완료!</h1>
					<!-- 변환전 -->
					<div class="clk_pre clk">
						<div class="filebox preview-image">
							<label for="profile_img" class="label_hidden"></label>
							<div class="upload-display">
								<img src="resources/images/img_thumb.png" alt="">
							</div>
							<input class="upload-name" value="파일선택" disabled="disabled">
							<input type="file" name="file" id="profile_img" class="upload-hidden" accept="image/*">
						</div>
					</div>
					
					<!-- 변환 후 이미지 -->
					<div class="clk_after clk none">
						<a href="#" target="_blank" id="cloking_after">
							<img src="resources/images/img_thumb.png" hidden>
						</a>			
					</div>
					
					<!-- 변환중 -->
					<div class="clk_ing clk loading-wrap none">
						<div class="loading-spinner"></div>
						<p>이미지를 안전하게 변환중입니다</p>
					</div>		
				</div>
				
				<!-- 버튼들 -->
				<div class="clk_bttn_wrap">
					<div class="clk_pre clk">
						<button class="bttn bttn_sbm2 disabled" id="change">딥페이크 방지 이미지로 변환</button>
					</div>
					
					<div class="clk_after clk none bttn_wrap">
						<a href="#" class="bttn bttn_sbm2" download id="clkDown"><img src="resources/images/ico_download.svg">다운로드</a>
						<button type="button" class="bttn bttn_sbm2" id="clkShare"><img src="resources/images/ico_share.svg">공유하기</button>
					</div>			
				</div>	
			</div>
			
				
		</div>			
	</div>

</section>



<script>
//이미지 업로드 로직
let fileTarget = $('.filebox .upload-hidden');
let filename = "";

fileTarget.on('change', function() {
    if (window.FileReader) {
        filename = $(this)[0].files[0]?.name;
    } else {
        filename = $(this).val().split('/').pop().split('\\').pop();
    }

    $(this).siblings('.upload-name').val(filename);
    $('#change').removeClass('disabled');
});

// 이미지 미리보기 및 유효성 검사 (확장자 & 용량)
let imgTarget = $('.preview-image .upload-hidden');

imgTarget.on('change', function() {
    let file = $(this)[0].files[0];

    if (!file) return;

    // 이미지 MIME 타입 허용 리스트
    let validTypes = ['image/jpeg', 'image/png', 'image/gif', 'image/webp', 'image/bmp'];
    let maxSize = 10 * 1024 * 1024; // 10MB

    // MIME 타입 검사
    if (!validTypes.includes(file.type)) {
        alert('이미지 파일만 업로드할 수 있습니다. (jpg, png, gif, webp 등)');
        $(this).val('');
        $(this).siblings('.upload-name').val(''); // 파일명 초기화
        return;
    }

    // 파일 용량 검사
    if (file.size > maxSize) {
        alert('10MB 이하의 이미지만 업로드할 수 있습니다.');
        $(this).val('');
        $(this).siblings('.upload-name').val('');
        return;
    }

    let parent = $(this).parent();
    let uploadDisplay = parent.find('.upload-display');
    let imgTag = uploadDisplay.find('.upload-thumb');

    if (window.FileReader) {
        let reader = new FileReader();
        reader.onload = function(e) {
            let src = e.target.result;

            if (imgTag.length > 0) {
                imgTag.attr('src', src);
            } else {
                uploadDisplay.html(
                    '<div class="upload-thumb-wrap"><img src="' + src + '" class="upload-thumb"></div>'
                );
            }
        }
        reader.readAsDataURL(file);
    } else {
        // 구형 브라우저 (IE 대응)
        $(this)[0].select();
        $(this)[0].blur();
        let imgSrc = document.selection.createRange().text;

        if (imgTag.length > 0) {
            imgTag[0].style.filter =
                "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\"" +
                imgSrc +
                "\")";
        } else {
            uploadDisplay.html('<div class="upload-thumb-wrap"><img class="upload-thumb"></div>');
            uploadDisplay.find('.upload-thumb')[0].style.filter =
                "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\"" +
                imgSrc +
                "\")";
        }
    }
});
</script>

<script>

	<c:if test="${!empty mvo}">
		let userId = "${mvo.id}";
	</c:if>

	$('#change').on("click",function(){
		
		//$('.zzz h1').text('변환 중');
		// input[type=file]에서 파일 가져오기
	    let fileInput = document.getElementById("profile_img");
	    let file = fileInput.files[0];
	
	    if (!file) {
	        alert("업로드할 이미지를 선택해주세요.");
	        return;
	    }
	    
	    $(".clk_ing").removeClass("none"); // 로딩스피너 보이게
	    
	    
	    let formData = new FormData();
	    formData.append('file', file);
	    
	    if (typeof userId !== 'undefined') {
	        formData.append('id', userId);
	    }
		
		$.ajax({                                                              
			data : formData,
			type : "POST",
			// url은 자신의 이미지 업로드 처리 컨트롤러 경로로 설정해주세요.
			url : 'change',  
			contentType : false,
			processData : false,
			enctype : 'multipart/form-data',                                  
			success : function(data) {   										
				console.log(data);
				
				// contextPath를 JSP에서 자바스크립트 변수로 받음
	            let contextPath = "${pageContext.request.contextPath}";
	            let fullPath = contextPath + data;
				console.log(fullPath);
	            // .zzz 클래스 내부 img 태그의 src 속성 변경
	            $(".clk_pre").addClass("none"); // 이전이미지 안보이게
	            $('.clk_ing').addClass('none'); // 로딩스피너 안보이게
	            $(".clk_after").removeClass("none"); // 변환이미지 보이게
	            $("#cloking_after").attr("href", fullPath); // a태그에 변환된 이미지 src 추가
	            $("#cloking_after img").attr("src", fullPath).removeAttr("hidden"); // 이미지에 변환된 src 추가
	            $("#clkDown").attr("href", fullPath);
	            $(".clk_complete").removeClass("none");        
	            
			}
		});
	
	});
	
	
	// 공유하기 버튼 클릭
	$("#clkShare").on('click', async () => {
	    const imageUrl = $("#cloking_after img").attr("src"); // 변환된 이미지 경로
	    const contextPath = window.location.origin; // 현재 페이지 URL로부터 베이스 URL 얻기
	    const fullImageUrl = contextPath + imageUrl; // 절대 경로로 변환
	
	    if ($('html').hasClass('desktop')) {  // 데스크탑 환경일 경우
	        // 데스크탑 환경에서 링크 복사
	        const tempInput = document.createElement('input');
	        document.body.appendChild(tempInput);
	        tempInput.value = fullImageUrl;
	        tempInput.select();
	        document.execCommand('copy');
	        document.body.removeChild(tempInput);
	        console.log('링크가 클립보드에 복사되었습니다!');
	        alert('이미지 링크가 클립보드에 복사되었습니다.');
	    } else if($('html').hasClass('mobile')){  // 모바일 환경일 경우
	        // 모바일 환경에서 `navigator.share()` 사용
	        try {
	            await navigator.share({
	                title: 'CLOAT 이미지 보호',
	                text: '이 이미지는 딥페이크 방지를 위해 보호되었습니다.',
	                url: fullImageUrl, // 절대 경로를 사용
	            });
	            console.log('공유 성공!');
	        } catch (err) {
	            console.error('공유 실패:', err);
	        }
	    } else {
	        console.log('이 브라우저는 공유 기능을 지원하지 않습니다.');
	    }
	});

	
</script>					


<%@include file="/WEB-INF/views/includes/footer.jsp"%>