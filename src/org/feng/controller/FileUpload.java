/**
 * 
 */
package org.feng.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author ½ª·å
 *
 */
@Controller
public class FileUpload {

	@RequestMapping("up")
	public String upload() {
		return "fileUpload";
	}
	
	@RequestMapping("upload")
	public ModelAndView upload(MultipartFile file) {
		ModelAndView mv = new ModelAndView();
		System.out.println("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
		System.out.println("file name : " + file.getName());
		return mv;
	}
	
}
