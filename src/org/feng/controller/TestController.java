/**
 * 
 */
package org.feng.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

/**
 * @author 姜峰
 *
 */
@Controller
public class TestController {
	
	@RequestMapping("fengtest.do")
	public String fengtest() {
		return "fengtest";
	}

	@RequestMapping("fengupload.do")
	public String upload(MultipartFile modifyPhoto) {
		
		// 1.jpg
		//System.out.println("===========OriginalFilename : " + modifyPhoto.getOriginalFilename());
		String originalFilename = modifyPhoto.getOriginalFilename();
		// 给一个uuid的文件名
		StringBuilder sb = new StringBuilder(UUID.randomUUID().toString().replace("-", ""));
		sb.setLength(10);
		String newFilename = "";
		if (originalFilename != "") {
			newFilename = sb.toString() + originalFilename.substring(originalFilename.lastIndexOf("."));
		
			System.out.println("===========newFilename : " + newFilename);
			
			String path = "C:\\Users\\24670\\Pictures\\photosOfUsers" + File.separator + newFilename;
			File file = new File(path);
			System.out.println("=========== path : " + path);
			try {
				modifyPhoto.transferTo(file);
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				
		} else {
			// 请选择文件名
			System.out.println("请选择文件名");
		}
		
		return "fengtest";
	}
	
}
