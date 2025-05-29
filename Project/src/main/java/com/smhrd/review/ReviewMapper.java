package com.smhrd.review;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;


@Mapper
public interface ReviewMapper {

	public List<ReviewVO> ReviewList();
    ReviewVO getReview(int review_idx);
    int getTotalCount();
    List<ReviewVO> getReviewsByPage(@Param("startRow") int startRow, @Param("endRow") int endRow);
    void updateReviewViews(@Param("reviewIdx") int reviewIdx);
	public int write(ReviewVO vo); // 글쓰기기능
	public List<ReviewVO> ReviewSearch(String searchValue, String searchContent); // 검색 기능
	
	public ReviewVO getAnswerByReviewIdx(int review_idx); // 답변 조회 (1개만)
	public int insertReviewAnswer(ReviewVO vo); // 답변 작성
	public int updateReviewAnswer(ReviewVO vo); // 답변 수정
	public int deleteReviewAnswer(ReviewVO vo); // 답변 삭제
	
	public List<ReviewVO> MyReview(@Param("startRow") int startRow, @Param("endRow") int endRow, @Param("id") String id); // 마이페이지 - 내가 쓴 후기
	

	public int updateReviewEdit(ReviewVO vo);
	ReviewVO selectReviewByNo(int review_idx);
    int deleteReviewByNo(int review_idx);
    int deleteReviewAnswerByReviewIdx(int review_idx);
    
    
    
    // mapper.java 좋아요
    int getCommentReaction(@Param("cmtIdx") int cmtIdx, @Param("userId") String userId);
    void insertCommentReaction(@Param("cmtIdx") int cmtIdx, @Param("userId") String userId, @Param("reaction") char reaction);
    void updateCommentReaction(@Param("cmtIdx") int cmtIdx, @Param("userId") String userId, @Param("reaction") char reaction);
    void deleteCommentReaction(@Param("cmtIdx") int cmtIdx, @Param("userId") String userId);
    void updateHeartCount(@Param("cmtIdx") int cmtIdx, @Param("value") int value);
    int getHeartCount(@Param("cmtIdx") int cmtIdx);


}