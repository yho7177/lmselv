package kr.happyjob.study.statistics.service;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.statistics.model.ExamStatistics;

public interface StatisticsService {

	List<ExamStatistics> getExamStatistics(Map<String, Object> paramMap) throws Exception;

	int getExamStatisticsCnt() throws Exception;

	Integer getStuCnt(int ci_no) throws Exception;

	List<ExamStatistics> getExamChart(Map<String, Object> paramMap) throws Exception;

	Map<String, Object> getStudentNumForClass(Map<String, Object> paramMap) throws Exception;


}
