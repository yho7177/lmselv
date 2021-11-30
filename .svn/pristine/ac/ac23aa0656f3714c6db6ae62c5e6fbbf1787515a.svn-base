package kr.happyjob.study.mnp.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.study.mnp.dao.MnpDao;
import kr.happyjob.study.mnp.model.MnpModel;

@Service
public class MnpServiceImpl implements MnpService {
	
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());
	
	// Get class name for logger
	private final String className = this.getClass().toString();
	
	@Autowired
	MnpDao mnpDao;

	@Override
	public List<MnpModel> selectMemberList(Map<String, Object> paramMap) throws Exception {
		
		// 검색일이 25일이면 24일까지만 조회돼서 시간도 추가해줌.
		String edate = paramMap.get("endDate")+" 23:59:59.0";
		paramMap.put("endDate", edate);

		List<MnpModel> list= mnpDao.selectMemberList(paramMap);
		
		logger.info("+ Start " + className + ".MnpServiceImpl");
		logger.info("   - paramMap : " + paramMap);
		logger.info("   - list : " + list);
		
		return list;
	}

	@Override
	public void deleteMemberList(List<String> list) throws Exception {
		
		mnpDao.deleteMemberList(list);
	}

	@Override
	public List<MnpModel> selectMemberListTypeC(Map<String, Object> paramMap) throws Exception {
		
		List<MnpModel> list= mnpDao.selectMemberListTypeC(paramMap);
		
		logger.info("+ Start " + className + ".selectMemberListTypeC");
		logger.info("   - paramMap : " + paramMap);
		logger.info("   - list : " + list);
		
		return list;
	}

	@Override
	public void deleteMemberListTypeC(List<String> list) throws Exception {
		
		mnpDao.deleteMemberListTypeC(list);
	}

	@Override
	public int selectListCountTypeD(Map<String, Object> paramMap) throws Exception {
		
		int count = mnpDao.selectListCountTypeD(paramMap);
		System.out.println("count: " + count);
		return count;
	}

	@Override
	public int selectListCountTypeC(Map<String, Object> paramMap) throws Exception {

		int count = mnpDao.selectListCountTypeC(paramMap);
		return count;
	}

}
