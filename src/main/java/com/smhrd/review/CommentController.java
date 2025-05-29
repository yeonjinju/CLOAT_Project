package com.smhrd.review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CommentController {

    @Autowired
    private CommentService commentService;
    
    @RequestMapping(value = "/commentLike", method = RequestMethod.POST)
    public String like(CommentHeartVO vo) {
        System.out.println("좋아요 요청 들어옴! vo = " + vo); 

        boolean success = commentService.likeComment(vo);
        System.out.println("좋아요 처리 결과: " + success); 

        // 좋아요 처리 후 원하는 페이지로 리다이렉트
        return "redirect:/reviewview?no=" + vo.getReview_idx();
    }
}
