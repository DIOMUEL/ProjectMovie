package com.kh.projectMovie01.utill;

import java.awt.image.BufferedImage;
import java.io.File;
import java.util.Calendar;
import java.util.UUID;

import javax.annotation.Resource;
import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;

public class FoodFileUploadUtil {
	
	@Resource
	private static String uploadPath;
	
	// 음식사진등록
	public static String uploadFile(String FoodUploadPath, String originalName, byte[] fileData) throws Exception {
		UUID uuid = UUID.randomUUID();
		String datePath = calcPath(FoodUploadPath);
		String dirPath = datePath + File.separator + uuid + "-" + originalName;
		String filePath = FoodUploadPath + File.separator + dirPath;
		File target = new File(filePath);
		FileCopyUtils.copy(fileData, target);
		makeThumbnail(filePath);
		return dirPath;
	}
	
	// 섬네일 생성
	private static void makeThumbnail(String filePath) throws Exception {
		int lastSlashIndex = filePath.lastIndexOf("\\");
		String front = filePath.substring(0, lastSlashIndex + 1);
		String rear = filePath.substring(lastSlashIndex + 1);
		String thumbnailName = front + "sm_" + rear;
		
		BufferedImage srcImage = ImageIO.read(new File(filePath));
		
		BufferedImage destImage = Scalr.resize(srcImage, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 150);
		
		File thumbFile = new File(thumbnailName);
		ImageIO.write(destImage, getFormatName(thumbnailName), thumbFile);
	}
	
	// 
	private static String calcPath(String FoodUploadPath) {
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int date = cal.get(Calendar.DATE);
		String dateString = + year + File.separator + month + File.separator + date;
		
		String datePath = FoodUploadPath + File.separator + dateString;
		File f = new File(datePath);
		if (!f.exists()) {
			System.out.println("makedir");
			f.mkdirs();
		}
		return dateString;
	}
	
	private static String getFormatName(String thumbnailName) {
		int dotIndex = thumbnailName.lastIndexOf(".");
		String extName = thumbnailName.substring(dotIndex + 1);
		return extName.toUpperCase();
	}
	
	public static boolean isImage(String filename) throws Exception {
		// smile.jpg
		String extName = filename.substring(filename.lastIndexOf(".") + 1).toUpperCase(); // jpg -> JPG
		if (extName.equals("JPG") || extName.equals("GIF") || extName.equals("PNG")) {
			return true;
		}
		return false;
	}
	
	// 섬네일등록
	public static String uploadPreviewFile(String FoodUploadPath, String originalName, byte[] fileData) throws Exception {
		UUID uuid = UUID.randomUUID();
		String datePath = calcPath(FoodUploadPath);
		String dirPath = datePath + File.separator + uuid + "-" + originalName;
		String filePath = FoodUploadPath + File.separator + dirPath;
		File target = new File(filePath);
		FileCopyUtils.copy(fileData, target);
		return dirPath;
	}
	
	// 음식 이미지 삭제
	public static String deleteFile(String fileName) throws Exception {
		String FoodUploadPath = uploadPath + "/foodUpload";
		String filePath = FoodUploadPath + File.separator + fileName;
		
		String file2Front = fileName.substring(0, fileName.lastIndexOf("/") + 1);
		String file2Rear = fileName.substring(fileName.lastIndexOf("/") + 1);
		String smFilePath = FoodUploadPath + File.separator + file2Front + "sm_" + file2Rear;
		
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
