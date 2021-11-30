package kr.happyjob.study.lmg.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.lmg.model.HomeworkMgtModel;
import kr.happyjob.study.lmg.model.HomeworkSubModel;

public interface HomeworkDao {
	
	/* 강사 강의명 콤보박스 */
	public List<HomeworkMgtModel> initHomework(Map<String, Object> paramMap) throws Exception;
	
	/* 학생 강의명 콤보박스 */
	public List<HomeworkSubModel> initHomework2(Map<String, Object> paramMap) throws Exception;

	/* 강사별 과제 목록 조회 */
	public List<HomeworkMgtModel> listHomeworkMgt(Map<String, Object> paramMap) throws Exception;
	
	/* 학생별 과제 목록 조회 */
	public List<HomeworkMgtModel> listHomeworkMgt2(Map<String, Object> paramMap) throws Exception;
	
	/* 강사별 과제 목록 카운트 조회 */
	public int countListHomeworkMgt(Map<String, Object> paramMap);
	
	/* 학생별 과제 목록 카운트 조회 */
	public int countListHomeworkMgt2(Map<String, Object> paramMap) throws Exception;
	
	/* 강사가 강의중인 목록 단건 조회 */
	public HomeworkMgtModel selectHwMgt(Map<String, Object> paramMap) throws Exception;
	
	/* 학생이 수강중인 목록 단건 조회 */
	public HomeworkMgtModel selectHwMgt2(Map<String, Object> paramMap) throws Exception;
	
	/* 과제 등록 저장 */
	public int insertHwMgt(Map<String, Object> paramMap) throws Exception;
	
	/* 과제 등록 수정 */
	public int updateHwMgt(Map<String, Object> paramMap) throws Exception;
	
	/* 과제 등록 삭제 */
	public int deleteHwMgt(Map<String, Object> paramMap) throws Exception;

	/* 과제 제출 목록 조회 */
	public List<HomeworkSubModel> listHomeworkSub(Map<String, Object> paramMap) throws Exception;

	/* 과제 제출 목록 카운트 조회 */
	public int countListHomeworkSub(Map<String, Object> paramMap);
	
	/* 과제 제출 목록 단건 조회 */
	public HomeworkSubModel selectHwSub(Map<String, Object> paramMap) throws Exception;
	
	/* 과제 제출 저장 */
	public int insertHwSub(Map<String, Object> paramMap) throws Exception;
	
	/* 과제 제출 파일 저장 */
	public int insertHwfile(Map<String, Object> paramMap) throws Exception;
	
	/* 파일 조회 */
	public int selectfileno(Map<String, Object> paramMap) throws Exception;
	
	/* 파일 삭제 */
	public int updateHwfile(Map<String, Object> paramMap) throws Exception;
	
	/* 파일 삭제 */
	public int deleteHwfile(Map<String, Object> paramMap) throws Exception;
	
	/* 파일 삭제 */
	public int deleteHwfile2(Map<String, Object> paramMap) throws Exception;
	
	/* 과제 제출 수정 */
	public int updateHwSub(Map<String, Object> paramMap) throws Exception;
	
	/* 과제 등록 삭제 */
	public int deleteHwSub(Map<String, Object> paramMap) throws Exception;
}
