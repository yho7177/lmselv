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
import kr.happyjob.study.lsp.dao.NoticeNewDao;
import kr.happyjob.study.lsp.model.NoticeNewModel;

@Service
public class NoticeNewServiceImpl implements NoticeNewService {

	@Value("${fileUpload.rootPath}")
	private String rootPath;

	@Value("${fileUpload.notice}")
	private String notice;

	@Autowired
	NoticeNewDao noticeDao;

	/** 공지사항 리스트 조회 */
	@Override
	public List<NoticeNewModel> noticeList(Map<String, Object> paramMap) throws Exception {

		List<NoticeNewModel> noticeList = noticeDao.noticeList(paramMap);

		return noticeList;
	}

	/** 공지사항 목록 카운트 조회 */
	@Override
	public int noticeCnt(Map<String, Object> paramMap) throws Exception {

		int noticeCnt = noticeDao.noticeCnt(paramMap);
		return noticeCnt;

	}

	/** 공지사항 단건 조회 */
	@Override
	public NoticeNewModel noticeDetail(Map<String, Object> paramMap) throws Exception {

		NoticeNewModel noticeModel = noticeDao.noticeDetail(paramMap);
		return noticeModel;
	}

	/** 공지사항 저장 */
	@Override
	public int insertNotice(Map<String, Object> paramMap, HttpServletRequest request) throws Exception {
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		// 기존 정보들 삭제하고 새롭게 저장

		// 파일 저장
		String itemFilePath = notice + File.separator;
		FileUtilCho fileUtil = new FileUtilCho(multipartHttpServletRequest, rootPath, itemFilePath);
		Map<String, Object> fileInfo = fileUtil.uploadFiles(); // 실제 럽로드 처리

		String file_addr = "/filepath/FileRepository/" + itemFilePath + "/" + fileInfo.get("file_nm");
		fileInfo.put("file_addr", file_addr);

		paramMap.put("fileInfo", fileInfo);

		/* 과제 제출 파일 저장 */
		noticeDao.insertNofile(paramMap);

		/* 파일 조회 */
		// int fileno = noticeDao.selectnewfileno(paramMap);

		// paramMap.put("file_no", fileno);

		int statusChange = noticeDao.insertNotice(paramMap);
		return statusChange;
	}

	/** 공지사항 수정 */
	@Override
	public int updateNotice(Map<String, Object> paramMap, HttpServletRequest request) throws Exception {
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;

		String itemFilePath = notice + File.separator;
		FileUtilCho fileUtil = new FileUtilCho(multipartHttpServletRequest, rootPath, itemFilePath);
		Map<String, Object> fileInfo = fileUtil.uploadFiles(); // 실제 럽로드 처리

		String file_addr = "/filepath/FileRepository/" + itemFilePath + "/" + fileInfo.get("file_nm");
		fileInfo.put("file_addr", file_addr);
		paramMap.put("fileInfo", fileInfo);

		// 공지사항 파일 저장 조회
		int oldfileno = noticeDao.selectfileno(paramMap);
		NoticeNewModel noticeModel = noticeDao.noticeDetail(paramMap);

		System.out.println("fileInfo.size() : " + fileInfo.size() + " : " + fileInfo.get("file_nm"));

		if (fileInfo.get("file_nm") != null) {
			// 새로운파일 생성
			noticeDao.insertNofile(paramMap);
		} else {
			paramMap.put("file_no", null);
		}

		// 기존의 정보를 꺼내와서 수정
		int statusChange = noticeDao.updateNotice(paramMap);

		paramMap.put("oldfileno", oldfileno);
		// 기존의 정보를 꺼내와서 삭제
		noticeDao.deleteNofile(paramMap);
		// 수정시 저장소에 저장되어있던 파일까지 삭제
		if (oldfileno > 0) {
			String fullfilepath = noticeModel.getFile_root();

			File oldfile = new File(fullfilepath);
			oldfile.delete();
		}

		return statusChange;
	}

	/* 공지사항 파일 삭제 */
	public int deleteNofile(Map<String, Object> paramMap) throws Exception {

		/* 공지사항 파일 삭제 */
		int ret = noticeDao.deleteNofile(paramMap);

		return ret;
	}

	/** 공지사항 삭제 */
	@Override
	public int deleteNotice(Map<String, Object> paramMap, HttpServletRequest request) throws Exception {
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;

		String itemFilePath = notice + File.separator;
		FileUtilCho fileUtil = new FileUtilCho(multipartHttpServletRequest, rootPath, itemFilePath);
		Map<String, Object> fileInfo = fileUtil.uploadFiles(); // 실제 럽로드 처리

		String file_addr = "/filepath/FileRepository/" + itemFilePath + "/" + fileInfo.get("file_nm");
		fileInfo.put("file_addr", file_addr);
		paramMap.put("fileInfo", fileInfo);

		// 현재 파일 조회
		int fileno = noticeDao.selectfileno(paramMap);
		NoticeNewModel noticeModel = noticeDao.noticeDetail(paramMap);

		System.out.println("fileInfo.size() : " + fileInfo.size() + " : " + fileInfo.get("file_nm"));

		// 기존의 정보를 꺼내와서 삭제
		int statusChange = noticeDao.deleteNotice(paramMap);

		paramMap.put("file_no", fileno);

		noticeDao.deleteNofile2(paramMap);

		/* 디렉토리에서 기존의 파일을 삭제해줌 */
		if (fileno > 0) {
			String fullfilepath = noticeModel.getFile_root();

			File file = new File(fullfilepath);
			file.delete();
		}
		
		return statusChange;
	}

	/* 과제 제출 목록 단건 조회 */
	public NoticeNewModel selectNofile(Map<String, Object> paramMap) throws Exception {

		return noticeDao.selectNofile(paramMap);
	}

}
