package kr.happyjob.study.lsp.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.happyjob.study.lsp.model.NoticeNewModel;


public interface NoticeNewService {

	// 공지사항 리스트 조회
	public List<NoticeNewModel> noticeList(Map<String, Object> paramMap) throws Exception;

	// 공지사항 목록 카운트 조회
	public int noticeCnt(Map<String, Object> paramMap) throws Exception;
	
	// 공지사항 단건 조회
	public NoticeNewModel noticeDetail(Map<String, Object> paramMap) throws Exception;
	
	// 공지사항 저장
	public int insertNotice(Map<String, Object> paramMap , HttpServletRequest request)throws Exception;
	
	// 공지사항 수정
	public int updateNotice(Map<String, Object> paramMap, HttpServletRequest request)throws Exception;

	// 공지사항 삭제
	public int deleteNotice(Map<String, Object> paramMap, HttpServletRequest request)throws Exception;
	
	/* 파일 삭제 */
	public int deleteNofile(Map<String, Object> paramMap) throws Exception;
	
	//파일조회
	public NoticeNewModel selectNofile(Map<String, Object> paramMap) throws Exception;

	

}
