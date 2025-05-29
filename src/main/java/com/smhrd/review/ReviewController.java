package com.smhrd.review;

import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


@Controller 
public class ReviewController {
   
   @Autowired
   ReviewMapper mapper;


    @Autowired
    private ReviewService reviewService;
    
    @Autowired
    ServletContext context;

    // 리뷰 상세보기 + 조회수 증가
    @RequestMapping("/reviewview")
    public String reviewView(@RequestParam("no") int reviewIdx,
                             @RequestParam(value="pageNum", defaultValue="1") int pageNum, Model model) {
       reviewService.increaseViews(reviewIdx);
        ReviewVO review = mapper.getReview(reviewIdx);
        ReviewVO answer = reviewService.getAnswer(reviewIdx);
        
        model.addAttribute("review", review);
        
        
        model.addAttribute("answer", answer);
        model.addAttribute("pageNum", pageNum);  // 페이지 번호 같이 넘김
        return "review/ReviewView";
    }
    
    
    
    

   // Answer 작성
   @RequestMapping(value = "/writeReviewAnswer", method = RequestMethod.POST)
   public String writeReviewAnswer(ReviewVO vo, HttpSession session, @RequestParam String id) {

      System.out.println("loginId : " + id);
      System.out.println("Review_idx : " + vo.getReview_idx());

      vo.setId(id);
      System.out.println(vo);
      int result = reviewService.writeReviewAnswer(vo);

      if (result > 0) {
         System.out.println("댓글 작성 성공");
      } else {
         System.out.println("댓글 작성 실패");
      }

      return "redirect:/reviewview?no=" + vo.getReview_idx();
   }

   // Answer 수정
   @RequestMapping("/updateReviewAnswer")
   public String updateReviewAnswer(ReviewVO vo, HttpSession session, @RequestParam String id) {

      System.out.println("loginId : " + id);
      System.out.println("Review_idx : " + vo.getReview_idx());

      vo.setId(id);
      System.out.println(vo);

      int result = reviewService.updateReviewAnswer(vo);

      if (result > 0) {
         System.out.println("댓글 수정 성공");
      } else {
         System.out.println("댓글 수정 실패");
      }
      return "redirect:/reviewview?no=" + vo.getReview_idx();
   }

   // Answer 삭제
   @RequestMapping("/deleteReviewAnswer")
   public String deleteReviewAnswer(ReviewVO vo, HttpSession session, @RequestParam String id) {
      
      System.out.println("loginId : " + id);
      System.out.println("Review_idx : " + vo.getReview_idx());

      vo.setId(id);
      System.out.println(vo);
      
      int result = reviewService.deleteReviewAnswer(vo);

      if (result > 0) {
         System.out.println("댓글 삭제 성공");
      } else {
         System.out.println("댓글 삭제 실패");
      }

      return "redirect:/reviewview?no=" + vo.getReview_idx();
   }
   
   @RequestMapping("/reviewcommentlist")
   public String reviewcommentlist() {
      return null;
   }

   
   


    // 리뷰 목록 + 페이징 처리
    @RequestMapping("/ReviewList")
    public String reviewList(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, Model model) {
        int pageSize = 10;
        int startRow = (pageNum - 1) * pageSize + 1;
        int endRow = pageNum * pageSize;

        int totalCount = mapper.getTotalCount();
        int totalPageCount = (totalCount + pageSize - 1) / pageSize;

        List<ReviewVO> list = mapper.getReviewsByPage(startRow, endRow);
        if (list == null) list = new ArrayList<>();

        int pageBlock = 10;
        int startPageNum = ((pageNum - 1) / pageBlock) * pageBlock + 1;
        int endPageNum = Math.min(startPageNum + pageBlock - 1, totalPageCount);

        model.addAttribute("list", list);
        model.addAttribute("pageNum", pageNum);
        model.addAttribute("totalPageCount", totalPageCount);
        model.addAttribute("startPageNum", startPageNum);
        model.addAttribute("endPageNum", endPageNum);

        return "review/Review";
    }

