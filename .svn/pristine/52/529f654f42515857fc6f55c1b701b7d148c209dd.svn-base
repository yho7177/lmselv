package kr.happyjob.study.common.comnUtils;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.imgscalr.Scalr.Method;
import org.imgscalr.Scalr.Mode;

public class Thumbnail {
	
	/* 썸네일 만들기 */
	public static String makeThumbnail(String uploadPath, String savePath, String fileName) throws Exception {
		
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath, fileName));
		BufferedImage destImg = Scalr.resize(sourceImg, Method.AUTOMATIC, Mode.FIT_TO_HEIGHT, 100);
		// 썸네일의 크기 조절
		String thumbnailName = uploadPath + savePath + File.separator + "s_" + fileName;
		// 저장될 폴더명(현재날짜)과 파일이름에 _s를 추가함.
		
		File newFile = new File(thumbnailName);
		
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);
		
		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
	
	
	   /* 업로드 된 파일의 날짜를 구함 */
	   public static String calcPath(String uploadPath, String file_nm) {
	      System.out.println("uploadPath: " + uploadPath);
	      
	      // .앞까지 잘라내고, 다시 /까지 잘라내면 저장 경로가 나옴.
	      int exeFile = uploadPath.lastIndexOf('.');
	      String path = uploadPath.substring(0, exeFile);
	      
	      exeFile = uploadPath.lastIndexOf(File.separator);
	      path = path.substring(0, exeFile);
	      
	      System.out.println("path: " + path);

	      Calendar cal = Calendar.getInstance();
	      
	      String yearPath = File.separator+cal.get(Calendar.YEAR);
	      String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
	      String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
	      
	      // X:/FileRepository/notice/2021/11/29식으로 해당 날짜의 폴더를 생성.
	      makeDir(path, yearPath, monthPath, datePath);
	      
	      return datePath;
	   }
	
	/* 날짜 기반으로 경로를 만들어줌 */
	public static void makeDir(String uploadPath, String...paths) {
		
		if(new File(paths[paths.length-1]).exists())
			return;
		
		for(String path : paths) {
			File dirPath = new File(uploadPath + path);
			// 루프를 돌면서 2016/12/29...현재 날짜의 폴더를 생성함.
			
			if(!dirPath.exists()) 
				dirPath.mkdir();
		}
	}

}
