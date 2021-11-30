package kr.happyjob.study.lsp.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.study.lsp.dao.LearnMtrDao;
import kr.happyjob.study.lsp.model.LearnMtrStudtModel;
import kr.happyjob.study.lsp.model.LearnMtrTeachModel;

@Service
public class LearnMtrServiceImpl implements LearnMtrService{

@Autowired
LearnMtrDao learnMtrDao;



public List<LearnMtrTeachModel> initDocument(Map<String, Object> paramMap) throws Exception {
	
	List<LearnMtrTeachModel> listMtrTeachModel = learnMtrDao.initDocument(paramMap);
	
	return listMtrTeachModel;
	
	}


public List<LearnMtrStudtModel> initDocument2(Map<String, Object> paramMap) throws Exception {

	List<LearnMtrStudtModel> listMtrStudtModel = learnMtrDao.initDocument2(paramMap);

	return listMtrStudtModel;

	}

public List<LearnMtrTeachModel> listMtrTeachDoc(Map<String, Object> paramMap) throws Exception {
	
	List<LearnMtrTeachModel> listMtrTeachModel = learnMtrDao.listMtrTeachDoc(paramMap);
	
	return listMtrTeachModel;
	}


public List<LearnMtrTeachModel> listMtrTeachDoc2(Map<String, Object> paramMap) throws Exception {
	
	List<LearnMtrTeachModel> listMtrTeachModel2 = learnMtrDao.listMtrTeachDoc2(paramMap);
	
	return listMtrTeachModel2;
	}


public int countListMtrTeachDoc(Map<String, Object> paramMap) throws Exception{
	
	int totalCount = learnMtrDao.countListMtrTeachDoc(paramMap);
	
	return totalCount;
	}


public int countListMtrTeachDoc2(Map<String, Object> paramMap) throws Exception{
	
	int totalCount2 = learnMtrDao.countListMtrTeachDoc2(paramMap);
	
	return totalCount2;
	}


public LearnMtrTeachModel selectMtrTeach(Map<String, Object> paramMap) throws Exception{
	
	return learnMtrDao.selectMtrTeach(paramMap);
	}


public LearnMtrTeachModel selectMtrTeach2(Map<String, Object> paramMap) throws Exception{
	
	return learnMtrDao.selectMtrTeach2(paramMap);
	}

// 자료등록 저장
public int insertMtrTeach(Map<String, Object> paramMap) throws Exception{
	
	int ret = learnMtrDao.insertMtrTeach(paramMap);
	
	return ret;
	}

// 자료등록 수정
public int updateMtrTeach(Map<String, Object> paramMap) throws Exception{
	
	int ret = learnMtrDao.updateMtrTeach(paramMap);
	
	return ret;
	}

// 자료등록 삭제
public int deleteMtrTeach(Map<String, Object> paramMap) throws Exception{
	
	int ret = learnMtrDao.deleteMtrTeach(paramMap);
	
	return ret;
	}

// 올려진 자료목록 조회
public List<LearnMtrStudtModel> listMtrStudt(Map<String, Object> paramMap) throws Exception{
	
	List<LearnMtrStudtModel> listMtrStudtModel = learnMtrDao.listMtrStudt(paramMap);
	
	return listMtrStudtModel;
	}

// 올려진 자료 카운트 조회
public int countListMtrStudt(Map<String, Object> paramMap) throws Exception{
	
	int totalCount = learnMtrDao.countListMtrStudt(paramMap);
	
	return totalCount;
	}	

// 올려진 자료 단건조회
public LearnMtrStudtModel selectMtrStudt(Map<String, Object> paramMap) throws Exception{
	
	return learnMtrDao.selectMtrStudt(paramMap);
	}
}
