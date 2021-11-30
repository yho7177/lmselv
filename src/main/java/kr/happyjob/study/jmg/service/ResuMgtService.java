package kr.happyjob.study.jmg.service;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.jmg.model.ResuMgtDtlModel;
import kr.happyjob.study.jmg.model.ResuMgtModel;

public interface ResuMgtService {

	// 과목 목록 조회
	public List<ResuMgtModel> resuMgtList(Map<String, Object> paramMap) throws Exception;

	// 과정 목록 카운트 조회
	public int resuMgtCnt(Map<String, Object> paramMap) throws Exception;

	// 과정 단건 조회
	public ResuMgtModel selectResuMgt(Map<String, Object> paramMap) throws Exception;

	// 과정 내 이력서 목록 조회
	public List<ResuMgtDtlModel> listResuMgtDtl(Map<String, Object> paramMap) throws Exception;

	// 과정 내 이력서 목록 카운트 조회
	public int countListResuMgtDtl(Map<String, Object> paramMap) throws Exception;

	// 과정 내 이력서 목록 단건 조회
	public ResuMgtDtlModel selectResuMgtDtl(Map<String, Object> paramMap) throws Exception;
	
}
