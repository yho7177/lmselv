package kr.happyjob.study.jmg.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.study.jmg.dao.EmpInfoDao;
import kr.happyjob.study.jmg.model.EmpInfoModel;

@Service
public class EmpInfoServiceImpl implements EmpInfoService {
	
	@Autowired
	EmpInfoDao empInfoDao;

	@Override
	public List<EmpInfoModel> empInfoList(Map<String, Object> paramMap) throws Exception {
		
		List<EmpInfoModel> empInfoList = empInfoDao.empInfoList(paramMap);
		
		return empInfoList;
	}

	@Override
	public int empInfoCnt(Map<String, Object> paramMap) throws Exception {
		
		int empInfoCnt = empInfoDao.empInfoCnt(paramMap);
		
		return empInfoCnt;
	}

	@Override
	public int deleteEmpInfo(Map<String, Object> paramMap) throws Exception {
		
		int deleteEmpInfo = empInfoDao.deleteEmpInfo(paramMap);
		return deleteEmpInfo;
	}

	@Override
	public EmpInfoModel selectEmpInfo(Map<String, Object> paramMap) throws Exception {
		
		EmpInfoModel empInfoModel = empInfoDao.selectEmpInfo(paramMap);
		return empInfoModel;
	}

	@Override
	public List<EmpInfoModel> empInfoAddList(Map<String, Object> paramMap) throws Exception {
		
		List<EmpInfoModel> empInfoAddList = empInfoDao.empInfoAddList(paramMap);
		return empInfoAddList;
	}

	@Override
	public int empInfoAddCnt(Map<String, Object> paramMap) throws Exception {
		
		int empInAddfoCnt = empInfoDao.empInfoAddCnt(paramMap);
		
		return empInAddfoCnt;
	}

	@Override
	public EmpInfoModel fRegist(Map<String, Object> paramMap) throws Exception {
		EmpInfoModel empInfoModel = empInfoDao.fRegist(paramMap);
		return empInfoModel;
	}

	@Override
	public int insertEmpList(Map<String, Object> paramMap) throws Exception {
		
		int insertEmpList = empInfoDao.insertEmpList(paramMap);
		return insertEmpList;
	}

	@Override
	public int updateEmpList(Map<String, Object> paramMap) throws Exception {
		
		int updateEmpList = empInfoDao.updateEmpList(paramMap);
		return updateEmpList;
	}
	
	
}
