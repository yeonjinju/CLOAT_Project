<%@include file="/WEB-INF/views/includes/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<section class="content">
		<div class="inner inner_500">
			<h2 class="page_name2">아이디/비밀번호 찾기</h2>
			<div class="find">
				<ul class="tabTit">
					<li class="tabTit_id on" onClick="tabOpen('_id')">아이디 찾기</li>
					<li class="tabTit_pw" onClick="tabOpen('_pw')">비밀번호 찾기</li>
				</ul>			
				<div class="tabCont tabCont_id on">
					<div class="radio_wrap">
						<div class="radio_div">
							<input type="radio" name="find_id" id="id_phone" checked="checked" />
							<label for="id_phone">
							  <span class="rad_btn"></span>
							  <span class="rad_txt">회원정보에 등록된 연락처로 찾기</span>
							</label>
						</div>				
						<div class="radio_div">
							<input type="radio" name="find_id" id="id_email" />
							<label for="id_email">
							  <span class="rad_btn"></span>
							  <span class="rad_txt">회원정보에 등록된 이메일로 찾기</span>
							</label>
						</div>				
					</div>
					<form id="form_id_phone" target="iframe3" class="form_id form_id_phone">							
						<ul class="form_ul">
							<li>
								<span class="form_label">이름</span>
								<input type="text" name="name" placeholder="이름을 입력해주세요" class="ipt_tt" required>
							</li>
							<li>
								<span class="form_label">연락처</span>
								<input type="text" name="phone" placeholder="연락처를 입력해주세요" class="ipt_tt" required>					
							</li>							
							<li>
								<button type="button" id="submit1" class="bttn bttn_sbm2">아이디 찾기</button>
							</li>
						</ul>
					</form>				
					<form id = "form_id_email" target="iframe2" class="form_id form_id_email" style="display: none;">					
						<ul class="form_ul">
							<li>
								<span class="form_label">이름</span>
								<input type="text" name="name" placeholder="이름을 입력해주세요" class="ipt_tt" required>
							</li>
							<li>
								<span class="form_label">이메일</span>
								<input type="text" name="email" placeholder="이메일을 입력해주세요" class="ipt_tt" required>					
							</li>							
							<li>
								<button type="button" id="submit2" class="bttn bttn_sbm2">아이디 찾기</button>
							</li>
						</ul>
					</form>			
				</div>
				<div class="tabCont tabCont_pw">
					<form id ="form_pw" target="iframe1">
						<ul class="form_ul">
							<li>
								<span class="form_label">아이디</span>
								<input type="text" name="id" placeholder="아이디를 입력해주세요" class="ipt_tt" required>
							</li>
							<li>
								<span class="form_label">이름</span>
								<input type="text" name="name" placeholder="이름을 입력해주세요" class="ipt_tt" required>
							</li>								
							<li>
								<span class="form_label">비밀번호 질문</span>
								<select name="pass_qa" class="sel" required>
									<option value="0" seleceted>'어머니의 성함은 무엇인가요?'</option>
	            					<option value="1">'아버지의 성함은 무엇인가요?'</option>
	            					<option value="2">'초등학교 이름은 무엇인가요?'</option>
	            					<option value="3">'첫 애완동물의 이름은 무엇인가요?'</option>
	            					<option value="4">'당신이 좋아하는 색깔은 무엇인가요?'</option>
	            					<option value="5">'어릴 적 별명은 무엇인가요?'</option>
	            					<option value="6">'태어난 도시는 어디인가요?'</option>
	            					<option value="7">'가장 좋아하는 음식은 무엇인가요?'</option>
	            					<option value="8">'가장 친한 친구의 이름은 무엇인가요?'</option>
	            					<option value="9">'첫 해외여행을 간 나라는 어디인가요?'</option>
								</select>					
							</li>	
							<li>
								<span class="form_label">비밀번호 답변</span>
								<input type="text" name="pass_answer" placeholder="비밀번호 답변을 입력해주세요" class="ipt_tt" required>					
							</li>														
							<li>
								<button type="button" id="submit3" class="bttn bttn_sbm2">비밀번호 찾기</button>
							</li>
						</ul>
					</form>
				</div>			
			</div>
		</div>
	</section>
	
	<div class="popWrap popWrap_find">
		<div class="popBg" onClick="popClose()"></div>
		<div class="popBox">
			<div class="popClose" onClick="popClose()">
				<img src="resources/images/close.svg">
			</div>		
			<div class="pop_tit"></div>
			<div class="pop_cont"></div>
			<a href="login" class="bttn bttn_sbm2 wh">로그인하러 가기</a>		
		</div>
	</div>	
	
	<script>
	function tabOpen(tabClass) {
		console.log(this);
		$('.tabTit' + tabClass).addClass('on').siblings('li').removeClass('on');  // 탭 버튼 선택 해제
		$('.tabCont' + tabClass).addClass('on').siblings('.tabCont').removeClass('on'); // 선택한 탭만 보이기
	}
	
	$('input[type="radio"]').on('change', function() {
		let radioId = $(this).attr('id');
		$('.form_id').hide();
		$('.form_'+radioId).show();
	});
	
	$(function(){
		$('#submit1').on("click", function(){
			
			var form1 = $("#form_id_phone").serialize();
			var name = $("#form_id_phone input[name='name']").val();
			
			$.ajax({
				type: "post",
				url: "findId1",
				data: form1,
                success: function (data) {
                    //$('#sendId1').text(data);
        			$(".popWrap_find").show();
        			$("html, body").css('overflow','hidden');
        			$(".pop_tit").text("아이디 찾기");
        			$(".pop_cont").html(name+"님의 아이디는 <br><b>"+data+"</b>입니다.");
                },
				error: function(xhr, status, error) {
					  alert("오류가 발생했습니다: " + error);
				}			
			})
			
		})
	})
	
	$(function(){
		$('#submit2').on("click", function(){
			
			var form1 = $("#form_id_email").serialize();
			var name = $("#form_id_email input[name='name']").val();
			
			$.ajax({
				type: "post",
				url: "findId2",
				data: form1,
                success: function (data) {
                    //$('#sendId2').text(data);
        			$(".popWrap_find").show();
        			$("html, body").css('overflow','hidden');
        			$(".pop_tit").text("아이디 찾기");
        			$(".pop_cont").html(name+"님의 아이디는 <br><b>"+data+"</b>입니다.");    
                },
				error: function(xhr, status, error) {
					  alert("오류가 발생했습니다: " + error);
				}	
			})
			
		})
	})
	
	$(function(){
		$('#submit3').on("click", function(){
			
			var form1 = $("#form_pw").serialize();
			var id = $("#form_pw input[name='id']").val();
			
			$.ajax({
				type: "post",
				url: "findPw",
				data: form1,
                success: function (data) {
                    //$('#sendPw').text(data);
                    $(".popWrap_find").show();
        			$("html, body").css('overflow','hidden');
        			$(".pop_tit").text("아이디 찾기");
        			$(".pop_cont").html(id+"님의 비밀번호는 <br><b>"+data+"</b>입니다.");        
                },
				error: function(xhr, status, error) {
					  alert("오류가 발생했습니다: " + error);
				}	
			})
			
		})
	})
	
	

	
	</script>
<%@include file="/WEB-INF/views/includes/footer.jsp" %>