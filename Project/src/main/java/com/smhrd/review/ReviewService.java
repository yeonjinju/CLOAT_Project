package com.smhrd.review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class ReviewService {

    @Autowired
    private ReviewMapper reviewMapper;
    

    public void increaseViews(int reviewNo) { // 조회수 증가
    	reviewMapper.updateReviewViews(reviewNo);
    }

    public ReviewVO getReviewDetail(int reviewIdx) { // Review 상세 게시글 조회
        return reviewMapper.getReview(reviewIdx);
    }

    public ReviewVO getReviewDetail(String reNum) { // review 상세 게시글 조회 (문자열 받아서 int 변환)
        int reviewIdx = Integer.parseInt(reNum);
        return getReviewDetail(reviewIdx);
    }

    // Answer 조회
    public ReviewVO getAnswer(int reviewIdx) {
        return reviewMapper.getAnswerByReviewIdx(reviewIdx);
    }
    
    // Answer 작성
    public int writeReviewAnswer(ReviewVO vo) {
        return reviewMapper.insertReviewAnswer(vo);
    }
    // Answer 수정
    public int updateReviewAnswer(ReviewVO vo) {
        return reviewMapper.updateReviewAnswer(vo);
    }
    // Answer 삭제
    public int deleteReviewAnswer(ReviewVO vo) {
        return reviewMapper.deleteReviewAnswer(vo);
    }
    

    
    public int updateReviewEdit(ReviewVO vo) {
		return reviewMapper.updateReviewEdit(vo);
	}
	
	public int deleteReview(int review_idx) {
	    // 1. 먼저 해당 Review 글에 연결된 답변 삭제
	    reviewMapper.deleteReviewAnswerByReviewIdx(review_idx);
	    
	    // 2. 그런 다음 Review 글 삭제
	    return reviewMapper.deleteReviewByNo(review_idx);
	}
	
	
	

    // 좋아요 토글 (눌렀으면 삭제, 없으면 추가)
	public boolean toggleLike(int cmtIdx, String userId) {
	    System.out.println("[Service] toggleLike 호출됨 - cmtIdx: " + cmtIdx + ", userId: " + userId);
	    
	    // 로직 예시
	    int status = reviewMapper.getCommentReaction(cmtIdx, userId); 
	    System.out.println("[Service] 현재 상태: " + status);

	    if (status == 1) {
	    	reviewMapper.deleteCommentReaction(cmtIdx, userId);
	    	reviewMapper.updateHeartCount(cmtIdx, -1);
	        return false;
	    } else {
	        if (status == 2) {
	        	reviewMapper.updateHeartCount(cmtIdx, 1); // dislike 취소
	        }
	        if (status == 0) {
	        	reviewMapper.insertCommentReaction(cmtIdx, userId, 'L');
	        } else {
	        	reviewMapper.updateCommentReaction(cmtIdx, userId, 'L');
	        }
	        reviewMapper.updateHeartCount(cmtIdx, 1);
	        return true;
	    }
	}


    // 좋아요 수 조회
    public int getHeartCount(int cmtIdx) {
        return reviewMapper.getHeartCount(cmtIdx);
    }
	
	

    
}
