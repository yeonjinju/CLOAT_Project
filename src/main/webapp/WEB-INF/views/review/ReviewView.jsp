<%@ include file="/WEB-INF/views/includes/header.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<section class="content board view list">
    <div class="page_top">
        <div class="inner">
            <h2 class="pageName">고객후기</h2>
        </div>
    </div>			
    <div class="inner">
        <div class="view_wrap">
            <div class="view_top">
                <h3 class="view_title">${review.review_title}</h3>
                <div class="view_info">
                    <div class="view_info_lt">
                        <p><span>작성자</span> ${review.id}</p>
                        <p><span>조회수</span> ${review.review_views}</p>
                    </div>
                    <div class="view_info_rt">
                        <p><span>작성날짜</span><fmt:formatDate value="${review.created_at}" pattern="yyyy.MM.dd HH:mm:ss" /></p>
                    </div>
                </div>
            </div>
            <div class="view_btm">
                ${review.review_content}
                
                <!-- 첨부파일이 있을 경우 표시 -->
                <c:if test="${not empty review.review_file}">
                    <div class="view_file">
                        <a href="${pageContext.request.contextPath}/resources/file/${review.review_file}" download>${review.review_file}</a>
                    </div>
                </c:if>
            </div>
        </div>	
        
		<div class="cmt_wrap admin_answer">
			<!-- 댓글이 있다면 : 댓글리스트 출력(게시글당 댓글 1개만 가능!) -->
			<ul class="cmt_list">
				<!-- 답변이 있으면 보여준다 -->
				<c:choose>		
					<c:when test="${not empty answer}">
					<li>
						<div class="cmt_box">
							<div class="cmt_top">
								<div class="cmt_mb">
									<div class="mb_img"><img src="resources/images/logo.svg" alt=""></div>
								</div>
							</div>
							<div class="cmt_btm">
								<div class="answerDiv">
									<div class="content_wrap">
										<div style="white-space:pre;" class="answer_content">${answer.cmt_content}</div>
										<div class="cmt_time"><fmt:formatDate value="${answer.created_at}" pattern="yyyy.MM.dd HH:mm:ss" /></div>									
									</div>
									
									<c:if test="${not empty sessionScope.mvo}">
										<div class="cmt_like_wrap">
	                                        <p class="reaction-label">이 답변이 도움이 되셨나요?</p>
	                                        <form action="commentLike" method="post">
	                                           <input type="hidden" name="id" value="${sessionScope.mvo.id}" />
	                                           <input type="hidden" name="review_idx" value="${review.review_idx}" />                                           
	                                           <input type="hidden" name="cmt_idx" value="${answer.cmt_idx}" />
	                                           <button type="submit" class="bttn like">👍좋아요&nbsp;&nbsp;${answer.cmt_heart}</button>
	                                       </form>										
										</div>
                                        <!-- <p>좋아요 : 개</p> -->
                                    </c:if>
                                    
		                            <%-- 관리자만 보이는 수정/삭제 버튼 --%>
		                            <c:if test="${sessionScope.mvo.user_type eq 'ADMIN'}">
		                            <div class="cmt_bttn bttn_wrap">
		                            	<button type="button" onClick="viewCmtEdit()" class="bttn bttn_sbm">수정</button>
										<form action="${pageContext.request.contextPath}/deleteReviewAnswer?id=${mvo.id}" method="post">
										    <input type="hidden" name="cmt_idx" value="${answer.cmt_idx}" />
										    <input type="hidden" name="review_idx" value="${review.review_idx}" />
										    <input class="bttn bttn_sbm" type="submit" value="삭제">		
										</form>	
		                            </div>	
									<script>									
										function viewCmtEdit(){
											$(".answerDiv").hide();
											$(".answerTextarea").show();
										}
									</script>		                            	
		                            </c:if>							
								</div>
								<div class="answerTextarea">
			                        <form action="${pageContext.request.contextPath}/updateReviewAnswer?id=${mvo.id}" method="post">
			                            <textarea name="cmt_content" class="txtarea">${answer.cmt_content}</textarea>
			                            <div class="cmt_time"><fmt:formatDate value="${answer.created_at}" pattern="yyyy.MM.dd HH:mm:ss" /></div>			
			                            <input type="hidden" name="cmt_idx" value="${answer.cmt_idx}" />
			                            <input type="hidden" name="review_idx" value="${review.review_idx}" />
			                            <div class="cmt_bttn bttn_wrap">
			                            	<input class="bttn bttn_sbm" type="submit" value="수정">				                            	
			                            </div>
			                        </form>								
								</div>								
							</div>						
						</div>
					</li>
					</c:when>
					<%-- 답변 없을때 답변 등록창 --%>
	                <c:otherwise>
	                    <c:if test="${sessionScope.mvo.user_type eq 'ADMIN'}">
						<li>
							<div class="cmt_box">
								<div class="cmt_top">
									<div class="cmt_mb">
										<!-- 프로필 이미지 출력 / 등록된 이미지 없다면 기본이미지 user.png -->
										<div class="mb_img"><img src="resources/images/logo.svg" alt=""></div>
									</div>	 
								</div>                   
								<div class="cmt_btm">
			                        <form action="${pageContext.request.contextPath}/writeReviewAnswer?id=${mvo.id}" method="post">
			                            <textarea name="cmt_content" class="txtarea" placeholder="답변 내용을 작성하세요."></textarea>
			                            <input type="hidden" name="review_idx" value="${review.review_idx}" />
			                            <div class="cmt_bttn bttn_wrap">
			                            	<input class="bttn bttn_sbm" type="submit" value="등록">	
			                            </div>			                            		
			                        </form>		
								</div>			                        
							</div>
						</li>			                        
	                    </c:if>
	                </c:otherwise>					
				</c:choose>
			</ul>
		</div>        
        
        
        <div class="bttn_wrap">
			<div>
	        	<button onClick="writeBtn()" class="bttn ipt_sbm">글쓰기</button>
				<script>
				      let writeBtn = () => {
				         // 로그인 상태 아니면
				         //alert('로그인해주세요');
				         <c:if test="${!empty mvo}">
				            window.location.href = "ReviewWrite";
				         </c:if>
				         <c:if test="${empty mvo}">
				            alert('로그인해주세요');
				         </c:if>
				         // 로그인 상태면
				         // -> 아이디 정보 가지고 글쓰기 페이지로 이동
				      }
				   </script>
				<!-- 해당 글 작성자 / ADMIN만 보임 -->
				<c:if test="${sessionScope.mvo.id eq review.id or sessionScope.mvo.user_type eq 'ADMIN'}">
				<button onClick="location.href='ReviewEdit?no=${review.review_idx}'" class="bttn">수정</button>
				<button onClick="location.href='ReviewDelete?no=${review.review_idx}'" class="bttn">삭제</button>
				</c:if>
			</div>
			<div class=ml-auto"">
				<a href="${pageContext.request.contextPath}/ReviewList?pageNum=${pageNum}" class="bttn ipt_sbm">목록</a>
				<button class="bttn" onClick="pageTop()">
					<img src="resources/images/bk_arr_top.png" alt="">TOP
				</button>
			</div>            
        </div>				
    </div>	
</section>

</body>
</html>
