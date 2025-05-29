package com.smhrd.qna;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;


@Mapper
public interface QnaMapper {

   public List<QnaVO> QnaList();
   
    QnaVO getQna(int qna_idx);
    
    int getTotalCount();
    
    int getTotalCountBySearch(@Param("searchValue") String searchValue,
            @Param("searchContent") String searchContent);    
    
    
    List<QnaVO> getQnasByPage(@Param("startRow") int startRow, @Param("endRow") int endRow);
    
    void updateQnaViews(@Param("qnaIdx") int qnaIdx);
    
    
    
    

    
    
   public int write(QnaVO vo); // 글쓰기 기능
   
   public List<QnaVO> QnaSearch(@Param("searchValue") String searchValue, @Param("searchContent") String searchContent,
			@Param("startRow") int startRow, @Param("endRow") int endRow); // 검색 기능
   
   public QnaVO getAnswerByQnaIdx(int qna_idx); // 답변 조회 (1개만)
   public int insertAnswer(QnaVO vo); // 답변 작성
   public int updateQnaAnswer(QnaVO vo); // 답변 수정
   public int deleteQnaAnswer(QnaVO vo); // 답변 삭제
   
   public int updateQnaEdit(QnaVO vo);   // 씀
   QnaVO selectQnaByNo(int qna_idx);  // 씀
   int deleteQnaByNo(int qna_idx);
   int deleteQnaAnswerByQnaIdx(int qna_idx);
   
   public List<QnaVO> MyQna(@Param("startRow") int startRow, @Param("endRow") int endRow, @Param("id") String id); // 마이페이지 - 내가 쓴 문의
}