    // 게시글 상세보기 (예: 리뷰 형식, 쿼리 파라미터로 reNum 받음)
    @RequestMapping("/reviewdetailreview")
    public ModelAndView detail(@RequestParam("reNum") String reNum) throws Exception {
        return new ModelAndView("detail", "detail1", reviewService.getReviewDetail(reNum));
    }
    
    // 검색기능
 	@RequestMapping("/ReviewSearch")
 	public String NewsSearch(@RequestParam String searchValue, @RequestParam String searchContent ,
 							  @RequestParam(value = "pageNum", defaultValue = "1") int pageNum, Model model) {
 		
 		int pageSize = 10;
        int startRow = (pageNum - 1) * pageSize + 1;
        int endRow = pageNum * pageSize;
 		
        int totalCount = mapper.getTotalCountBySearch(searchValue, searchContent);
        int totalPageCount = (totalCount + pageSize - 1) / pageSize;
        
 		List<ReviewVO> list = mapper.ReviewSearch(searchValue, searchContent, startRow, endRow);
 		if (list == null) list = new ArrayList<>();
 		
 		int pageBlock = 10;
        int startPageNum = ((pageNum - 1) / pageBlock) * pageBlock + 1;
        int endPageNum = Math.min(startPageNum + pageBlock - 1, totalPageCount);
 		
 		System.out.println(searchValue + " " + searchContent);
 		
 		model.addAttribute("list", list);
        model.addAttribute("pageNum", pageNum);
        model.addAttribute("totalPageCount", totalPageCount);
        model.addAttribute("startPageNum", startPageNum);
        model.addAttribute("endPageNum", endPageNum);
        model.addAttribute("searchValue", searchValue);
        model.addAttribute("searchContent", searchContent);
 		return "review/Review";
 	}

   @RequestMapping("/ReviewWrite")
   public String ReviewWrite(Model model) {
      return "review/ReviewWrite";
   }
   // 글쓰기 기능
   @RequestMapping("/ReviewUpload")
   public String ReviewUpload(ReviewVO vo, @RequestParam(value= "file", required = false)MultipartFile file) {
      String loc = context.getRealPath("/resources/file/");
      FileOutputStream fos;
      String fileDemo = null;
      if (file != null && !file.isEmpty()) {
         fileDemo = file.getOriginalFilename();
         if(fileDemo.length() > 0) {
            try {
               String baseName = fileDemo.substring(0, fileDemo.lastIndexOf("."));
               String extension = fileDemo.substring(fileDemo.lastIndexOf("."));
               fileDemo = baseName + '_' + UUID.randomUUID().toString() + extension;
               File targetFile = new File(loc, fileDemo);
               fos = new FileOutputStream(targetFile);
               fos.write(file.getBytes());
               fos.close();
            } catch (Exception e) {
               e.printStackTrace();
            }
         }
      }
      
      vo.setReview_file(fileDemo);
      vo.setReview_views(0);
      
      int result = mapper.write(vo);
      
      if(result>0) {
         System.out.println("성공");
      }else {
         System.out.println("실패");
      }
      return "redirect:/ReviewList";
   }
   
   // 마이페이지 - 내가 쓴 리뷰보기
   @RequestMapping("/MyReview")
   public String MyReview(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum, 
   					@RequestParam(value ="id") String id,
   					Model model) {
       int pageSize = 10;
       int startRow = (pageNum - 1) * pageSize + 1;
       int endRow = pageNum * pageSize;

       int totalCount = mapper.getTotalCount();
       int totalPageCount = (totalCount + pageSize - 1) / pageSize;
       List<ReviewVO> list = mapper.MyReview(startRow, endRow, id);
       if (list == null) list = new ArrayList<>();
       
       int pageBlock = 10;
       int startPageNum = ((pageNum - 1) / pageBlock) * pageBlock + 1;
       int endPageNum = Math.min(startPageNum + pageBlock - 1, totalPageCount);

       model.addAttribute("list", list);
       model.addAttribute("pageNum", pageNum);
       model.addAttribute("totalPageCount", totalPageCount);
       model.addAttribute("startPageNum", startPageNum);
       model.addAttribute("endPageNum", endPageNum);

       return "mypage/MyReview";
   }
   
// 게시글 수정 폼 보여주기
	@RequestMapping(value = "/ReviewEdit", method = RequestMethod.GET)
	 public String editForm(@RequestParam("no") int review_idx, HttpSession session, Model model) {
	      System.out.println("editForm() 호출됨 - 수정 폼 요청, review_idx: " + review_idx);

	      ReviewVO review = mapper.selectReviewByNo(review_idx);
	      if (review != null) {
	         System.out.println("ReviewVO 조회 성공: " + review.getReview_title());

	         // review_file이 "null" 문자열로 저장되어 있으면 실제 null로 처리
	         if ("null".equals(review.getReview_file())) {
	            review.setReview_file(null);
	         }
	      } else {
	         System.out.println("ReviewVO 조회 실패 - 해당 글 없음");
	      }

	      model.addAttribute("review", review);
	      System.out.println("모델에 reviewVO 속성 추가 완료");

	      return "review/ReviewWrite";
	   }
	
