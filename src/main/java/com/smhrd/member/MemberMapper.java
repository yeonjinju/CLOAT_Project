package com.smhrd.member;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.smhrd.notice.NoticeVO;
import com.smhrd.review.ReviewVO;
import com.smhrd.upload.UploadVO;

@Mapper
public interface MemberMapper {

	public MemberVO login(MemberVO vo);
	public void join(MemberVO vo);	
	public int IdCheck(String id);
	public int update(MemberVO vo);
	public String findPw(MemberVO vo);
	public String findId1(MemberVO vo);
	public String findId2(MemberVO vo);
	
	@Delete("DELETE FROM tb_user WHERE id=#{id}")
	public int delete(String id);	
	
	public List<UploadVO> getTransformed_file(@Param("id") String id);
	
	public List<NoticeVO> newNotice();
	public List<ReviewVO> newReview();	
	
}