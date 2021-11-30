package kr.happyjob.study.lsp.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.lsp.model.lectureNewModel;


public interface lectureNewDao {
	
	// 공지사항 리스트 조회
	public List<lectureNewModel> lectureList(Map<String, Object> paramMap)throws Exception;
	
	// 공지사항 목록 카운트 조회
	public int lectureCnt(Map<String, Object> paramMap)throws Exception;
	
	// 공지사항 단건 조회
	public lectureNewModel lectureDetail(Map<String, Object> paramMap)throws Exception;
	
	// 공지사항 저장
	public int insertlecture(Map<String, Object> paramMap)throws Exception;
	
	// 공지사항 수정
	public int updatelecture(Map<String, Object> paramMap)throws Exception;
	
	// 공지사항 삭제
	public int deletelecture(Map<String, Object> paramMap)throws Exception;
	
	/* 공지사항 제출 파일 저장 */
	public int insertNofile(Map<String, Object> paramMap) throws Exception;
	
	// 파일 조회 
	public int selectfileno(Map<String, Object> paramMap) throws Exception;
	
	//파일삭제
	public int deleteNofile(Map<String, Object> paramMap)throws Exception;
	
	/* 파일 삭제 */
	public int deleteNofile2(Map<String, Object> paramMap) throws Exception;
	
	//파일조회
	public lectureNewModel selectNofile(Map<String, Object> paramMap)throws Exception;


}
