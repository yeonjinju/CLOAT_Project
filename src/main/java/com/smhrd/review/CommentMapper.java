package com.smhrd.review;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface CommentMapper {

    int increaseHeart(@Param("cmt_idx") int cmt_idx);

    int getHeartCount(@Param("cmt_idx") int cmt_idx);

    int countByUserAndComment(@Param("id") String id, @Param("cmt_idx") int cmt_idx);

    int insertCommentHeart(@Param("id") String id, @Param("review_idx") int review_idx, @Param("cmt_idx") int cmt_idx);
}