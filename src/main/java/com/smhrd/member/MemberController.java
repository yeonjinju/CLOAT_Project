package com.smhrd.member;

import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.smhrd.notice.NoticeVO;
import com.smhrd.review.ReviewVO;
import com.smhrd.upload.UploadVO;

@Controller
public class MemberController {

    @Autowired
    MemberMapper mapper;

    @Autowired
    ServletContext context;

    @RequestMapping("/")
    public String main(Model model) {
    	
    	List<NoticeVO> new_notice = mapper.newNotice();
    	List<ReviewVO> new_review = mapper.newReview();
    	
    	model.addAttribute("new_notice", new_notice);
    	model.addAttribute("new_review", new_review);
    	
        return "Main"; // 메인 페이지 뷰 이름
    }

    @RequestMapping("/about")
    public String about() {
        return "About"; // 소개 페이지 이동
    }    

    @RequestMapping("/login")
    public String login() {
        return "member/Login"; // 로그인 페이지 뷰 이름
    }

    @PostMapping("/login_do")
    public String login(MemberVO vo, HttpSession session, HttpServletResponse response, @RequestParam(value= "id_save", required = false) String id_save) {
        MemberVO mvo = mapper.login(vo);
        if (mvo != null) {
            // 로그인 성공 - 세션에 사용자 정보 저장
            session.setAttribute("mvo", mvo);
            
            if("id_save".equals(id_save)) {
            	Cookie ck = new Cookie("id", vo.getId());
            	response.addCookie(ck);
            }
            return "redirect:/"; // 마이페이지로 이동
        } else {
            // 로그인 실패 - 로그인 페이지로 되돌아가기
        	System.out.println("dsfrjtdsfhfsh");
            return "redirect:/login";
        }
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "Main"; // 로그아웃 후 메인페이지로
    }

    @RequestMapping("/join")
    public String join() {
        return "member/Join"; // 회원가입 페이지 뷰
    }

    @ResponseBody
    @RequestMapping("/IdCheck")
    public Map<String, Boolean> IdCheck(@RequestParam String id) {
        System.out.println(id);
        int cnt = mapper.IdCheck(id);
        boolean available = cnt == 0;
        Map<String, Boolean> response = new HashMap<>();
        response.put("available", available);
        return response;
    }

    @RequestMapping("/join_us")
    public String join_us(@RequestParam(value= "file", required = false) MultipartFile file, MemberVO vo, Model model) {
        String loc = context.getRealPath("/resources/file/");
        FileOutputStream fos;
        String fileDemo = "null";

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

        vo.setProfile_img(fileDemo);
        mapper.join(vo);
        model.addAttribute("id", vo.getId());
        return "member/Join_success";
    }

    @GetMapping("/join_success")
    public String join_success() {
        return "member/Join_success";
    }
    
    // 아이디/ 비밀번호 찾기 관련
    @RequestMapping("/find")
    public String find() {
        return "member/Find"; // 아이디/비밀번호 찾기
    }    

    @ResponseBody
    @PostMapping("/findPw")
    public String findPw(MemberVO vo) {
    	return mapper.findPw(vo);
    }
    
    @ResponseBody
    @PostMapping("/findId1")
    public String findId1(MemberVO vo) {	
    	return mapper.findId1(vo);	
    }
    
    @ResponseBody
    @PostMapping("/findId2")
    public String findId2(MemberVO vo) {	
    	return mapper.findId2(vo);
    }   

    // ** 마이페이지 컨트롤러 추가 **
    @RequestMapping("/mypage")
    public String My_edit(HttpSession session, Model model) {
        MemberVO mvo = (MemberVO) session.getAttribute("mvo");
        if (mvo == null) {
            return "redirect:/login"; // 로그인 안 되어 있으면 로그인 페이지로 이동
        }
        return "redirect:/MyGallery"; // 마이페이지 뷰 이름
    }
    
    //정보수정 전 본인확인 페이지(비밀번호 체크 한 번 더)
    @GetMapping("/MyLogin")
    public String MyLogin(HttpSession session, Model model) {
        MemberVO mvo = (MemberVO) session.getAttribute("mvo");
        if (mvo == null) {
            return "redirect:/login"; // 로그인 안 되어 있으면 로그인 페이지로 이동
        }
        model.addAttribute("member", mvo);
        return "mypage/MyLogin";  	
    }    
    
