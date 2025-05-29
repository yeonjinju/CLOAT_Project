package com.smhrd.qna;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QnaService {

    @Autowired
    private QnaMapper qnaMapper;

    public void increaseViews(int qnaNo) { // 조회수 증가
        qnaMapper.updateQnaViews(qnaNo);
    }

    public QnaVO getQnaDetail(int qnaIdx) { // Qna 상세 게시글 조회
        return qnaMapper.getQna(qnaIdx);
    }

    public QnaVO getQnaDetail(String reNum) { // Qna 상세 게시글 조회 (문자열 받아서 int 변환)
        int qnaIdx = Integer.parseInt(reNum);
        return getQnaDetail(qnaIdx);
    }

    // Answer 조회
    public QnaVO getAnswer(int qnaIdx) {
        return qnaMapper.getAnswerByQnaIdx(qnaIdx);
    }
    
    // Answer 작성
    public int writeQnaAnswer(QnaVO vo) {
        return qnaMapper.insertAnswer(vo);
    }
    // Answer 수정
    public int updateQnaAnswer(QnaVO vo) {
        return qnaMapper.updateQnaAnswer(vo);
    }
    // Answer 삭제
    public int deleteQnaAnswer(QnaVO vo) {
        return qnaMapper.deleteQnaAnswer(vo);
    }
    
 // 글 수정 삭제
    public int updateQnaEdit(QnaVO vo) {
        return qnaMapper.updateQnaEdit(vo);
    }
    public int deleteQna(int qna_idx) {
        // 1. 먼저 해당 Qna 글에 연결된 답변 삭제
        qnaMapper.deleteQnaAnswerByQnaIdx(qna_idx);
        
        // 2. 그런 다음 Qna 글 삭제
        return qnaMapper.deleteQnaByNo(qna_idx);
    }
    

}