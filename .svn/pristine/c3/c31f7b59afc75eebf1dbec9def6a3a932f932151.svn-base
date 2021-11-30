package kr.happyjob.study.lmg.service;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.lmg.model.InquireExam;
import kr.happyjob.study.lmg.model.Test;
import kr.happyjob.study.lmg.model.TestInfoSumClass;

public interface LmgExamCService {
	// 현재 유저에 해당되는 시험 정보 불러오기
	Map<String, Object> getExam(String loginId, int pageNo) throws Exception;

	List<Test> getExamInfo(Map<String, Object> paramMap) throws Exception;

	int submitExam(Map<String, Object> paramMap) throws Exception;

	Map<String, Object> inquireExam(Map<String, Object> paramMap) throws Exception;
	
}
