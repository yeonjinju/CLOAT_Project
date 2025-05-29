// 전체 적용되는 공통 js 파일입니다!

// 스크롤시 헤더 고정
$(window).on('scroll load', function() {
	if ($(window).scrollTop() > 5) {
		$('.header').addClass('scrl');
	} else {
		$('.header').removeClass('scrl');
	}
});

// 클릭하면 페이지 상단으로 이동
function pageTop() {
	$('html, body').animate({ scrollTop: '0' }, 600);
}	

// 비밀번호 확인
function pkView(el) {
	const $input = $(el).prev('input');
	const $img = $(el).find('img');

	if ($input.attr('type') === 'password') {
		$input.attr('type', 'text');
		$img.attr('src', 'resources/images/visibility.svg');
	} else {
		$input.attr('type', 'password');
		$img.attr('src', 'resources/images/visibility_off.svg');
	}
}


// header에서 cloat 메뉴의 링크 클릭시 이동
$(document).on('click', '.about-link > li > a', function(e) {
    let targetHash = this.hash;
    let aboutPage = 'about';

    if (location.pathname.endsWith(aboutPage)) {
        e.preventDefault();
        let h_height = $('.header').outerHeight();
        let target = $(targetHash);
        if (target.length) {
            $('html, body').scrollTop(target.offset().top - h_height);
        }
    } else {
        e.preventDefault();
        //if(targetHash == "#why"){
        	//window.location.href = aboutPage;
        //}else{
        	window.location.href = aboutPage + targetHash;
        //}
    }
});

// 접속 브라우저 체크
var userAgentCheck = function(){    
var ua = navigator.userAgent.toString().toLowerCase();
var agent =  {
		ie : (/msie/i).test(ua) || (/trident/i).test(ua),
		firefox: (/firefox/i).test(ua),
		webkit: (/applewebkit/i).test(ua),
		chrome: (/chrome/i).test(ua),
		opera: (/opera/i).test(ua),
		ios: (/ip(ad|hone|od)/i).test(ua),
		android: (/android/i).test(ua)
	};

	agent.safari = agent.webkit && !agent.chrome;
	agent.mobile = document.ontouchstart !== undefined && ( agent.ios || agent.android );
	agent.desktop = !(agent.ios || agent.android);

	// ie 버전체크
	if(agent.ie){
		var _ieversion = ua.match(/(msie |trident.*rv[ :])([0-9]+)/)[2];
		_ieversion = Math.floor(_ieversion);
		agent.ie = "ie"+_ieversion;
	}                

	agent.os = (navigator.appVersion).match(/(mac|win|linux)/i);
	agent.os =  agent.os ? agent.os[1].toLowerCase() : '';  

	var _html = document.getElementsByTagName('html')[0];
	var _class = '';
	for (var value in agent) {
		  if(agent[value]){                                
				if(value == 'os'){
					_class += agent.os;
				}else if(value == 'ie'){
					_class += agent[value]+' ';
				}else{
					_class += value+' ';
				}
		  }                      
	}
	_html.className += _class;
   
 }();
 
// 모바일 헤더

//menu_wrap_on
function menuToggle (){
	$('.menu_wrap, .header').toggleClass('menu_on');
	$('html, body').toggleClass('hd');
};

//submenu_on
$(document).ready(function() {
	$('.mo_link').click(function(e){
	    e.preventDefault();

		let moSubmenu = $(this).siblings('.submenu');
	
		if(moSubmenu){
			var moSubmenuAttr = $(this).siblings('.submenu').css('display');
			$('.submenu').slideUp(300);
			if(moSubmenuAttr == 'none'){
				$(this).parent('li').siblings('li').removeClass('open');
				$(this).parent('li').addClass('open');
				$(this).siblings('.submenu').slideDown(300);
			}else{
				$(this).parent('li').removeClass('open');
				$(this).siblings('.submenu').slideUp(300); 
			}
		}
	});
});

