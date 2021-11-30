package kr.happyjob.study.lmg.service;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.study.lmg.dao.LmgDAO;
import kr.happyjob.study.lmg.model.LmgListModel;

@Service
public class LmgServiceImpl implements LmgService {
	
	@Autowired
	LmgDAO lmgDAO;

	/*강사전용*/
	@Override
	public List<LmgListModel> listLmgGrp(Map<String, Object> paramMap) throws Exception {
		
		List<LmgListModel> listLmgGrp = lmgDAO.listLmgGrp(paramMap);
		
		return listLmgGrp;
	}

	@Override
	public int countListComnGrpCod(Map<String, Object> paramMap) throws Exception {
		
		int totalCount = lmgDAO.countListComnGrpCod(paramMap);
		
		return totalCount;
	}

	@Override
	public LmgListModel selectLmgGrp(Map<String, Object> paramMap) throws Exception {
		
		LmgListModel lmgListModel = lmgDAO.selectLmgGrp(paramMap);
		
		return lmgListModel;
	}

	@Override
	public int insertLmg(Map<String, Object> paramMap) throws Exception {
		
		int ret = lmgDAO.insertLmg(paramMap);
		
		return ret;
	}

	@Override
	public int updateLmg(Map<String, Object> paramMap) throws Exception {
		
		int ret = lmgDAO.updateLmg(paramMap);
		
		return ret;
	}

	@Override
	public int deleteLmg(Map<String, Object> paramMap) throws Exception {
		
		int ret = lmgDAO.deleteLmg(paramMap);
		
		return ret;
	}
	
	// 강사 selectBox
	@Override
	public List<LmgListModel> initComCod(Map<String, Object> paramMap) throws Exception {
		List<LmgListModel> initComCod = lmgDAO.initComCod(paramMap);
		
		return initComCod;
	}
	
	/*학생전용*/
	@Override
	public List<LmgListModel> listLgmStudent(Map<String, Object> paramMap) throws Exception {
		
		List<LmgListModel> listLgmStudent = lmgDAO.listLgmStudent(paramMap);
		
		return listLgmStudent;
	}

	@Override
	public LmgListModel selectLmgStudent(Map<String, Object> paramMap) throws Exception {
		
		LmgListModel selectLmgStudent = lmgDAO.selectLmgStudent(paramMap);
		
		return selectLmgStudent;
	}

	
	@Override
	public int countListComnGrpCodStu(Map<String, Object> paramMap) throws Exception {
		
		int totalCount = lmgDAO.countListComnGrpCodStu(paramMap);
		
		return totalCount;
	}
	
	/**
	 * 강의 계획서 및 공지
	 * 20211128 개발
	 */
	@Override
	public List<LmgListModel> lecturePlanData(Map<String, Object> paramMap) throws Exception {
		
		List<LmgListModel> listLmgGrp = lmgDAO.lecturePlanData(paramMap);
		
		return listLmgGrp;
	}
	
	/**
	 * 강의 계획서 및 공지 개수
	 * 20211128 개발
	 */
	@Override
	public int countlecturePlanData(Map<String, Object> paramMap) throws Exception {
		
		int totalCount = lmgDAO.countlecturePlanData(paramMap);
		
		return totalCount;
	}


}
