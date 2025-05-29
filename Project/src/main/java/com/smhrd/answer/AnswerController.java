package com.smhrd.answer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.smhrd.qna.QnaMapper;
import com.smhrd.qna.QnaService;
import com.smhrd.qna.QnaVO;

@Controller
public class AnswerController {

    @Autowired
    private QnaService qnaService;

    @Autowired
    private QnaMapper qnaMapper; 

    @Autowired
    private AnswerService answerService;

    @RequestMapping("/comment")
    public String qnaView(@RequestParam("no") int qnaIdx,
                          @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                          Model model) {
        qnaService.increaseViews(qnaIdx); // 조회수 증가
        QnaVO qna = qnaMapper.getQna(qnaIdx); // Qna 가져오기
        AnswerVO answer = answerService.getAnswer(qnaIdx); // 답변 가져오기

        model.addAttribute("qna", qna);
        model.addAttribute("answer", answer);
        model.addAttribute("pageNum", pageNum);
        return "qna/QnaView";
    }

    @RequestMapping("/writeAnswer")
    public String writeAnswer(AnswerVO vo) {
        answerService.writeAnswer(vo);
        return "redirect:/qnaview?no=" + vo.getQna_idx();
    }

    @RequestMapping("/updateAnswer")
    public String updateAnswer(AnswerVO vo) {
        answerService.updateAnswer(vo);
        return "redirect:/qnaview?no=" + vo.getQna_idx();
    }

    @RequestMapping("/deleteAnswer")
    public String deleteAnswer(@RequestParam("qna_idx") int qnaIdx,
                               @RequestParam("answer_idx") int answerIdx) {
        answerService.deleteAnswer(answerIdx);
        return "redirect:/qnaview?no=" + qnaIdx;
    }
}
