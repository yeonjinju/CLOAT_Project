package com.smhrd.upload;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UploadController {

	//업로드용
	@Autowired
	ServletContext context;
	
	@Autowired
	UploadMapper mapper;
	
	@RequestMapping("/service")
	public String service() {
		return "Service";
	}
	
	@ResponseBody
	@RequestMapping("/upload")
	public String upload(@RequestParam(value= "file", required = false)MultipartFile file) {
		String loc = context.getRealPath("/resources/upload/");
	    System.out.println("저장 경로: " + loc);
		FileOutputStream fos;
		String fileDemo = file.getOriginalFilename();
		System.out.println(loc);
		if(fileDemo.length() > 0) {
			try {
				File targetFile = new File(loc, fileDemo);
				fos = new FileOutputStream(targetFile);
				fos.write(file.getBytes());
				fos.close();
				System.out.println("파일 저장 경로: " + targetFile.getAbsolutePath());     
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return fileDemo;
		
	}
	
	@ResponseBody
	@RequestMapping("/change")
	public String service_do(@RequestParam(value= "file", required = false)MultipartFile file, 
										UploadVO vo, Model model) throws IOException, InterruptedException {
		
		String loc = context.getRealPath("/resources/input/");
		String outputFilePath = context.getRealPath("/resources/output/");
		
		if(vo.getId() == null) {
			vo.setId("guest");
		}
		
	    System.out.println("저장 경로: " + loc);
		FileOutputStream fos;
		String fileDemo = null;
		String outputFileDemo = null;
		if (file != null && !file.isEmpty()) {
			fileDemo = file.getOriginalFilename();
			if(fileDemo.length() > 0) {
				try {
					String baseName = fileDemo.substring(0, fileDemo.lastIndexOf("."));
					String extension = fileDemo.substring(fileDemo.lastIndexOf("."));
					fileDemo = baseName + '_' + UUID.randomUUID().toString() + extension;
					outputFileDemo = baseName + '_' + UUID.randomUUID().toString() + "_cloaked.png";
					outputFilePath += outputFileDemo;
					File targetFile = new File(loc, fileDemo);
					fos = new FileOutputStream(targetFile);
					fos.write(file.getBytes());
					fos.close();
					System.out.println("파일 저장 경로: " + targetFile.getAbsolutePath()); 
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		String inputFilePath = loc + fileDemo; 
		
		ProcessBuilder pb = new ProcessBuilder(
					"C:\\Users\\smhrd\\fawkes-env\\Scripts\\python.exe",
					"C:\\Users\\smhrd\\fawkes-env\\test.py",
					inputFilePath,
					outputFilePath
		);
		pb.redirectErrorStream(true);
        Process process = pb.start();
        
        // [1] 파이썬 출력 읽기
        BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
        String line;
        System.out.println("=== Python 출력 시작 ===");
        while ((line = reader.readLine()) != null) {
            System.out.println("파이썬 출력: " + line);
        }
        System.out.println("=== Python 출력 끝 ===");
        
        int exitCode = process.waitFor();
        if (exitCode != 0) {
        	System.out.println("에러");
        }
        
        vo.setUpload_file("/resources/input/" + fileDemo);
        
        vo.setTransformed_file("/resources/output/" + outputFileDemo);
        
        System.out.println(vo);
        
        mapper.insert(vo);
        model.addAttribute("uvo", vo);
        
        
        return vo.getTransformed_file();
	}
	
}