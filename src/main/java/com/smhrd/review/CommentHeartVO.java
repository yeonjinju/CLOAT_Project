package com.smhrd.review;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommentHeartVO {
    private String id;        // 사용자 id
    private int review_idx;  
    private int cmt_idx;      // 댓글 번호 (통일)
}