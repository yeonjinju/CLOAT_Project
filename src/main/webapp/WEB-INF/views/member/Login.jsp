<%@include file="/WEB-INF/views/includes/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String savedId = "";
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie c : cookies) {
            if (c.getName().equals("id")) {
                savedId = c.getValue();
                break;
            }
        }
    }
    request.setAttribute("savedId", savedId);
%>
    
<section class="content login">
	<div class="inner inner_500">
		<h2 class="page_name2">로그인</h2>
		<form action="login_do" method="post">
			<ul class="form_ul">
				<li>
					<span class="form_label">ID</span>
					<input type="text" name="id" placeholder="ID를 입력해주세요" class="ipt_tt" maxlength="100" 
					value="${not empty savedId ? savedId : ''}" required>
				</li>
				<li>
					<span class="form_label">PW</span>
					<div class="po_rel">
						<input type="password" name="pw" placeholder="PW를 입력해주세요" class="ipt_tt" maxlength="200" required>
						<div class="po_ab pwview" onClick="pkView(this)">
							<img src="resources/images/visibility_off.svg" alt="">
						</div>						
					</div>
					<div class="chkbox_div">
						<input type="checkbox" name="id_save" id="id_save" value="id_save" <c:if test="${not empty savedId}">checked</c:if>>
						<label for="id_save" class="chk_btn"></label>
						<label for="id_save" class="chk_txt">아이디 저장</label>
						<a href="find" class="ml-auto">아이디/비밀번호 찾기</a>
					</div>						
				</li>
				<li>
					<input type="submit" value="로그인" class="bttn bttn_sbm2">
				</li>
				<li>
					<a href="join" class="bttn bttn_sbm2 wh">회원가입</a>
				</li>
			</ul>
		</form>
	</div>
</section>
<%@include file="/WEB-INF/views/includes/footer.jsp" %>