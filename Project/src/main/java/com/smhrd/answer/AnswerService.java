package com.smhrd.answer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AnswerService {
	
	@Autowired
	private AnswerMapper mapper;

	public AnswerVO getAnswer(int qnaIdx) {
	    return mapper.getAnswerByQnaIdx(qnaIdx);
	}

	public int writeAnswer(AnswerVO vo) {
	    return mapper.insertAnswer(vo);
	}

	public int updateAnswer(AnswerVO vo) {
	    return mapper.updateAnswer(vo);
	}

	public int deleteAnswer(int answerIdx) {
	    return mapper.deleteAnswer(answerIdx);
	}

}
