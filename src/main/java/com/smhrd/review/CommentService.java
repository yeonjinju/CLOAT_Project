package com.smhrd.review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentService {

    @Autowired
    private CommentMapper commentMapper;
    
    public boolean likeComment(CommentHeartVO vo) {
        System.out.println("[CommentService] 좋아요 처리 시작: " + vo);

        int count = commentMapper.countByUserAndComment(vo.getId(), vo.getCmt_idx());
        
        if (count > 0) {
            System.out.println("[CommentService] 이미 좋아요 누름");

            return false;
        }
        commentMapper.insertCommentHeart(vo.getId(), vo.getReview_idx(), vo.getCmt_idx());
        
        commentMapper.increaseHeart(vo.getCmt_idx());
        System.out.println("[CommentService] 좋아요 처리 완료");

        return true;
    }
    
    public int getHeartCount(int cmt_idx) {
        int count = commentMapper.getHeartCount(cmt_idx); // 변수 선언 및 값 할당
        System.out.println("[CommentService] 좋아요 수: " + count);
        return count;
    }

    
    
}
