package kr.happyjob.study.jmg.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.jmg.model.ResuMgtDtlModel;
import kr.happyjob.study.jmg.model.ResuMgtModel;

public interface ResuMgtDao {

	// 과목 목록 조회
	public List<ResuMgtModel> resuMgtList(Map<String, Object> paramMap);
	
	// 과정 목록 카운트 조회
	public int resuMgtCnt(Map<String, Object> paramMap);
	
	// 과정 단건 조회
	public ResuMgtModel selectResuMgt(Map<String,Object> paramMap);
	
	// 학생 목록 조회
	public List<ResuMgtDtlModel> listResuMgtDtl(Map<String, Object> paramMap);
	
	// 학생 목록 카운트 조회
	public int countListResuMgtDtl(Map<String, Object> paramMap);
	
	// 학생 목록 단건 조회
	public ResuMgtDtlModel selectResuMgtDtl(Map<String, Object> paramMap);
	
	// 이력서 조회
	public ResuMgtDtlModel resumeInfo(Map<String, Object> paramMap);
}
