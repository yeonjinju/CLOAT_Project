<%@ include file="/WEB-INF/views/includes/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<section class="content board write">
	<div class="page_top">
		<div class="inner">
			<h2 class="pageName">문의사항</h2>
		</div>
	</div>
	<div class="inner">
		<!-- 새 글이면 QnaUpload, 수정이면 qnaEdit -->
		<form action="${qna != null ? 'updateQnaEdit' : 'QnaUpload'}"
			method="post" enctype="multipart/form-data">
			<ul class="write_ul">
				<li><span>ID</span> <input type="text" name="id"
					value="${mvo.id}" readonly></li>
				<li><span>제목</span> <input type="text" name="qna_title"
					required value="${qna != null ? qna.qna_title : ''}"></li>
				<li><span>내용</span> <textarea name="qna_content"
						id="summernote" required>${qna != null ? qna.qna_content : ''}</textarea>
				</li>
				<li><span>첨부파일</span> <input type="file" name="file"> <c:if
						test="${not empty qna.qna_file}">
						<div>기존 파일: ${qna.qna_file}</div>
						<input type="hidden" name="qna_file" value="${qna.qna_file}" />
					</c:if></li>

			</ul>

			<c:if test="${qna != null}">
				<input type="hidden" name="qna_idx" value="${qna.qna_idx}" />
			</c:if>

			<div class="bttn_wrap">
				<input type="submit" value="${qna != null ? '수정완료' : '작성완료'}">
				<a href="javascript:history.back();">취소</a>
			</div>
		</form>
	</div>

	<script>
		$('#summernote').summernote(
				{
					height : 800,
					lang : 'ko-KR',
					toolbar : [
							[ 'fontsize', [ 'fontsize' ] ],
							[
									'style',
									[ 'bold', 'italic', 'underline',
											'strikethrough', 'clear' ] ],
							[ 'color', [ 'color' ] ], [ 'table', [ 'table' ] ],
							[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
							[ 'height', [ 'height' ] ],
							[ 'insert', [ 'picture' ] ] ],
					fontNames : [ 'Arial', 'Arial Black', 'Comic Sans MS',
							'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림', '돋음체',
							'바탕체' ],
					fontSizes : [ '8', '9', '10', '11', '12', '14', '16', '18',
							'20', '22', '24', '28', '30', '36', '50', '72',
							'96' ],
					focus : true,
					callbacks : {
						onImageUpload : function(files, editor, welEditable) {
							for (var i = 0; i < files.length; i++) {
								imageUploader(files[i], this);
							}
						}
					}
				});

		function imageUploader(file, el) {
			var formData = new FormData();
			formData.append('file', file);

			$.ajax({
				data : formData,
				type : "POST",
				url : 'upload',
				contentType : false,
				processData : false,
				enctype : 'multipart/form-data',
				success : function(data) {
					$(el).summernote(
							'insertImage',
							"${pageContext.request.contextPath}/resources/upload/"
									+ data, function($image) {
								$image.css('max-width', "100%");
							});
					console.log(data);
				}
			});
		}
	</script>
</section>
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
