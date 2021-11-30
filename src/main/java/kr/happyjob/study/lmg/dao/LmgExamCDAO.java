package kr.happyjob.study.lmg.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.lmg.model.InquireExam;
import kr.happyjob.study.lmg.model.Test;
import kr.happyjob.study.lmg.model.TestInfoSumClass;

public interface LmgExamCDAO {

	List<TestInfoSumClass> getExam(Map<String, Object> paramMap) throws Exception;

	int getCompareResult(Map<String, Object> paramMap) throws Exception;

	int getTotCntExamByUser(Map<String, Object> map) throws Exception;

	List<Test> getExamInfo(Map<String, Object> paramMap) throws Exception;

	int submitExam(Map<String, Object> paramMap) throws Exception;
	// 시험 조회
	List<InquireExam> inquireExam(Map<String, Object> paramMap) throws Exception;

}