	@PostMapping("/login_to")
	public String login_to(MemberVO vo, HttpSession session, Model model) {
        MemberVO mvo = (MemberVO) session.getAttribute("mvo");
        if (mvo == null) {
            return "redirect:/login"; // 로그인 안 되어 있으면 로그인 페이지로 이동
        }else {
    		MemberVO mvo2 = mapper.login(vo);		
    		if (mvo2 != null) {
    			return "mypage/MyEdit"; // 내 정보수정 페이지로 이동
    		} else {
    			// 로그인 실패 - 로그인 페이지로 되돌아가기
    			return "mypage/MyLogin";
    		}        	
        } 
	}    
    
    @GetMapping("/MyEdit")
    public String MyEdit(MemberVO vo, HttpSession session, Model model) {	
        MemberVO mvo = (MemberVO) session.getAttribute("mvo");
        if (mvo == null) {
            return "redirect:/login"; // 로그인 안 되어 있으면 로그인 페이지로 이동
        }
        model.addAttribute("member", mvo);
        return "mypage/MyEdit";
    }
   
	@PostMapping("/Update")
	public String update(@RequestParam(value= "file", required = false)MultipartFile file, MemberVO vo, Model model, 
			RedirectAttributes redirectAttr, HttpSession session) {
		
		System.out.println(vo);
		String loc = context.getRealPath("/resources/file/");
		FileOutputStream fos;
		
		
		String fileDemo = null;
		if (file != null && !file.isEmpty()) {
			fileDemo = file.getOriginalFilename();
			if(fileDemo.length() > 0) {
				try {
					String baseName = fileDemo.substring(0, fileDemo.lastIndexOf(".")); //4
					String extension = fileDemo.substring(fileDemo.lastIndexOf("."));   //.jpg
					fileDemo = baseName + '_' + UUID.randomUUID().toString() + extension;
					File targetFile = new File(loc, fileDemo);
					fos = new FileOutputStream(targetFile); // 파일저장경로 + 파일저장명
					fos.write(file.getBytes());  // 우리가 진짜 가져온 파일로 쓰기
					fos.close();  // 이건 안써줘도 되는 코드지만 용량 절약을 습관화
					vo.setProfile_img(fileDemo);
				} catch (Exception e) {
		            e.printStackTrace();
		            redirectAttr.addFlashAttribute("msg", "파일 업로드 중 오류가 발생했습니다.");
		            return "redirect:/MyEdit";					
				}
			}
		}
	
		int result = mapper.update(vo);
		session.setAttribute("mvo", vo);	
	    if (result > 0) {
	        redirectAttr.addFlashAttribute("msg", "정보수정이 완료되었습니다.");
	    } else {
	        redirectAttr.addFlashAttribute("msg", "정보수정에 실패했습니다. 다시 시도해주세요.");	        
	    }
	    return "redirect:/MyEdit";
		
	}
	
    @GetMapping("/MyGallery")
    public String MyGallery(MemberVO vo, HttpSession session, Model model) {
        MemberVO mvo = (MemberVO) session.getAttribute("mvo");
        if (mvo == null) {
            return "redirect:/login"; // 로그인 안 되어 있으면 로그인 페이지로 이동
        }
        model.addAttribute("member", mvo);
        List<UploadVO> list = mapper.getTransformed_file(mvo.getId());
        
        if (list == null) { list = new ArrayList<>(); }
		
        model.addAttribute("imglist", list);
        
        return "mypage/MyGallery";
    }
    
    // 회원탈퇴
	@RequestMapping("/delete")
	public String delete(String id, HttpSession session) {
		
		System.out.println(id);
		int cnt = mapper.delete(id);
		// * 결과 값 처리
		if(cnt>0) {
			//삭제 성공
			System.out.println("성공");
			session.invalidate();
		}else {
			//삭제 실패
			System.out.println("실패");
		}
		
		return "Main";
	}   
    
}