	// 게시글 수정 처리 새 파일이 존재하면 기존 파일 교체
	@RequestMapping(value = "/updateReviewEdit", method = RequestMethod.POST)
	public String updateReviewEdit(ReviewVO vo, HttpSession session,
	         @RequestParam(value = "file", required = false) MultipartFile file,
	         @RequestParam(value = "review_file", required = false) String oldFile) {

	      // 파일 저장 위치(서버 내 경로)
	      String loc = context.getRealPath("/resources/file/");
	      String fileDemo = oldFile; // 최종 파일명, 기본은 기존 파일명 유지

	      // 새 파일이 존재하면
	      if (file != null && !file.isEmpty()) {
	         fileDemo = file.getOriginalFilename();
	         try {
	            // UUID 붙여서 파일명 변경 (중복 방지)
	            String baseName = fileDemo.substring(0, fileDemo.lastIndexOf("."));
	            String extension = fileDemo.substring(fileDemo.lastIndexOf("."));
	            fileDemo = baseName + "_" + UUID.randomUUID().toString() + extension;

	            // 서버에 파일 저장
	            File targetFile = new File(loc, fileDemo);
	            FileOutputStream fos = new FileOutputStream(targetFile);
	            fos.write(file.getBytes());
	            fos.close();

	            // 기존 파일 삭제 처리
	            File old = new File(loc, oldFile);
	            if (old.exists()) {
	               if (old.delete()) {
	                  System.out.println("기존 파일 삭제 완료: " + old.getAbsolutePath());
	               } else {
	                  System.out.println("기존 파일 삭제 실패: " + old.getAbsolutePath());
	               }
	            } else {
	               System.out.println("기존 파일이 존재하지 않음: " + old.getAbsolutePath());
	            }

	         } catch (Exception e) {
	            e.printStackTrace();
	            System.out.println("파일 처리 중 예외 발생: " + e.getMessage());
	         }
	      } else {
	         System.out.println("새 파일 없음, 기존 파일 유지");
	      }

	      // VO에 최종 파일명 세팅
	      vo.setReview_file(fileDemo);

	      // 서비스 계층에 수정 요청
	      int result = reviewService.updateReviewEdit(vo);
	      if (result > 0) {
	         System.out.println("수정 성공");
	      } else {
	         System.out.println("수정 실패");
	      }

	      // 수정 완료 후 상세 보기 페이지로 리다이렉트
	      String redirectUrl = "redirect:/reviewview?no=" + vo.getReview_idx();
	      System.out.println("최종 리다이렉트 URL: " + redirectUrl);

	      return redirectUrl;
	 }
	
	// 게시글 삭제
	@RequestMapping(value = "/ReviewDelete", method = RequestMethod.GET)
	public String deleteReview(@RequestParam("no") int review_idx) {
	      int result = reviewService.deleteReview(review_idx);
	      if (result > 0) {
	         System.out.println("삭제 성공: " + review_idx);
	      } else {
	         System.out.println("삭제 실패: " + review_idx);
	      }
	      return "redirect:/ReviewList";
	}
   
}
    
   