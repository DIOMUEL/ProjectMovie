package com.kh.projectMovie01.utill;

import java.awt.image.BufferedImage;
import java.io.File;
import java.util.Calendar;
import java.util.UUID;

import javax.annotation.Resource;
import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;

public class MyproFileUtil {
	@Resource
	private static String uploadPath;
	
	public static String uploadFile(
			String uploadPath,
			String originalFilename,
			byte[] fileData) throws Exception{
		String datePath = calcPath(uploadPath);
		UUID uuid = UUID.randomUUID();
		//D:/upload/2021/6/30/uuid_noname.png
		String filePath = datePath + "/" + uuid + "_" + originalFilename;
		System.out.println("filePath:"+filePath);
		File target = new File(filePath);
		FileCopyUtils.copy(fileData, target);
		boolean isImage = isImage(filePath);
		if(isImage) {
			filePath = makeThumbnail(filePath);
		}
		return filePath;
	}
	
	public static String calcPath(String uploadPath) {
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH)+1;
		int date = cal.get(Calendar.DATE);
		
		String dateString = year+"/"+month+"/"+date;
		String datePath = uploadPath+"/"+dateString;
		//->d:/upload/2021/6/1
		System.out.println("datePath:"+datePath);
		File f = new File(datePath);
		if(!f.exists()) {
			f.mkdirs();
		}
		return datePath;
	}

	private static String getExtName(String fileName) {
		int dotIndex = fileName.lastIndexOf(".");
		String ext = fileName.substring(dotIndex+1);
		return ext.toUpperCase();
	}
	
	private static boolean isImage(String fileName) {
		String ext = getExtName(fileName);
		if(ext.equals("JPG")||ext.equals("GIF")||ext.equals("PNG")) {
			return true;
		}
		return false;
	}
	
	public static String makeThumbnail(String filePath) {
		//D:/upload/2021/6/30/uuid_noname.png
		//D:/upload/2021/6/30/sm_uuid_noname.png
		int slashIndex = filePath.lastIndexOf("/");
		String front =filePath.substring(0,slashIndex+1);
		String rear = filePath.substring(slashIndex+1);
		String thumbnailPath = front + "sm_" + rear;
		
		File orgFile = new File(filePath);
		File thumbFile = new File(thumbnailPath);
		
		try{
			//이미업로드된 원본 파일을 메모리에 로딩
			BufferedImage scrImage = ImageIO.read(orgFile);
			BufferedImage destImage = Scalr.resize(scrImage, //원본이미지
					Scalr.Method.AUTOMATIC, // 비율맞추기
					Scalr.Mode.FIT_TO_HEIGHT, //높이 맞추기
					100); //해당 높이
			ImageIO.write(destImage, getExtName(thumbnailPath), thumbFile);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return thumbnailPath;
	}
	private static void deleteWhile(File f) {
		if (f.exists()) {
			while (true) {
				boolean b = f.delete();
				if (b == true) {
					break;
				}
				try {
					Thread.sleep(2000);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			}
		}
	}
	public static void deleteFile(String fileName) {
		File f = new File(fileName);
		deleteWhile(f);
		if(isImage(fileName)) {
			String[] names = fileName.split("sm_");
			String orgFile = names[0] + names[1];
			File f2 = new File(orgFile);
			deleteWhile(f2);
		}
	}
	
}
