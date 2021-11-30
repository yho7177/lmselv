package kr.happyjob.study.lsp.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.happyjob.study.common.comnUtils.FileUtilCho;
import kr.happyjob.study.lmg.model.HomeworkSubModel;
import kr.happyjob.study.lsp.dao.lectureNewDao;
import kr.happyjob.study.lsp.model.lectureNewModel;

@Service
public class lectureNewServiceImpl implements lectureNewService {

	/*@Value("${fileUpload.rootPath}")
	private String rootPath;

	@Value("${fileUpload.lecture}")
	private String lecture;*/

	@Autowired
	lectureNewDao lectureDao;

	/** 공지사항 리스트 조회 */
	@Override
	public List<lectureNewModel> lectureList(Map<String, Object> paramMap) throws Exception {

		List<lectureNewModel> lectureList = lectureDao.lectureList(paramMap);

		return lectureList;
	}

	/** 공지사항 목록 카운트 조회 */
	@Override
	public int lectureCnt(Map<String, Object> paramMap) throws Exception {

		int lectureCnt = lectureDao.lectureCnt(paramMap);
		return lectureCnt;

	}

	/** 공지사항 단건 조회 */
	@Override
	public lectureNewModel lectureDetail(Map<String, Object> paramMap) throws Exception {

		lectureNewModel lectureModel = lectureDao.lectureDetail(paramMap);
		return lectureModel;
	}

/*	*//** 공지사항 저장 *//*
	@Override
	public int insertlecture(Map<String, Object> paramMap, HttpServletRequest request) throws Exception {
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		// 기존 정보들 삭제하고 새롭게 저장

		// 파일 저장
		String itemFilePath = lecture + File.separator;
		FileUtilCho fileUtil = new FileUtilCho(multipartHttpServletRequest, rootPath, itemFilePath);
		Map<String, Object> fileInfo = fileUtil.uploadFiles(); // 실제 럽로드 처리

		String file_addr = "/filepath/FileRepository/" + itemFilePath + "/" + fileInfo.get("file_nm");
		fileInfo.put("file_addr", file_addr);

		paramMap.put("fileInfo", fileInfo);

		 과제 제출 파일 저장 
		lectureDao.insertNofile(paramMap);

		 파일 조회 
		// int fileno = lectureDao.selectnewfileno(paramMap);

		// paramMap.put("file_no", fileno);

		int statusChange = lectureDao.insertlecture(paramMap);
		return statusChange;
	}*/

/*	*//** 공지사항 수정 *//*
	@Override
	public int updatelecture(Map<String, Object> paramMap, HttpServletRequest request) throws Exception {
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;

		String itemFilePath = lecture + File.separator;
		FileUtilCho fileUtil = new FileUtilCho(multipartHttpServletRequest, rootPath, itemFilePath);
		Map<String, Object> fileInfo = fileUtil.uploadFiles(); // 실제 럽로드 처리

		String file_addr = "/filepath/FileRepository/" + itemFilePath + "/" + fileInfo.get("file_nm");
		fileInfo.put("file_addr", file_addr);
		paramMap.put("fileInfo", fileInfo);

		// 공지사항 파일 저장 조회
		int oldfileno = lectureDao.selectfileno(paramMap);
		lectureNewModel lectureModel = lectureDao.lectureDetail(paramMap);

		System.out.println("fileInfo.size() : " + fileInfo.size() + " : " + fileInfo.get("file_nm"));

		if (fileInfo.get("file_nm") != null) {
			// 새로운파일 생성
			lectureDao.insertNofile(paramMap);
		} else {
			paramMap.put("file_no", null);
		}

		// 기존의 정보를 꺼내와서 수정
		int statusChange = lectureDao.updatelecture(paramMap);

		paramMap.put("oldfileno", oldfileno);
		// 기존의 정보를 꺼내와서 삭제
		lectureDao.deleteNofile(paramMap);
		// 수정시 저장소에 저장되어있던 파일까지 삭제
		if (oldfileno > 0) {
			String fullfilepath = lectureModel.getFile_root();

			File oldfile = new File(fullfilepath);
			oldfile.delete();
		}

		return statusChange;
	}*/

	/* 공지사항 파일 삭제 */
	public int deleteNofile(Map<String, Object> paramMap) throws Exception {

		/* 공지사항 파일 삭제 */
		int ret = lectureDao.deleteNofile(paramMap);

		return ret;
	}

/*	*//** 공지사항 삭제 *//*
	@Override
	public int deletelecture(Map<String, Object> paramMap, HttpServletRequest request) throws Exception {
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;*/
/*
		String itemFilePath = lecture + File.separator;
		FileUtilCho fileUtil = new FileUtilCho(multipartHttpServletRequest, rootPath, itemFilePath);
		Map<String, Object> fileInfo = fileUtil.uploadFiles(); // 실제 럽로드 처리

		String file_addr = "/filepath/FileRepository/" + itemFilePath + "/" + fileInfo.get("file_nm");
		fileInfo.put("file_addr", file_addr);
		paramMap.put("fileInfo", fileInfo);

		// 현재 파일 조회
		int fileno = lectureDao.selectfileno(paramMap);
		lectureNewModel lectureModel = lectureDao.lectureDetail(paramMap);

		System.out.println("fileInfo.size() : " + fileInfo.size() + " : " + fileInfo.get("file_nm"));

		// 기존의 정보를 꺼내와서 삭제
		int statusChange = lectureDao.deletelecture(paramMap);

		paramMap.put("file_no", fileno);

		lectureDao.deleteNofile2(paramMap);

		 디렉토리에서 기존의 파일을 삭제해줌 
		if (fileno > 0) {
			String fullfilepath = lectureModel.getFile_root();

			File file = new File(fullfilepath);
			file.delete();*/
		
	/*}
		return statusChange;

}*/

	/* 과제 제출 목록 단건 조회 */
	public lectureNewModel selectNofile(Map<String, Object> paramMap) throws Exception {

		return lectureDao.selectNofile(paramMap);
	}


@Override
public int insertlecture(Map<String, Object> paramMap) throws Exception {
	
	int ret = lectureDao.insertlecture(paramMap);
	
	return ret;
}

@Override
public int updatelecture(Map<String, Object> paramMap) throws Exception {
	
	int ret = lectureDao.updatelecture(paramMap); 
	
	return ret;
}

@Override
public int deletelecture(Map<String, Object> paramMap) throws Exception {
	
	int ret = lectureDao.deletelecture(paramMap);
	
	return ret;
}

}
