package com.kh.projectMovie01;

import java.io.FileInputStream;
import java.util.Locale;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.projectMovie01.utill.MyproFileUtil;

@Controller
public class HomeController {
	
	@RequestMapping(value="/uploadAjax", method=RequestMethod.POST,
			produces="application/text;charset=utf-8")
	@ResponseBody
	public String uploadAjax(MultipartFile file) throws Exception {
		System.out.println("file:" + file);
		String originalFilename = file.getOriginalFilename();
		System.out.println("orinalFilename:" + originalFilename);
		String filePath = MyproFileUtil.uploadFile("//192.168.0.86/uploadFolder", originalFilename, file.getBytes());
		return filePath;
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String startPage(Locale locale, Model model) {
		return "/board/startPage";
	}
	
	@RequestMapping(value="/displayImage", method=RequestMethod.GET)
	@ResponseBody
	public byte[] displayImage(String fileName) throws Exception {
		FileInputStream fis = new FileInputStream(fileName);
		byte[] bytes = IOUtils.toByteArray(fis);
		fis.close();
		return bytes;
	}
}
