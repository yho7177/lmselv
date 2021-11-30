package kr.happyjob.study.lsp.service;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.lmg.model.HomeworkSubModel;
import kr.happyjob.study.lsp.model.LearnMtrStudtModel;
import kr.happyjob.study.lsp.model.LearnMtrTeachModel;

public interface LearnMtrService {
		
	
	public List<LearnMtrTeachModel> initDocument(Map<String, Object> paramMap) throws Exception ;
	
	
	public List<LearnMtrStudtModel> initDocument2(Map<String, Object> paramMap) throws Exception ;

	
	public List<LearnMtrTeachModel> listMtrTeachDoc(Map<String, Object> paramMap) throws Exception ;
	
	
	public List<LearnMtrTeachModel> listMtrTeachDoc2(Map<String, Object> paramMap) throws Exception ;
	
	
	public int countListMtrTeachDoc(Map<String, Object> paramMap) throws Exception;
	
	
	public int countListMtrTeachDoc2(Map<String, Object> paramMap) throws Exception;
	
	
	public LearnMtrTeachModel selectMtrTeach(Map<String, Object> paramMap) throws Exception;

	
	public LearnMtrTeachModel selectMtrTeach2(Map<String, Object> paramMap) throws Exception;
	
	// 자료등록 저장
	public int insertMtrTeach(Map<String, Object> paramMap) throws Exception;
	
	// 자료등록 수정
	public int updateMtrTeach(Map<String, Object> paramMap) throws Exception;
	
	// 자료등록 삭제
	public int deleteMtrTeach(Map<String, Object> paramMap) throws Exception;
	
	// 올려진 자료목록 조회
	public List<LearnMtrStudtModel> listMtrStudt(Map<String, Object> paramMap) throws Exception;
	
	// 올려진 자료 카운트 조회
	public int countListMtrStudt(Map<String, Object> paramMap) throws Exception;
	
	// 올려진 자료 단건조회
	public LearnMtrStudtModel selectMtrStudt(Map<String, Object> paramMap) throws Exception;
	
	
}
