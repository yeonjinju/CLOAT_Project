<%@ include file="/WEB-INF/views/includes/header.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<section class="content board view list">
    <div class="page_top">
        <div class="inner">
            <h2 class="pageName">뉴스</h2>
        </div>
    </div>			
    <div class="inner">
        <div class="view_wrap">
            <div class="view_top">
                <h3 class="view_title">${news.news_title}</h3>
                <div class="view_info">
                    <div class="view_info_lt">
                        <p><span>작성자</span> ${news.admin_id}</p>
                        <p><span>조회수</span> ${news.news_views}</p>
                    </div>
                    <div class="view_info_rt">
                        <p><span>작성날짜</span><fmt:formatDate value="${news.created_at}" pattern="yyyy.MM.dd HH:mm:ss" /></p>
                    </div>
                </div>
            </div>
            <div class="view_btm">
                ${news.news_content}
                
                <!-- 첨부파일이 있을 경우 표시 -->
                <c:if test="${not empty news.news_file}">
                    <div class="view_file">
                        <a href="${pageContext.request.contextPath}/resources/file/${news.news_file}" download>${news.news_file}</a>
                    </div>
                </c:if>
            </div>
        </div>	
        
        <div class="bttn_wrap">
			<div>
				<!-- admin 만 보임 --> 
				<c:if test="${mvo.getUser_type() == 'ADMIN'}">
				<button onClick="writeBtn()" class="bttn ipt_sbm">글쓰기</button>
                <button onClick="location.href='NewsEdit?no=${news.news_idx}'" class="bttn">수정</button>
                <button onClick="location.href='NewsDelete?no=${news.news_idx}'" class="bttn">삭제</button>
				<script>
						let writeBtn = () => {		
							window.location.href = "NewsWrite";		
						}
				</script>                
                </c:if>
            </div>
            <div class="ml-auto">
            	<a href="${pageContext.request.contextPath}/NewsList?pageNum=${pageNum}" class="bttn ipt_sbm">목록</a>
				<button class="bttn" onClick="pageTop()">
					<img src="resources/images/bk_arr_top.png" alt="">TOP
				</button>            	
            </div>				
        </div>        
        
        				
    </div>	
</section>

</body>
</html>