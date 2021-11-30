package kr.happyjob.study.jmg.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.study.jmg.dao.ResuMgtDao;
import kr.happyjob.study.jmg.model.ResuMgtDtlModel;
import kr.happyjob.study.jmg.model.ResuMgtModel;

@Service
public class ResuMgtServiceImpl implements ResuMgtService {
	
	@Autowired
	ResuMgtDao resuMgtDao;
	// 과목 목록 조회
	@Override
	public List<ResuMgtModel> resuMgtList(Map<String, Object> paramMap) throws Exception {

		List<ResuMgtModel> resuMgtList = resuMgtDao.resuMgtList(paramMap);
		return resuMgtList;
	}
	// 과정 목록 카운트 조회
	@Override
	public int resuMgtCnt(Map<String, Object> paramMap) throws Exception {
		
		int resuMgtCnt = resuMgtDao.resuMgtCnt(paramMap);
		return resuMgtCnt;
	}
	// 과정 단건 조회
	@Override
	public ResuMgtModel selectResuMgt(Map<String, Object> paramMap) throws Exception {
		
		ResuMgtModel resuMgtModel = resuMgtDao.selectResuMgt(paramMap);
		return resuMgtModel;
	}
	// 과정 내 이력서 목록 조회
	@Override
	public List<ResuMgtDtlModel> listResuMgtDtl(Map<String, Object> paramMap) throws Exception {
		
		List<ResuMgtDtlModel> listResuMgtDtl = resuMgtDao.listResuMgtDtl(paramMap);
		// 어떤사람이 몇번 테스트를 봤는지 1 ~ 5 점수를 다다하면
		
		return listResuMgtDtl;
	}
	// 과정 내 이력서 목록 카운트 조회
	@Override
	public int countListResuMgtDtl(Map<String, Object> paramMap) throws Exception {
		
		int totalCount = resuMgtDao.countListResuMgtDtl(paramMap);
		
		return totalCount;
	}
	// 과정 내 이력서 목록 단건 조회
	@Override
	public ResuMgtDtlModel selectResuMgtDtl(Map<String, Object> paramMap) throws Exception {
		
		ResuMgtDtlModel resuMgtDtlModel = resuMgtDao.selectResuMgtDtl(paramMap);
		
		return resuMgtDtlModel;
	}
	
	
	
	
}
