package com.smhrd.answer;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AnswerMapper {

	
	// 답변 조회 (1개만)
	public AnswerVO getAnswerByQnaIdx(int qna_idx);

	// 답변 작성
	public int insertAnswer(AnswerVO vo);

	// 답변 수정
	public int updateAnswer(AnswerVO vo);

	// 답변 삭제
	public int deleteAnswer(int answer_idx);

}
