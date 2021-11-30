package kr.happyjob.study.statistics.dao;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.happyjob.study.lmg.model.ClassInfo;
import kr.happyjob.study.lmg.model.StuNumChart;
import kr.happyjob.study.statistics.model.ExamStatistics;

@Repository
public interface StatisticsDAO {

	List<ExamStatistics> getExamStatistics(Map<String, Object> paramMap) throws Exception;

	int getExamStatisticsCnt() throws Exception;

	Integer getStuCnt(int ci_no) throws Exception;

	List<ExamStatistics> getExamChart(Map<String, Object> paramMap) throws Exception;

	List<ClassInfo> getClassInfo(Map<String, Object> map) throws Exception;

	int getClassStudentNum(int ci_no) throws Exception;

	List<StuNumChart> getDateGroup(Map<String, Object> map) throws Exception;

	int getClassInfoCnt(Map<String, Object> map) throws Exception;

}
