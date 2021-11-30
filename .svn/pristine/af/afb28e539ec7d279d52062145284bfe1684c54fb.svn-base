package kr.happyjob.study.lmg.service;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.lmg.model.LmgListModel;

public interface LmgService {
	
	/*강사전용*/
	//강의 목록 조회
	public List<LmgListModel> listLmgGrp(Map<String, Object> paramMap) throws Exception;
	
	// 강의 목록 카운트 조회
	public int countListComnGrpCod(Map<String, Object> paramMap) throws Exception;
	
	//강의 단건 조회
	public LmgListModel selectLmgGrp(Map<String, Object> paramMap) throws Exception;
	
	//강의 저장
	public int insertLmg(Map<String, Object> paramMap) throws Exception;
	
	//강의 수정
	public int updateLmg(Map<String, Object> paramMap) throws Exception;
	
	//강의삭제
	public int deleteLmg(Map<String, Object> paramMap) throws Exception;
	
	/*학생전용*/
	//강의 목록 조회
	public List<LmgListModel> listLgmStudent(Map<String, Object> paramMap) throws Exception;
	
	//강의 단건 조회
	public LmgListModel selectLmgStudent(Map<String, Object> paramMap) throws Exception;
	
	// 강사 selectBox
	public List<LmgListModel> initComCod(Map<String, Object> paramMap) throws Exception;
	
	// 학생 강의 목록 카운트 조회
	public int countListComnGrpCodStu(Map<String, Object> paramMap) throws Exception;
	
	/**
	 * 강의 계획서 및 공지
	 * 20211128 개발
	 */
	//강의계획서 및 공지 목록 조회
	public List<LmgListModel> lecturePlanData(Map<String, Object> paramMap) throws Exception;
	
	/**
	 * 강의 계획서 및 공지 개수
	 * 20211128 개발
	 */
	//강의계획서 및 공지 목록 개수
	public int countlecturePlanData(Map<String, Object> paramMap) throws Exception;

}
