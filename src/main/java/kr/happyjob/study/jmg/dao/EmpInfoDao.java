package kr.happyjob.study.jmg.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.jmg.model.EmpInfoModel;
import kr.happyjob.study.jmg.model.ResuMgtDtlModel;
import kr.happyjob.study.system.model.ComnDtlCodModel;

public interface EmpInfoDao {

	public List<EmpInfoModel> empInfoList(Map<String, Object> paramMap)throws Exception ;
	
	public int empInfoCnt(Map<String, Object> paramMap)throws Exception ;
	
	public int deleteEmpInfo(Map<String, Object> paramMap) throws Exception;
	
	public EmpInfoModel selectEmpInfo(Map<String, Object> paramMap);
	
	public List<EmpInfoModel> empInfoAddList(Map<String, Object> paramMap)throws Exception ;
	
	public int empInfoAddCnt(Map<String, Object> paramMap)throws Exception ;
	
	// 취업 등록
	public EmpInfoModel fRegist(Map<String, Object> paramMap) throws Exception;
	
	// 취업 등록 저장
	public int insertEmpList(Map<String, Object> paramMap) throws Exception;
	
	public int updateEmpList(Map<String, Object> paramMap) throws Exception;
}
