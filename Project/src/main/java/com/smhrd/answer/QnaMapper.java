package com.smhrd.answer;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.smhrd.answer.AnswerVO;

@Mapper
public interface QnaMapper {

	public List<QnaVO> QnaList();

    QnaVO getQna(int qna_idx);

    int getTotalCount();

    List<QnaVO> getQnasByPage(@Param("startRow") int startRow, @Param("endRow") int endRow);

    void updateQnaViews(@Param("qnaIdx") int qnaIdx);
    // 글쓰기 기능
	public int write(QnaVO vo);
	// 검색 기능
	public List<QnaVO> QnaSearch(String searchValue, String searchContent);
	
	
	
	// 답변 조회 (1개만)
	public AnswerVO getAnswerByQnaIdx(int qna_idx);
	// 답변 작성
	public int insertAnswer(AnswerVO vo);
	// 답변 수정
	public int updateAnswer(AnswerVO vo);
	// 답변 삭제
	public int deleteAnswer(int answer_idx);

	
	
	
	
	
}
