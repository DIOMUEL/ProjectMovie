package com.kh.projectMovie01.utill;

import java.io.File;
import java.io.FileInputStream;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;


@RestController
@RequestMapping("/foodUpload")
public class FoodFileUploadController {
	
	@Resource
	private String UploadPath;// servlet-context.xml (id="UploadPath");

	@RequestMapping(value = "/uploadAjax", method = RequestMethod.POST, produces = {"text/plain;charset=UTF-8"})
	public String fileUpload(MultipartFile file) throws Exception {
		String uploadPath = UploadPath + "/foodUpload";
		String oFileName = file.getOriginalFilename();
		String dirPath = FoodFileUploadUtil.uploadFile(uploadPath, oFileName, file.getBytes());
		return dirPath.replace("\\","/");
	}

	@RequestMapping(value = "/displayFile", method = RequestMethod.GET)
	public byte[] displayFile(@RequestParam("fileName") String fileName) throws Exception {
		
		String uploadPath = UploadPath + "/foodUpload";
		String filePath = uploadPath + File.separator + fileName;
		String rFilePath = filePath.replace("/", "\\");
		FileInputStream fis = new FileInputStream(rFilePath);
		byte[] bytes = IOUtils.toByteArray(fis);
		fis.close();
		return bytes;
	}

	@RequestMapping(value="/deleteFile", method = RequestMethod.GET)
	public String deleteFile(String fileName) throws Exception {
		String uploadPath = UploadPath + "/foodUpload";
		String filePath = uploadPath + File.separator + fileName;
		
		String file2Front = fileName.substring(0, fileName.lastIndexOf("/") + 1);
		String file2Rear = fileName.substring(fileName.lastIndexOf("/") + 1);
		String smFilePath = uploadPath + File.separator + file2Front + "sm_" + file2Rear;
		
		File file = new File(filePath);
		file.delete();
		
		boolean result = FoodFileUploadUtil.isImage(fileName);
		if (result == true) {
			File file2 = new File(smFilePath);
			file2.delete();
		}
		return "success";
	}
}
