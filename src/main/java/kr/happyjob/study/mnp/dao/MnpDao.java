package kr.happyjob.study.mnp.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.mnp.model.MnpModel;

public interface MnpDao {
	
	/* 강사 관련 */
	public List<MnpModel> selectMemberList(Map<String, Object> paramMap);
	
	public void deleteMemberList(List<String> list);
	
	public int selectListCountTypeD(Map<String, Object> paramMap);
	
	/* 학생 관련 */
	public List<MnpModel> selectMemberListTypeC(Map<String, Object> paramMap);
	
	public void deleteMemberListTypeC(List<String> list);
	
	public int selectListCountTypeC(Map<String, Object> paramMap);
}
